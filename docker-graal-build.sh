#!/usr/bin/env bash

set -ex
javac -d classes src/main/java/com/github/demomon/jpc/graal/App.java
native-image -ea --no-server -H:Name=jpc-graal -H:Class=com.github.demomon.jpc.graal.App -H:+ReportUnsupportedElementsAtRuntime --static -cp classes/


