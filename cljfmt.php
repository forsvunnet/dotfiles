<?php

// 1. Get all changed files (unstaged and untracked)
$changedFiles = [];
exec('git diff --name-only', $unstaged);
exec('git ls-files --others --exclude-standard', $untracked);
$allFiles = array_merge($unstaged, $untracked);

// 2. Filter only .clj, .cljs, .cljc files
$clojureFiles = array_filter($allFiles, function ($f) {
    return preg_match('/\.clj[cs]?$/', $f);
});

// 3. Sort and deduplicate
$clojureFiles = array_unique($clojureFiles);
sort($clojureFiles);

// 4. Run cljfmt with :paths if there are any files
if (empty($clojureFiles)) {
    fwrite(STDOUT, "No Clojure files with changes found.\n");
    exit(0);
}

// Format as a Clojure EDN vector: ["file1" "file2" ...]
$vector = '[' . implode(' ', array_map(
    function ($f) { return '"' . addcslashes($f, '"') . '"'; },
    $clojureFiles
)) . ']';

// Build the final cljfmt command
$command = 'clojure -Tcljfmt fix :paths \'' . $vector . '\'';

fwrite(STDOUT, "Running: $command\n");

// 5. Run the command and passthru output
passthru($command, $exitCode);
exit($exitCode);
