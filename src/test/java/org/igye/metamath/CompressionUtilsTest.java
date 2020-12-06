package org.igye.metamath;

import org.junit.Assert;
import org.junit.Test;

import java.util.Arrays;

public class CompressionUtilsTest {
    @Test
    public void intToStr_producesCorrectOutput() {
        Assert.assertEquals("#", CompressionUtils.intToStr(0));
        Assert.assertEquals("P", CompressionUtils.intToStr(45));
        Assert.assertEquals("R#", CompressionUtils.intToStr(46));
        Assert.assertEquals("RP", CompressionUtils.intToStr(91));
        Assert.assertEquals("S#", CompressionUtils.intToStr(92));
    }

    @Test
    public void compressListOfStrings_producesCorrectOutput() {
        Assert.assertEquals("", CompressionUtils.compressListOfStrings(Arrays.asList("")));
        Assert.assertEquals("¦", CompressionUtils.compressListOfStrings(Arrays.asList("","")));
        Assert.assertEquals("a¦b", CompressionUtils.compressListOfStrings(Arrays.asList("a","b")));
        Assert.assertEquals("a¦b¦c", CompressionUtils.compressListOfStrings(Arrays.asList("a","b","c")));
        Assert.assertEquals("a¦b:¦c", CompressionUtils.compressListOfStrings(Arrays.asList("a","b:","c")));
        Assert.assertEquals("a¦:¦c", CompressionUtils.compressListOfStrings(Arrays.asList("a",":","c")));

    }
}