#!/bin/bash

jdks() {
  grep -oP '(?<=<jdkHome>)[^<]++'  $HOME/.m2/toolchains.xml
}

jdks | while read jdkhome; do
  cd "$jdkhome"
  find . -type f | sort | wc -l | sed "s%^%$jdkhome: %"
done
