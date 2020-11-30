package org.igye.metamath;

import org.igye.common.DebugTimer;

import java.time.Duration;
import java.time.Instant;
import java.util.stream.Collectors;

public class ProofExplorerGenerator {
    private static final String pathToMmDatabase = "D:/programs/java/text-parser/src/test/resources/set-reduced.mm";
//    private static final String pathToMmDatabase = "D:/Install/metamath/metamath/set.mm";

    private static final int numOfThreads = 4;

    private static final String pathToProofExplorerDirectory = "D:/programs/java/text-parser/target/proof-explorer";

    public static void main(String[] args) {
        final Instant start = Instant.now();

        System.out.println("Loading metamath database...");
        final MetamathDatabase database = DebugTimer.call(
                "Loading metamath database",
                () -> MetamathParsers.load(pathToMmDatabase)
        );

        MetamathTools.generateProofExplorer(
                database.getAllAssertions().stream()
//                        .limit(10_000)
                        .collect(Collectors.toList()),
                numOfThreads,
                pathToProofExplorerDirectory
        );

        System.out.println("Completed in " + Duration.between(start, Instant.now()).getSeconds() + "s.");
        System.out.println(DebugTimer.getStats());
    }
}
