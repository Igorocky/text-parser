package org.igye.common;

import lombok.SneakyThrows;

import java.time.Duration;
import java.time.Instant;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.stream.Collectors;

public class DebugTimer {
    private static Map<String, Map<String, Instant>> begins = new HashMap<>();
    private static Map<String, Map<String, Duration>> accumulatedDurations = new HashMap<>();

    @SneakyThrows
    public static synchronized void run(String label, Runnable runnable) {
        call(label, () -> {
            runnable.run();
            return null;
        });
    }

    @SneakyThrows
    public static synchronized <T> T call(String label, Callable<T> callable) {
        String threadName = Thread.currentThread().getName();
        try {
            begins.computeIfAbsent(threadName, s -> new HashMap<>()).put(label, Instant.now());
            return callable.call();
        } finally {
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
    }

    public static String getStats() {
        final HashMap<String, Duration> durations = new HashMap<>();
        for (Map.Entry<String, Map<String, Duration>> threadToMap : accumulatedDurations.entrySet()) {
            for (Map.Entry<String, Duration> labelToDuration : threadToMap.getValue().entrySet()) {
                final String label = labelToDuration.getKey();
                durations.put(
                        label,
                        durations.getOrDefault(label, Duration.ZERO).plus(labelToDuration.getValue())
                );
            }
        }
        return durations.entrySet().stream()
                .sorted(Comparator.comparing(Map.Entry::getKey))
                .map(labelToDur -> labelToDur.getKey() + " - " + labelToDur.getValue().toMillis())
                .collect(Collectors.joining("\n"));
    }
}
