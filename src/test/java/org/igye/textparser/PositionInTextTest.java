package org.igye.textparser;

import org.junit.Assert;
import org.junit.Test;

public class PositionInTextTest {
    @Test
    public void compareTo_comparesCorrectly() {
        Assert.assertEquals(0, new PositionInText(0,0).compareTo(new PositionInText(0,0)));
        Assert.assertEquals(-1, new PositionInText(5,0).compareTo(new PositionInText(6,0)));
        Assert.assertEquals(1, new PositionInText(6,0).compareTo(new PositionInText(5,0)));
        Assert.assertEquals(-1, new PositionInText(5,7).compareTo(new PositionInText(5,8)));
        Assert.assertEquals(1, new PositionInText(5,8).compareTo(new PositionInText(5,7)));
    }

}