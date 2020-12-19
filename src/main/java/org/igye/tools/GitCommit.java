package org.igye.tools;

import lombok.SneakyThrows;
import org.apache.commons.lang3.tuple.Pair;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class GitCommit {
    public static void main(String[] args) throws IOException, InterruptedException {

    }

    private static void commit(String commitMessage) throws IOException, InterruptedException {
        int exitCode = runCommand("git commit -a -m \"" + commitMessage + "\"");
        if (0 != exitCode) {
            throw new RuntimeException("exitCode = " + exitCode);
        }
    }

    private static void tag(String tagName) throws InterruptedException {
        int exitCode = runCommand("git tag " + tagName);
        if (0 != exitCode) {
            throw new RuntimeException("exitCode = " + exitCode);
        }
    }

    @SneakyThrows
    private static Pair<List<String>, Matcher> runCommand(String command, boolean saveAllLines, Pattern lastLinePattern) {
        Process proc = startProcess(command);
        BufferedReader reader = new BufferedReader(new InputStreamReader(proc.getInputStream()));
        Pair<List<String>, Matcher> result = readTill(reader, saveAllLines, lastLinePattern);
        proc.waitFor(5, TimeUnit.SECONDS);
        if (proc.isAlive()) {
            proc.destroy();
        }
        return result;
    }

    private static int runCommand(String command) throws InterruptedException {
        Process proc = startProcess(command);
//        BufferedReader reader = new BufferedReader(new InputStreamReader(proc.getInputStream()));
//        readTill(reader, false, null);
        return proc.waitFor();
    }

    @SneakyThrows
    private static Process startProcess(String command) {
        log("Executing command: " + command);
        ProcessBuilder builder = new ProcessBuilder("cmd.exe", "/c", command);
        builder.redirectErrorStream(true);
        return builder.start();
    }

    private static Pair<List<String>, Matcher> readTill(BufferedReader reader, boolean saveAllLines, Pattern lastLinePattern) throws IOException {
        List<String> lines = new ArrayList<>();
        Matcher matcher = null;
        String line;
        do {
            line = reader.readLine();
            if (line == null) {
                return lastLinePattern != null ? null : Pair.of(saveAllLines ? lines : null, null);
            }
            log(line);
            lines.add(line);
            if (lastLinePattern != null) {
                matcher = lastLinePattern.matcher(line);
            }
        } while (line != null && (matcher == null || !matcher.matches()));
        return Pair.of(lines, matcher);
    }

    private static void log(String msg) {
        System.out.println(">>> " + msg);
    }
}
