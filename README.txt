How to generate html pages of the proof explorer:
1) In org.igye.metamath.ProofExplorerGenerator modify few constants:
    pathToMmDatabase - path to set.mm or any other metamath *.mm file.
    pathToProofExplorerDirectory - path to a directory where to write files to.
    numOfThreads - number of threads to use when generating html files.
2) Run org.igye.metamath.ProofExplorerGenerator.main()