package org.igye.metamath;

import org.igye.common.Utils;
import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;

import java.time.Duration;
import java.time.Instant;
import java.util.List;
import java.util.stream.Collectors;

import static org.junit.Assert.assertEquals;

public class MetamathTest {
    @Test
    public void verifyProof_shouldNotFailOnValidProof() {
        //given
        final MetamathDatabase database = MetamathParsers.load(Utils.inputStreamFromClasspath("/demo0.mm"));

        //when
        Metamath.verifyProof(database.getStatement("th1"));

        //then
        //no exception was thrown on the 'when' step
    }

    @Test
    public void verifyProof_shouldFailOnInvalidProof() {
        //given
        final MetamathDatabase database = MetamathParsers.load(Utils.inputStreamFromClasspath("/demo0.mm"));

        try {
            //when
            Metamath.verifyProof(database.getStatement("th2"));
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
        Metamath.verifyProof(database.getStatement("mp2"));
        Metamath.verifyProof(database.getStatement("id"));
        Metamath.verifyProof(database.getStatement("dfbi1ALT"));

        //then
        //no exception was thrown on the 'when' step
    }

    @Test
    @Ignore
    public void verifyProof_shouldNotFailOnValidCompressedProofFromSetMm() {
        //given
        final MetamathDatabase database = MetamathParsers.load("D:\\Install\\metamath\\metamath\\set.mm");

        //when
        Metamath.verifyProof(database.getStatement("fourierdlem112"));

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
        allTheorems.forEach(Metamath::verifyProof);
        final Instant verifyingEnd = Instant.now();
        System.out.println(verifyingEnd + " verification completed in " + getDurationStr(verifyingStart, verifyingEnd));

        //then
        //no exception was thrown on the 'when' step
    }

    private String getDurationStr(Instant start, Instant end) {
        return Duration.between(start, end).getSeconds() + "s";
    }

}