# xBroadcaster
Simulates the presence of multiple FlexRadio (TM) 6000 series radios on
your network.

Builds on macOS 10.13 using XCode 9 using Swift 3.2 with a Deployment
Target of macOS 10.10

==========================================================================

Please see the xBroadcaster.pdf file in this project or run the app and 
click the HELP menu choice.


***** IMPORTANT NOTE ***** To compile this application, you must have
xLib6000.framework in the same folder  as the xCode project file (xBroadcaster.xcodeproj)
( i.e. in ${PROJECT_DIR} )


A compiled DEBUG build executable (which has xLib6000.framework embedded in it)
is contained in the GitHub Release if you would rather not build from sources.

If you require a RELEASE build you will have to build from sources and will need
xLib6000.framework (available at https://github.com/DougPA/xLib6000).
