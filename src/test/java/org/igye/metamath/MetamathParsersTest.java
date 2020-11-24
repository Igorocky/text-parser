package org.igye.metamath;

import org.igye.common.Utils;
import org.igye.textparser.PositionInText;
import org.igye.textparser.TokenStream;
import org.junit.Test;

import java.io.ByteArrayInputStream;
import java.util.Arrays;
import java.util.List;

import static org.igye.metamath.Metamath.stringify;
import static org.igye.textparser.TextParsers.inputStreamToTokenStream;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class MetamathParsersTest {
    @Test
    public void defineFramesAndBuildMap_shouldDefineFramesForAllAxiomsAndTheorems() {
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
    public void parse_shouldParseMetamathFile() {
        //when
        List<Statement> statements = MetamathParsers.parse(Utils.inputStreamFromClasspath("/peano.mm"));
//        List<Statement> statements = MetamathParsers.parse("D:\\Install\\metamath\\metamath\\set.mm");

        //then
        assertTrue(statements.size() > 0);
    }

    @Test
    public void preprocess_shouldPreprocessMetamathFile() {
        //when
        final Preprocessed preprocessed = MetamathParsers.preprocess(Utils.inputStreamFromClasspath("/peano.mm"));
//        final Preprocessed preprocessed = MetamathParsers.preprocess("D:\\Install\\metamath\\metamath\\set.mm");

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
                        "        ( va vb vc vd $.")
        ).get();

        //then
        assertEquals("hlhilphllem", statement.getLabel());
        assertEquals(ListStatementType.THEOREM, statement.getType());
        assertEquals(Arrays.asList("|-","(","ph","->","U","e.","PreHil",")"), statement.getSymbols());
        assertEquals(Arrays.asList("(", "va", "vb", "vc", "vd"), statement.getProof());
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

    private TokenStream<Character, PositionInText> tokenStreamFromString(String str) {
        return inputStreamToTokenStream(new ByteArrayInputStream(str.getBytes()));
    }

}