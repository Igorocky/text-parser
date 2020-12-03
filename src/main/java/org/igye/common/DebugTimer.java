package org.igye.common;

import lombok.SneakyThrows;
import org.apache.commons.lang3.tuple.Pair;

import java.time.Duration;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.Callable;
import java.util.stream.Collectors;

public class DebugTimer {
    private static Map<String, Map<String, Instant>> begins = new HashMap<>();
    private static Map<String, Map<String, Duration>> accumulatedDurations = new HashMap<>();

    @SneakyThrows
    public static void run(String label, Runnable runnable) {
        call(label, () -> {
            runnable.run();
            return null;
        });
    }

    @SneakyThrows
    public static <T> T call(String label, Callable<T> callable) {
        try {
            begin(label);
            return callable.call();
        } finally {
            end(label);
        }
    }

    private static synchronized void begin(String label) {
        begins.computeIfAbsent(Thread.currentThread().getName(), s -> new HashMap<>()).put(label, Instant.now());
    }

    private static synchronized void end(String label) {
        String threadName = Thread.currentThread().getName();
        Map<String, Duration> durationMap = accumulatedDurations.computeIfAbsent(threadName, s -> new HashMap<>());
        durationMap.put(
                label,
                durationMap.getOrDefault(label, Duration.ZERO).plus(
                        Duration.between(
                                begins.get(threadName).get(label),
                                Instant.now()
                        )
                )
        );
    }

    public static String getStats() {
        final HashMap<String, Pair<Duration, List<Duration>>> durationsMap = new HashMap<>();
        for (Map.Entry<String, Map<String, Duration>> threadToMap : accumulatedDurations.entrySet()) {
            for (Map.Entry<String, Duration> labelToDuration : threadToMap.getValue().entrySet()) {
                final String label = labelToDuration.getKey();
                final Pair<Duration, List<Duration>> durations = durationsMap.computeIfAbsent(
                        label,
                        l -> Pair.of(Duration.ZERO, new ArrayList<>())
                );
                durationsMap.put(
                        label,
                        Pair.of(
                                durations.getLeft().plus(labelToDuration.getValue()),
                                append(durations.getRight(), labelToDuration.getValue())
                        )
                );
            }
        }
        final Comparator<Map.Entry<String, Pair<Duration, List<Duration>>>> comparator
                = Comparator.comparing(entry -> entry.getValue().getLeft());
        return durationsMap.entrySet().stream()
                .sorted(comparator.reversed())
                .map(labelToDur ->
                        labelToDur.getKey()
                        + " - " + labelToDur.getValue().getLeft().toMillis()
                        + (
                                labelToDur.getValue().getRight().size() > 1
                                        ? labelToDur.getValue().getRight().stream()
                                            .map(Duration::toMillis)
                                            .sorted(Comparator.reverseOrder())
                                            .map(Objects::toString)
                                            .collect(Collectors.joining(", ", " [", "]"))
                                        : ""
                        )

                )
                .collect(Collectors.joining("\n"));
    }

    private static <T> List<T> append(List<T> list, T elem) {
        final ArrayList<T> result = new ArrayList<>(list);
        result.add(elem);
        return result;
    }
}
