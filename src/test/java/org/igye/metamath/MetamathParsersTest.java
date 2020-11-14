package org.igye.metamath;

import org.igye.common.Utils;
import org.junit.Assert;
import org.junit.Test;

public class MetamathParsersTest {
    @Test
    public void preprocess_shouldPreprocessMetamathFile() {
        //when
        final Preprocessed preprocessed = MetamathParsers.preprocess(Utils.inputStreamFromClasspath("/peano.mm"));

        //then
        Assert.assertTrue(preprocessed.getCode().size() > 0);
        Assert.assertTrue(preprocessed.getComments().size() > 0);
    }

}