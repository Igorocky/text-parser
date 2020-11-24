package org.igye.metamath;

import org.igye.common.Utils;
import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;

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
        System.out.println(Instant.now() + " loading");
        final MetamathDatabase database = MetamathParsers.load("D:\\Install\\metamath\\metamath\\set.mm");

        final List<ListStatement> allTheorems = database.getAllAssertions().stream()
                .filter(a -> a.getType() == ListStatementType.THEOREM)
                .collect(Collectors.toList());
        System.out.println(Instant.now() + " loaded " + allTheorems.size() + " theorems");

        System.out.println(Instant.now() + " verifying");
        //when
        allTheorems.forEach(Metamath::verifyProof);
        System.out.println(Instant.now() + " done");

        //then
        //no exception was thrown on the 'when' step
    }

}