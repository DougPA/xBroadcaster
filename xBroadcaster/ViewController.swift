//
//  ViewController.swift
//  xBroadcaster
//
//  Created by Douglas Adams on 1/1/17.
//  Copyright © 2017 Douglas Adams. All rights reserved.
//

import Cocoa

// ------------------------------------------------------------------------------
// MARK: - ViewController Class implementation
// ------------------------------------------------------------------------------

class ViewController: NSViewController, UdpManagerDelegate {
    
    // ----------------------------------------------------------------------------
    // MARK: - Outlet properties
    
    @IBOutlet weak private var _numberOfRadiosPopup: NSPopUpButton!
    @IBOutlet weak private var _startStopButton: NSButton!
    @IBOutlet weak private var _activityIndicator: NSProgressIndicator!
    
    // ----------------------------------------------------------------------------
    // MARK: - Private properties
    
    private let _udpSendQ =                                 // serial queue for UDP send activity
        DispatchQueue(label: "xBroadcaster" + ".udpSendQ")
    private let _udpReceiveQ =                              // serial queue for UDP receive activity
        DispatchQueue(label: "xBroadcaster" + ".udpReceiveQ")
    private var _udp: UdpManager?                           // class to manage the UDP connection / traffic
    private var broadcasters = [FlexBroadcast]()            // array of FlexBroadcast
    
    private let kBroadcastIpAddress = "255.255.255.255"     // IP Address for Broadcast
    private let kBroadcastPort = 4992                       // destination UDP port
    private let kStart = "Start"                            // Start button title
    private let kStop = "Stop"                              // Stop button title
    
    // ----------------------------------------------------------------------------
    // MARK: - Overridden methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        _startStopButton.isEnabled = false
        
        // initialize a UDP connection
//        let parameters = RadioParameters(lastSeen: Date(), ipAddress: kBroadcastIpAddress, port: kBroadcastPort, model: "", serialNumber: "")
        if _udp == nil { _udp = UdpManager(udpReceiveQ: _udpReceiveQ, udpSendQ: _udpSendQ, delegate: self, udpPort: UInt16(kBroadcastPort), enableBroadcast: true) }
        
        // if a UdpManager was created
        if let udp = _udp {
            
            // if it was able to turn on Broadcasting
            if udp.canBroadcast {
                
                // enable Start
                _startStopButton.isEnabled = true
            
            } else {
                
                // broadcasting was not enabled
                Swift.print("UDP can't broadcast")
            }
        }
    }
    
    // ----------------------------------------------------------------------------
    // MARK: - Action methods
    
    /// Respond to the Start/Stop button
    ///
    /// - Parameter sender: the button
    ///
    @IBAction func startStop(_ sender: NSButton) {
        
        if sender.title == kStart {
            
            // change to Stop mode
            sender.title = kStop
            _numberOfRadiosPopup.isEnabled = false
            
            // instantiate the required number of FlexBroadcast instances
            for i in 0..<_numberOfRadiosPopup.selectedTag() {
                
                // create a Broadcaster instance for the current index
                broadcasters.append( FlexBroadcast(udpManager: _udp!, index: i) )
                
                // pause 50 milliseconds between starting instances
                usleep(50_000)
            }
            _activityIndicator.controlTint = .graphiteControlTint
            _activityIndicator.startAnimation(self)
            
        } else {
            
            // deinit all of the Broadcaster instances
            broadcasters.removeAll()

            // return to Start mode
            sender.title = kStart
            _numberOfRadiosPopup.isEnabled = true
            
            _activityIndicator.stopAnimation(self)
        }
        
    }
    
    // ----------------------------------------------------------------------------
    // MARK: - UdpManager delegate methods
    
    public func udpState(bound : Bool, port: UInt16, error: String) {
        // not in use
    }
    public func udpStream(active: Bool) {
        // not in use
    }
    public func udpError(_ message: String) {
        // not in use
    }
    func meterVitaHandler(_ vitaPacket: Vita) {
        // not in use
    }
    func panadapterVitaHandler(_ vitaPacket: Vita) {
        // not in use
    }
    func waterfallVitaHandler(_ vitaPacket: Vita) {
        // not in use
    }
    func opusVitaHandler(_ vitapacket: Vita) {
        // not in use
    }
    func daxVitaHandler(_ vitapacket: Vita) {
        // not in use
    }
    func daxIqVitaHandler(_ vitapacket: Vita) {
        // not in use
    }
    
}

