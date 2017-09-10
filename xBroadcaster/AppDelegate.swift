//
//  AppDelegate.swift
//  xBroadcaster
//
//  Created by Douglas Adams on 1/1/17.
//  Copyright © 2017 Douglas Adams. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        
        // close the app if the window is closed
        return true
    }

}

