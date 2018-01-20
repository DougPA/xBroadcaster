//
//  FlexBroadcast.swift
//  xBroadcaster
//
//  Created by Douglas Adams on 12/30/16.
//  Copyright © 2016 Douglas Adams. All rights reserved.
//

import Foundation

// ------------------------------------------------------------------------------
// MARK: - FlexBroadcast Class implementation
// ------------------------------------------------------------------------------

public final class FlexBroadcast {
    
    // ----------------------------------------------------------------------------
    // MARK: - Private properties
    
    typealias Payload = [String]                        // a Payload is a series of strings

    private var _udpManager: UdpManager                 // a UdpManager instance
    private var _index = 0                              // index into Payloads
    private var _broadcastTimer: DispatchSourceTimer!   // periodic timer for broadcast
    private var _broadcastQ =                           // Queue for Broadcast synchronization
        DispatchQueue(label: "xBroadcasterQ")
    private var _broadcast: Data?                       // a Vita-49 Broadcast packet as Data
    private var _payloads = [Payload]()                 // array of Payloads
    
    // ----------------------------------------------------------------------------
    // MARK: - Initialization
    
    /// Initialize a FlexBroadcast
    ///
    /// - parameter udpManager: a UdpManager class instance
    ///
    init(udpManager: UdpManager, index: Int) {
        
        self._udpManager = udpManager
        self._index = index
        
        // load the sample payloads
        let _ = BroadcasterDefaults.sharedInstance
        _payloads.append( UserDefaults.standard.array(forKey: kPayload_0) as! FlexBroadcast.Payload )
        _payloads.append( UserDefaults.standard.array(forKey: kPayload_1) as! FlexBroadcast.Payload )
        _payloads.append( UserDefaults.standard.array(forKey: kPayload_2) as! FlexBroadcast.Payload )
        _payloads.append( UserDefaults.standard.array(forKey: kPayload_3) as! FlexBroadcast.Payload )
        _payloads.append( UserDefaults.standard.array(forKey: kPayload_4) as! FlexBroadcast.Payload )
        
        // start broadcasting
        startBroadcastTimer()
    }
    
    deinit {
        
        // stop broadcasting
        stopBroadcastTimer()
    }
    
    // ----------------------------------------------------------------------------
    // MARK: - Private methods
    
    /// Start the Broadcast timer
    ///
    private func startBroadcastTimer() {
        
        // create the timer's dispatch source
        _broadcastTimer = DispatchSource.makeTimerSource(flags: [.strict], queue: _broadcastQ)
        
        // Set timer for 1 second with 100 millisecond leeway
      _broadcastTimer.schedule(deadline: DispatchTime.now(), repeating: .seconds(1), leeway: .milliseconds(100))      // Every second +/- 10%
        
        // create a Discovery packet from my payload (as Data)
        _broadcast = Vita.discovery(payload: _payloads[_index])
        
        // set the event handler
        _broadcastTimer.setEventHandler { [ unowned self] in
            
            // send a broadcast packet every time the timer fires
            self._udpManager.sendBroadcast(data: self._broadcast!)
        }
        
        // start the timer
        _broadcastTimer.resume()
    }
    /// Stop the Broadcast timer
    ///
    private func stopBroadcastTimer() {
        
        // stop the Timer (if any)
        _broadcastTimer?.cancel();
    }
    
}
