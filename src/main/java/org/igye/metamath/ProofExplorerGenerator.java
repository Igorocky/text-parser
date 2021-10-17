package org.igye.metamath;

import org.igye.common.DebugTimer;

import java.util.stream.Collectors;

public class ProofExplorerGenerator {
    private static final String pathToMmDatabase = "C:\\igye\\books\\metamath\\set.mm";
//    private static final String pathToMmDatabase = "C:\\igye\\projects\\kotlin\\metamath-parser\\src\\test\\resources\\set-reduced.mm";

    private static final int numOfThreads = 8;

    private static final String version = "v8";

    private static final String pathToProofExplorerDirectory = "C:\\igye\\temp\\metamath\\old";
//    private static final String pathToProofExplorerDirectory = "C:\\igye\\temp\\metamath-reduced\\old";
//    private static final String pathToProofExplorerDirectory = "D:/programs/java/text-parser/target/proof-explorer-full";

    public static void main(String[] args) {
        DebugTimer.run("Generate proof explorer", () -> {
            System.out.println("Loading metamath database...");
            final MetamathDatabase database = DebugTimer.call(
                    "Loading metamath database",
                    () -> MetamathParsers.load(pathToMmDatabase)
            );

            MetamathTools.generateProofExplorer(
                    database.getAllAssertions().stream()
//                        .limit(1000)
                            .collect(Collectors.toList()),
                    version,
                    numOfThreads,
                    pathToProofExplorerDirectory
            );
        });
        System.out.println(DebugTimer.getStats());
    }
}
