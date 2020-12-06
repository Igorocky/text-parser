package org.igye.metamath;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.tuple.Pair;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class CompressionUtils {
    private static final Comparator<Map.Entry<String, Integer>> COMPARATOR = Comparator.comparing(Map.Entry::getValue);


    public static CompressedAssertionDto compress(AssertionDto dto) {
        Pair<List<String>, Map<String, Integer>> strings = buildStrMap(dto);
        Map<String, Integer> strMap = strings.getRight();
        return CompressedAssertionDto.builder()
                .s(strings.getLeft())
                .t(dto.getType())
                .n(dto.getName())
                .d(dto.getDescription())
                .v(compress(dto.getVarTypes(), strMap))
                .a(compress(dto.getAssertion(), strMap))
                .p(dto.getProof()==null?null:dto.getProof().stream().map(p -> compress(p, strMap)).collect(Collectors.toList()))
                .build();
    }

    private static Pair<List<String>, Map<String, Integer>> buildStrMap(AssertionDto dto) {
        Map<String, Integer> counts = new HashMap<>();
        for (Map.Entry<String, String> entry : dto.getVarTypes().entrySet()) {
            updateCounts(counts, entry.getKey());
            updateCounts(counts, entry.getValue());
        }
        updateCounts(counts, dto.getAssertion());
        if (dto.getProof() != null) {
            for (StackNodeDto proof : dto.getProof()) {
                updateCounts(counts, proof);
            }
        }
        return buildStrMap(counts);
    }

    private static void updateCounts(Map<String, Integer> counts, StackNodeDto dto) {
        updateCounts(counts, dto.getType());
        updateCounts(counts, dto.getLabel());
        updateCounts2(counts, dto.getParams());
        updateCounts(counts, dto.getRetVal());
        updateCounts2(counts, dto.getSubstitution());
        updateCounts(counts, dto.getExpr());
    }

    private static CompressedStackNodeDto compress(StackNodeDto dto, Map<String, Integer> strMap) {
        return CompressedStackNodeDto.builder()
                .i(dto.getId())
                .a(dto.getArgs())
                .t(strMap.get(dto.getType()))
                .l(strMap.get(dto.getLabel()))
                .p(compress2(dto.getParams(),strMap))
                .r(compress(dto.getRetVal(), strMap))
                .n(dto.getNumOfTypes())
                .s(
                        dto.getSubstitution()==null?null:dto.getSubstitution().entrySet().stream()
                                .collect(Collectors.toMap(
                                        entry -> strMap.get(entry.getKey()),
                                        entry -> compress(entry.getValue(),strMap)
                                ))
                )
                .e(compress(dto.getExpr(), strMap))
                .build();
    }

    private static Pair<List<String>, Map<String, Integer>> buildStrMap(IndexDto dto) {
        Map<String, Integer> counts = new HashMap<>();
        for (IndexElemDto indexElemDto : dto.getElems()) {
            updateCounts(counts, indexElemDto.getType());
            updateCounts2(counts, indexElemDto.getHypotheses());
            updateCounts(counts, indexElemDto.getExpression());
            updateCounts(counts, indexElemDto.getVarTypes());
        }
        return buildStrMap(counts);
    }

    public static CompressedIndexDto2 compress(IndexDto dto) {
        return compress(compress1(dto));
    }

    private static CompressedIndexDto2 compress(CompressedIndexDto dto) {
        return CompressedIndexDto2.builder()
                .strings(StringUtils.join(dto.getStrings(), " "))
                .elems(dto.getElems().stream().map(CompressionUtils::compress).collect(Collectors.toList()))
                .build();
    }

    private static CompressedIndexDto compress1(IndexDto dto) {
        final Pair<List<String>, Map<String, Integer>> strings = buildStrMap(dto);
        Map<String, Integer> strMap = strings.getRight();
        return CompressedIndexDto.builder()
                .strings(strings.getLeft())
                .elems(dto.getElems().stream().map(e -> compress(e, strMap)).collect(Collectors.toList()))
                .build();
    }

    private static CompressedIndexElemDto compress(IndexElemDto dto, Map<String, Integer> strMap) {
        return CompressedIndexElemDto.builder()
                .i(dto.getId())
                .t(strMap.get(dto.getType()))
                .l(dto.getLabel())
                .h(compress2(dto.getHypotheses(),strMap))
                .e(compress(dto.getExpression(),strMap))
                .v(compress(dto.getVarTypes(),strMap))
                .build();
    }

    private static String compress(CompressedIndexElemDto dto) {
        List<String> res = new ArrayList<>();
        res.add(dto.getI().toString());
        res.add(dto.getT().toString());
        res.add(dto.getL());
        res.add(dto.getH().stream().map(CompressionUtils::compressListOfIntsToStr).collect(Collectors.joining(" ")));
        res.add(compressListOfIntsToStr(dto.getE()));
        res.add(compressMapOfIntsToStr(dto.getV()));
        return compressListOfStrings(res);
    }

    protected static String intToStr(int i) {
        StringBuilder sb = new StringBuilder();
        if (i == 0) {
            return "#";
        } else {
            int base = 46;
            while (i > 0) {
                sb.append((char) ((i % base) + (base == 46 ? 35 : 81)));
                i /= base;
                base *= base;
            }
            return sb.reverse().toString();
        }
    }

    protected static String compressListOfStrings(List<String> strings) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < strings.size(); i++) {
            if (i != 0) {
                sb.append((char)166);
            }
            sb.append(strings.get(i));
        }
        return sb.toString();
    }

    private static String compressListOfIntsToStr(List<Integer> ints) {
        StringBuilder sb = new StringBuilder();
        for (Integer i : ints) {
            sb.append(intToStr(i));
        }
        return sb.toString();
    }

    private static String compressMapOfIntsToStr(Map<Integer,Integer> map) {
        StringBuilder sb = new StringBuilder();
        for (Map.Entry<Integer, Integer> entry : map.entrySet()) {
            sb.append(intToStr(entry.getKey()));
            sb.append(intToStr(entry.getValue()));
        }
        return sb.toString();
    }

    private static List<Integer> compress(List<String> list, Map<String, Integer> strMap) {
        return list==null?null:list.stream().map(strMap::get).collect(Collectors.toList());
    }

    private static List<List<Integer>> compress2(List<List<String>> list, Map<String, Integer> strMap) {
        return list==null?null:list.stream().map(l -> compress(l,strMap)).collect(Collectors.toList());
    }

    private static Map<Integer,Integer> compress(Map<String,String> map, Map<String, Integer> strMap) {
        return map==null?null:map.entrySet().stream()
                .collect(Collectors.toMap(
                        entry -> strMap.get(entry.getKey()),
                        entry -> strMap.get(entry.getValue())
                ));
    }

    private static void updateCounts(Map<String, Integer> counts, List<String> list) {
        if (list != null) {
            for (String str : list) {
                updateCounts(counts, str);
            }
        }
    }

    private static void updateCounts2(Map<String, Integer> counts, List<List<String>> list) {
        if (list != null) {
            for (List<String> le : list) {
                for (String str : le) {
                    updateCounts(counts, str);
                }
            }
        }
    }

    private static void updateCounts2(Map<String, Integer> counts, Map<String, List<String>> data) {
        if (data != null) {
            for (Map.Entry<String, List<String>> entry : data.entrySet()) {
                updateCounts(counts, entry.getKey());
                for (String str : entry.getValue()) {
                    updateCounts(counts, str);
                }
            }
        }
    }

    private static void updateCounts(Map<String, Integer> counts, Map<String, String> data) {
        if (data != null) {
            for (Map.Entry<String, String> entry : data.entrySet()) {
                updateCounts(counts, entry.getKey());
                updateCounts(counts, entry.getValue());
            }
        }
    }

    private static void updateCounts(Map<String, Integer> counts, String str) {
        if (str != null) {
            counts.put(str, counts.getOrDefault(str, 0) + 1);
        }
    }

    private static Pair<List<String>, Map<String, Integer>> buildStrMap(Map<String, Integer> counts) {
        final List<String> strings = counts.entrySet().stream()
                .sorted(COMPARATOR.reversed())
                .map(Map.Entry::getKey)
                .collect(Collectors.toList());
        Map<String, Integer> strMap = new HashMap<>();
        for (int i = 0; i < strings.size(); i++) {
            strMap.put(strings.get(i),i);
        }
        return Pair.of(strings, strMap);
    }
}
