# boost

boost, Swift Package Manager package for iOS and macOS. Complete solution to boost C++ library on iOS and macOS. Package came with precompiled libraries, and include script to build newer version if necessary.

The source was downloaded from [boost_1_70_0.tar.bz2 from sourceforge](http://sourceforge.net/projects/boost/files/boost/1.70.0/boost_1_70_0.tar.bz2)

## Generating xcframework
Follow the following steps:

            ~ $ cd resources
    resources $ git clone https://github.com/amraboelela/iOSBoostFramework
    resources $ cd boost
        boost $ ./build.sh
        boost $ cd build
        build $ ls

You should see the generated `boost.xcframework.zip` and `checksum.txt`

## Swift Package Manager

    dependencies: [
        .package(url: "https://github.com/amraboelela/boost", .branch("main")),
    ]
