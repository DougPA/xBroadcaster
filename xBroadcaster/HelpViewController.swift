//
//  HelpViewController.swift
//  xBroadcaster
//
//  Created by Douglas Adams on 8/11/17.
//  Copyright © 2017 Douglas Adams. All rights reserved.
//

import Cocoa
import Quartz

class HelpViewController: NSViewController {
    
    fileprivate let kAutosaveName = "xBroadcasterHelpWindow"              // AutoSave name for the window
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        if let url = Bundle.main.url(forResource: "xBroadcaster", withExtension: "pdf") {
            
            let pdf = PDFDocument(url: url)
            
            let view = self.view as! PDFView
            
            view.document = pdf
        }
    }
    
    override func viewWillAppear() {
        
        super.viewWillAppear()
        
        view.window!.setFrameUsingName(kAutosaveName)
    }
    
    override func viewWillDisappear() {
        
        super.viewWillDisappear()
        
        view.window!.saveFrame(usingName: kAutosaveName)
    }
    
}
