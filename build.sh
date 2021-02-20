
projectPath=$PWD
#OSs=(macos ios ios)
#archs=(x86_64 x86_64 arm64)
OSs=(macos)
archs=(x86_64)
iOSBoostFrameworkPath=~/resources/iOSBoostFramework
i=0
libName=boost
for arch in ${archs[@]}; do
    frameworkPath=$projectPath/build/frameworks/${OSs[$i]}-$arch
    if [ ! -d $frameworkPath/$libName.framework ]; then
        cd $iOSBoostFrameworkPath
        #rm -rf build
        make clean
        make OS="${OSs[$i]}" ARCHS="$arch"
        mkdir -p $frameworkPath
        mv build/$libName.framework $frameworkPath
        cp $projectPath/config.hpp $frameworkPath/boost.framework/Headers/asio/detail
    else
        echo directory $frameworkPath/$libName.framework already exists
    fi
    ((i=i+1))
done
cd $projectPath/build
    
if [ ! -d $libName.xcframework ]; then
    echo Creating $libName.xcframework
    xcodebuildCommand="xcodebuild -create-xcframework"
    i=0
    for arch in ${archs[@]}; do
        xcodebuildCommand="$xcodebuildCommand -framework frameworks/${OSs[i]}-$arch/$libName.framework"
        ((i=i+1))
    done
    xcodebuildCommand="$xcodebuildCommand -output $libName.xcframework"
    eval "$xcodebuildCommand"
else
    echo directory $libName.xcframework already exists
fi

currentDay=$(date "+%y-%m-%d")
mkdir -p ~/archive/$libName
cp -p checksum.txt ~/archive/$libName/checksum-$currentDay.txt
cp -p $libName.xcframework.zip ~/archive/$libName/$libName-$currentDay.xcframework.zip
rm $libName.xcframework.zip

zip -r $libName.xcframework.zip $libName.xcframework
rm -rf $libName.xcframework

swift package compute-checksum boost.xcframework.zip > checksum.txt
