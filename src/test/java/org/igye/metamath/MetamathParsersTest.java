package org.igye.metamath;

import com.fasterxml.jackson.core.type.TypeReference;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.commons.io.FileUtils;
import org.igye.common.Utils;
import org.igye.metamath.typesetting.TypesettingData;
import org.igye.metamath.typesetting.TypesettingDefinition;
import org.igye.metamath.typesetting.TypesettingKeyword;
import org.igye.textparser.ParserUtils;
import org.junit.Ignore;
import org.junit.Test;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import static org.igye.metamath.MetamathParsers.strToInt;
import static org.igye.metamath.MetamathTools.stringify;
import static org.igye.metamath.TestUtils.tokenStreamFromString;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class MetamathParsersTest {

    @Test
    public void load_shouldDefineFramesForAllAxiomsAndTheorems() {
        //when
        final MetamathDatabase database = MetamathParsers.load(Utils.inputStreamFromClasspath("/demo0.mm"));
//        final MetamathDatabase database = MetamathParsers.load("D:\\Install\\metamath\\metamath\\set.mm");

        //then
        assertEquals("[[], [], term 0]", stringify(database.getStatement("tze").getFrame()));
        assertEquals("[[term t, term r], [], term ( t + r )]", stringify(database.getStatement("tpl").getFrame()));
        assertEquals("[[term t, term r], [], wff t = r]", stringify(database.getStatement("weq").getFrame()));
        assertEquals("[[wff P, wff Q], [], wff ( P -> Q )]", stringify(database.getStatement("wim").getFrame()));
        assertEquals(
                "[[term t, term r, term s], [], |- ( t = r -> ( t = s -> r = s ) )]",
                stringify(database.getStatement("a1").getFrame())
        );
        assertEquals("[[term t], [], |- ( t + 0 ) = t]", stringify(database.getStatement("a2").getFrame()));
        assertEquals("[[wff P, wff Q], [|- P, |- ( P -> Q )], |- Q]", stringify(database.getStatement("mp").getFrame()));
    }

    @Test
    public void load_shouldAddDescriptionsToAllAssertions() {
        //when
        final MetamathDatabase database = MetamathParsers.load(Utils.inputStreamFromClasspath("/demo0.mm"));

        //then
        assertEquals("Define the modus ponens inference rule", database.getStatement("mp").getDescription());
        assertEquals("Prove a theorem", database.getStatement("th1").getDescription());
        assertEquals(
                "A theorem with invalid proof (two proof steps were swapped in comparison to the previous theorem)",
                database.getStatement("th2").getDescription()
        );
    }

    @Test
    public void load_shouldParseTypesetting() {
        //when
        final MetamathDatabase database = MetamathParsers.load(Utils.inputStreamFromClasspath("/demo0-with-typesetting.mm"));
//        final MetamathDatabase database = MetamathParsers.load("D:\\Install\\metamath\\metamath\\set.mm");

        //then
        System.out.println("database.getTypesetting().size() = " + database.getTypesetting().size());
        assertTrue(database.getTypesetting().size() > 10);
    }

    @Test
    @Ignore
    public void exploreTypesetting() throws IOException {
        final File allAltHtmldefFile = new File("D:\\programs\\java\\text-parser\\target/typesetting-all-althtmldef.json");
        if (false) {
            final MetamathDatabase database = MetamathParsers.load("D:\\Install\\metamath\\metamath\\set.mm");
            System.out.println("database.getTypesetting().size() = " + database.getTypesetting().size());
            final List<TypesettingDefinitionDto> dtos = database.getTypesetting().stream()
                    .filter(t -> t.getType().equals("althtmldef"))
                    .map(this::toDto)
                    .collect(Collectors.toList());
            System.out.println("dtos.size() = " + dtos.size());
            FileUtils.writeStringToFile(
                    allAltHtmldefFile,
                    Utils.toJson(dtos),
                    StandardCharsets.UTF_8
            );
        } else {
            final String allAltHtmldefStr = FileUtils.readFileToString(allAltHtmldefFile, StandardCharsets.UTF_8);
            final List<TypesettingDefinitionDto> dtos = Utils.parse(
                    allAltHtmldefStr,
                    new TypeReference<List<TypesettingDefinitionDto>>() {}
            );
            System.out.println("dtos.size() = " + dtos.size());


            final List<TypesettingDefinitionDto> unrecognized = dtos.stream()
                    .filter(def -> !knownAltHtmlDef(def))
                    .collect(Collectors.toList());
            System.out.println("unrecognized.size() = " + unrecognized.size());
            FileUtils.writeStringToFile(
                    new File("D:\\programs\\java\\text-parser\\target/typesetting-unrecognized.json"),
                    Utils.toJson(unrecognized),
                    StandardCharsets.UTF_8
            );
        }
    }

    @Test
    public void parse_shouldParseMetamathFile() {
        //when
        List<Statement> statements = MetamathParsers.parse(Utils.inputStreamFromClasspath("/peano.mm")).getRight();
//        List<Statement> statements = MetamathParsers.parse("D:\\Install\\metamath\\metamath\\set.mm");

        //then
        assertTrue(statements.size() > 0);
    }

    @Test
    public void preprocess_shouldPreprocessMetamathFile() throws FileNotFoundException {
        //when
        final InputStream inputStream = Utils.inputStreamFromClasspath("/peano.mm");
//        final InputStream inputStream = new FileInputStream("D:\\Install\\metamath\\metamath\\set.mm");

        final ParserUtils.Preprocessed preprocessed = ParserUtils.preprocess(
                inputStream,
                MetamathParsers.createParseConfig()
        );

        //then
        assertTrue(preprocessed.getCode().size() > 0);
        assertTrue(preprocessed.getComments().size() > 0);
    }

    @Test
    public void nonLabeledListStatement_shouldParseNonLabeledListStatement() {
        //when
        ListStatement statement = MetamathParsers.nonLabeledListStatement().parse(
                tokenStreamFromString("$v A B C $.")
        ).get();

        //then
        assertEquals(ListStatementType.VARIABLE, statement.getType());
        assertEquals(Arrays.asList("A","B","C"), statement.getSymbols());
    }

    @Test
    public void statement_shouldParseStatement() {
        //when
        Statement statement = MetamathParsers.statement().parse(
                tokenStreamFromString("$v s t u s0 s1 t0 t1 $.\n\nts $f term s $.\ntt $f term t $.\n")
        ).get();

        //then
        assertEquals(ListStatementType.VARIABLE, ((ListStatement) statement).getType());
    }

    @Test
    public void labeledListStatement_shouldParseLabeledListStatement() {
        //when
        ListStatement statement = MetamathParsers.labeledListStatement().parse(
                tokenStreamFromString("dummylink.1 $e |- ph $.")
        ).get();

        //then
        assertEquals("dummylink.1", statement.getLabel());
        assertEquals(ListStatementType.ESSENTIAL, statement.getType());
        assertEquals(Arrays.asList("|-","ph"), statement.getSymbols());
    }

    @Test
    public void theoremStatement_shouldParseTheoremStatement() {
        //when
        ListStatement statement = MetamathParsers.theoremStatement().parse(
                tokenStreamFromString("hlhilphllem $p |- ( ph -> U e. PreHil ) $=\n" +
                        "        va vb vc vd $.")
        ).get();

        //then
        assertEquals("hlhilphllem", statement.getLabel());
        assertEquals(ListStatementType.THEOREM, statement.getType());
        assertEquals(Arrays.asList("|-","(","ph","->","U","e.","PreHil",")"), statement.getSymbols());
        assertEquals(Arrays.asList("va", "vb", "vc", "vd"), statement.getProof());
    }

    @Test
    public void theoremStatement_shouldParseTheoremStatementWithCompressedProof() {
        //when
        ListStatement statement = MetamathParsers.theoremStatement().parse(
                tokenStreamFromString("mp2 $p |- ch $=\n      ( wi ax-mp ) BCEABCGDFHH $.")
        ).get();

        //then
        assertEquals("mp2", statement.getLabel());
        assertEquals(ListStatementType.THEOREM, statement.getType());
        assertEquals(Arrays.asList("|-","ch"), statement.getSymbols());
        assertEquals(Arrays.asList("wi", "ax-mp"), statement.getCompressedProof().getLabels());
        assertEquals("BCEABCGDFHH", statement.getCompressedProof().getEncodedProof());
    }

    @Test
    public void compressedProof_shouldParseCompressedProof() {
        //when
        CompressedProof proof = MetamathParsers.compressedProof().parse(
                tokenStreamFromString("( wi ax-mp ) BCEABCGDFHH ")
        ).get();

        //then
        assertEquals(Arrays.asList("wi", "ax-mp"), proof.getLabels());
        assertEquals("BCEABCGDFHH", proof.getEncodedProof());
    }

    @Test
    public void compressedProof_shouldParseCompressedProofWhenTheProofConsistsOfFewParts() {
        //when
        CompressedProof proof = MetamathParsers.compressedProof().parse(
                tokenStreamFromString("( wi ax-mp ) BCEAB\n   CGDFHH ")
        ).get();

        //then
        assertEquals(Arrays.asList("wi", "ax-mp"), proof.getLabels());
        assertEquals("BCEABCGDFHH", proof.getEncodedProof());
    }

    @Test
    public void blockStatement_shouldParseBlockStatement() {
        //when
        BlockStatement statement = MetamathParsers.blockStatement().parse(tokenStreamFromString(
                "${\n" +
                        "    dummylink.1 $e |- ph $.\n" +
                        "    $v |- ps $.\n" +
                        "    \n" +
                        "    dummylink $p |- ph $=\n" +
                        "      (  ) C $.\n" +
                        "  $}"
        )).get();

        //then
        assertEquals(ListStatementType.ESSENTIAL, ((ListStatement) statement.getContent().get(0)).getType());
        assertEquals(ListStatementType.VARIABLE, ((ListStatement) statement.getContent().get(1)).getType());
        assertEquals(ListStatementType.THEOREM, ((ListStatement) statement.getContent().get(2)).getType());
    }

    @Test
    public void blockStatement_shouldParseEmptyBlockStatement() {
        //when
        BlockStatement statement = MetamathParsers.blockStatement().parse(tokenStreamFromString(
                "${\n  $}"
        )).get();

        //then
        assertTrue(statement.getContent().isEmpty());
    }

    @Test
    public void strToInt_shouldParseNumbersFromCompressedProofs() {
        assertEquals(1, strToInt("A"));
        assertEquals(2, strToInt("B"));
        assertEquals(20, strToInt("T"));
        assertEquals(21, strToInt("UA"));
        assertEquals(22, strToInt("UB"));
        assertEquals(40, strToInt("UT"));
        assertEquals(41, strToInt("VA"));
        assertEquals(42, strToInt("VB"));
        assertEquals(120, strToInt("YT"));
        assertEquals(121, strToInt("UUA"));
        assertEquals(620, strToInt("YYT"));
        assertEquals(621, strToInt("UUUA"));
    }

    @Test
    public void splitEncodedProof_shouldSplitEncodedProofIntoParts() {
        //when
        final List<String> parts = MetamathParsers.splitEncodedProof("ABCZUACZYYWA");

        //then
        assertEquals(Arrays.asList("A", "B", "C", "Z", "UA", "C", "Z", "YYWA"), parts);
    }

    private TypesettingDefinitionDto toDto(TypesettingDefinition typesettingDefinition) {
        return TypesettingDefinitionDto.builder()
                .type(typesettingDefinition.getType())
                .args(
                        typesettingDefinition.getArgs().stream()
                        .map(a -> {
                            if (a instanceof TypesettingData) {
                                return ((TypesettingData) a).getText();
                            } else {
                                return ((TypesettingKeyword) a).getText();
                            }
                        })
                        .collect(Collectors.toList())
                )
                .build();
    }

    private boolean knownAltHtmlDef(TypesettingDefinitionDto dto) {
        return dto.getArgs().size() == 3 && dto.getArgs().get(1).equals("as") &&
                (
                        dto.getArgs().get(2).matches("^[A-Za-z0-9]+$")
                                || dto.getArgs().get(2).matches("^\\s*&[A-Za-z]+;[!*]?\\s*$")
                                || dto.getArgs().get(2).matches("^\\s*&#x?[0-9A-Za-z]+;\\s*$")
                                || dto.getArgs().get(2).matches("^\\s*[=\\[\\]()/{}]\\s*$")
                                || dto.getArgs().get(2).matches("^<SPAN CLASS=((typecode)|(hidden)|(wff)|(setvar)|(class)) STYLE=\"color:((gray)|(blue)|(red)|((#[A-Za-z0-9]+)))\">(([A-Za-z0-9()]+)|(&#x?[0-9A-Fa-f]+;))\\s*</SPAN>$")
                                || dto.getArgs().get(2).matches("^\\s*<SPAN CLASS=((symvar)|(hidden)) STYLE=\"border-bottom:1px dotted;color:((#[A-Za-z0-9]+))\">((&#?x?[A-Za-z0-9]+;?)|([+/0-9,]))</SPAN>\\s*$")
                                || dto.getArgs().get(2).matches("^<[UB]>((&#x?[0-9A-Za-z]+;)|([\\]\\[]))</[UB]>$")
                );
    }

    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    @Builder
    public static class TypesettingDefinitionDto {
        private String type;
        private List<String> args;
    }

}