#!/usr/bin/env bash
rm App.class
rm -rf classes
mkdir classes

set -ex
$GRAALVM_HOME/bin/javac -d classes src/main/java/com/github/demomon/jpc/graal/App.java
# mv classes/com/github/demomon/jpc/graal/App.class .
$GRAALVM_HOME/bin/native-image -ea --no-server -H:Name=jpc-graal -H:Class=com.github.demomon.jpc.graal.App -H:+ReportUnsupportedElementsAtRuntime --static -cp classes/
# com/github/demomon/jpc/graal/
#$GRAALVM_HOME/bin/native-image classes/com/github/demomon/jpc/graal/App

