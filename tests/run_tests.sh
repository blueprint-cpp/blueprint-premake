#!/bin/bash

pushd $(dirname $0) > /dev/null

premake=build/buildtools-premake/bin/premake.sh

for f in samples/*.lua
do
    $premake generic --file=$f
done

$premake gmake --file=build/premake5.lua --verbose

pushd build/gmake > /dev/null
make
popd > /dev/null

popd > /dev/null
