#!/bin/bash

jdks() {
  grep -oP '(?<=<jdkHome>)[^<]++'  $HOME/.m2/toolchains.xml
}

jdks | while read jdkhome; do
  cd "$jdkhome"
  find . -type f | sort | xargs sha256sum | sha256sum | sed "s%^%$jdkhome: %"
done
