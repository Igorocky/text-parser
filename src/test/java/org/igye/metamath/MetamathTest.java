package org.igye.metamath;

import org.igye.common.Utils;
import org.junit.Test;

public class MetamathTest {
    @Test
    public void verifyProof_shouldNotFailOnValidProof() {
        //given
        final MetamathDatabase database = MetamathParsers.load(Utils.inputStreamFromClasspath("/demo0.mm"));

        //when
        Metamath.verifyProof(database.getStatement("th1"), database);

        //then
        //no exception was thrown on the 'when' step
    }

    @Test
    public void verifyProof_shouldNotFailOnValidCompressedProof() {
        //given
        final MetamathDatabase database = MetamathParsers.load(Utils.inputStreamFromClasspath("/set-reduced.mm"));

        //when
        Metamath.verifyProof(database.getStatement("mp2"), database);
//        Metamath.verifyProof(database.getStatement("id"), database);

        //then
        //no exception was thrown on the 'when' step
    }

}