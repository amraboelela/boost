
boostPath=$PWD
OSs=(macos ios ios)
archs=(x86_64 x86_64 arm64)
#OSs=(ios)
#archs=(x86_64)
iOSBoostFrameworkPath=~/resources/iOSBoostFramework
i=0
for arch in ${archs[@]}; do
    frameworkPath=$boostPath/build/${OSs[$i]}-$arch
    if [ ! -d $frameworkPath/boost.framework ]; then
        cd $iOSBoostFrameworkPath
        rm -rf build
        make OS="${OSs[$i]}" ARCHS="$arch"
        mkdir -p $frameworkPath
        mv build/boost.framework $frameworkPath
    else
        echo directory $frameworkPath/boost.framework already exists
    fi
    ((i=i+1))
done
cd $boostPath
    
if [ ! -d boost.xcframework ]; then
    xcodebuild -create-xcframework \
    -framework build/${OSs[0]}-${archs[0]}/boost.framework \
    -framework build/${OSs[1]}-${archs[1]}/boost.framework \
    -framework build/${OSs[2]}-${archs[2]}/boost.framework \
    -output boost.xcframework
else
    echo directory boost.xcframework exists
fi
zip -r boost.xcframework.zip boost.xcframework
rm -rf boost.xcframework

currentDay=$(date "+%y-%m-%d")
mkdir -p ~/archive/boost
cp -p checksum.txt ~/archive/boost/checksum-$currentDay.txt
cp -p ../boost.xcframework.zip ~/archive/boost/boost-$currentDay.xcframework.zip

swift package compute-checksum boost.xcframework.zip > checksum.txt

rm ../boost.xcframework.zip
mv boost.xcframework.zip ..
