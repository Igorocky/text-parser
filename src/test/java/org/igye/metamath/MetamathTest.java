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

}