# boost

## Generating xcframework
Follow the following steps:

            ~ $ cd resources
    resources $ git clone https://github.com/amraboelela/iOSBoostFramework

Download [boost_1_70_0.tar.bz2 from sourceforge](http://sourceforge.net/projects/boost/files/boost/1.70.0/boost_1_70_0.tar.bz2) then copy it to `iOSBoostFramework` directory.

    resources $ cd boost
        boost $ ./xcodebuild.sh
        boost $ ls

You should see the generated checksum.txt

    boost $ ls ..

You should see the generated boost.xcframework.zip

