package org.igye.metamath;

import org.igye.common.Utils;
import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;

import java.time.Duration;
import java.time.Instant;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import static java.util.Arrays.asList;
import static org.junit.Assert.assertEquals;

public class MetamathToolsTest {
    @Test
    public void verifyProof_shouldNotFailOnValidProof() {
        //given
        final MetamathDatabase database = MetamathParsers.load(Utils.inputStreamFromClasspath("/demo0.mm"));

        //when
        MetamathTools.verifyProof(database.getStatement("th1"));

        //then
        //no exception was thrown on the 'when' step
    }

    @Test
    public void verifyProof_shouldFailOnInvalidProof() {
        //given
        final MetamathDatabase database = MetamathParsers.load(Utils.inputStreamFromClasspath("/demo0.mm"));

        try {
            //when
            MetamathTools.verifyProof(database.getStatement("th2"));
        } catch (MetamathException e) {
            //then
            assertEquals("Hypotheses don't match", e.getMessage());
            return;
        }
        Assert.fail("A MetamathException should be thrown on the 'when' step.");
    }

    @Test
    public void verifyProof_shouldNotFailOnValidCompressedProof() {
        //given
        final MetamathDatabase database = MetamathParsers.load(Utils.inputStreamFromClasspath("/set-reduced.mm"));

        //when
        MetamathTools.verifyProof(database.getStatement("mp2"));
        MetamathTools.verifyProof(database.getStatement("id"));
        MetamathTools.verifyProof(database.getStatement("dfbi1ALT"));

        //then
        //no exception was thrown on the 'when' step
    }

    @Test
    @Ignore
    public void verifyProof_shouldNotFailOnValidCompressedProofFromSetMm() {
        //given
        final MetamathDatabase database = MetamathParsers.load("D:\\Install\\metamath\\metamath\\set.mm");

        //when
        MetamathTools.verifyProof(database.getStatement("fourierdlem112"));

//        final String assertionNameToSave = "sqrt2irr";
//        Utils.saveDtoToFile(
//                Metamath.visualizeProof(database.getStatement(assertionNameToSave)),
//                "D:\\programs\\java\\text-parser\\target\\" + assertionNameToSave + ".json"
//        );

        //then
        //no exception was thrown on the 'when' step
    }

    @Test
    @Ignore
    public void verifyProof_shouldSuccessfullyVerifyAllTheoremsFromSetMm() {
        //given
        final Instant loadingStart = Instant.now();
        System.out.println(loadingStart + " loading");
        final MetamathDatabase database = MetamathParsers.load("D:\\Install\\metamath\\metamath\\set.mm");

        final List<ListStatement> allTheorems = database.getAllAssertions().stream()
                .filter(a -> a.getType() == ListStatementType.THEOREM)
                .collect(Collectors.toList());
        final Instant loadingEnd = Instant.now();
        System.out.println(loadingEnd + " loaded " + allTheorems.size()
                + " theorems in " + getDurationStr(loadingStart, loadingEnd));

        final Instant verifyingStart = Instant.now();
        System.out.println(verifyingStart + " verifying");
        //when
        allTheorems.forEach(MetamathTools::verifyProof);
        final Instant verifyingEnd = Instant.now();
        System.out.println(verifyingEnd + " verification completed in " + getDurationStr(verifyingStart, verifyingEnd));

        //then
        //no exception was thrown on the 'when' step
    }

    @Test
    public void visualizeProof_shouldProduceCorrectlyFilledDto() {
        //given
        final MetamathDatabase database = MetamathParsers.load(Utils.inputStreamFromClasspath("/demo0.mm"));

        //when
        final ProofDto proofDto = MetamathTools.visualizeProof(database.getStatement("th1"));

//        Utils.saveDtoToFile(
//                proofDto,
//                "D:\\programs\\java\\text-parser\\target\\th1.json"
//        );

        //then

        final HashMap<Object, Object> expectedVarTypes = new HashMap<>();
        expectedVarTypes.put("P","wff");
        expectedVarTypes.put("Q","wff");
        expectedVarTypes.put("r","term");
        expectedVarTypes.put("s","term");
        expectedVarTypes.put("t","term");
        assertEquals(expectedVarTypes,proofDto.getVarTypes());

        final StackNodeDto dto = proofDto.getNodes().get(0);
        assertEquals(4, dto.getArgs().size());

        assertEquals("mp", dto.getLabel());
        assertEquals(
                asList(
                        asList("wff", "P"),
                        asList("wff", "Q"),
                        asList("|-", "P"),
                        asList("|-", "(", "P", "->", "Q", ")")
                ),
                dto.getParams()
        );
        assertEquals(asList("|-", "Q"), dto.getRetVal());

        assertEquals(2, dto.getSubstitution().size());
        assertEquals(asList("(", "t", "+", "0", ")", "=", "t"), dto.getSubstitution().get("P"));
        assertEquals(asList("t", "=", "t"), dto.getSubstitution().get("Q"));

        assertEquals(asList("|-", "t", "=", "t"), dto.getExpr());
    }

    @Ignore
    @Test
    public void generateProofExplorer_shouldGenerateProofExplorerFiles() {
        //given
        final MetamathDatabase database = MetamathParsers.load(Utils.inputStreamFromClasspath("/set-reduced.mm"));

        //when
        MetamathTools.generateProofExplorer(
                database.getAllAssertions().stream()
                        .filter(a -> a.getType() == ListStatementType.THEOREM)
                        .limit(10)
                        .collect(Collectors.toList()),
                "D:\\programs\\java\\text-parser\\target\\proof-explorer"
        );
    }

    private String getDurationStr(Instant start, Instant end) {
        return Duration.between(start, end).getSeconds() + "s";
    }

}