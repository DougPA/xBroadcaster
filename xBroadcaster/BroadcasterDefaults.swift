//
//  BroadcasterDefaults.swift
//  xBroadcaster
//
//  Created by Douglas Adams on 12/27/16.
//  Copyright © 2016 Douglas Adams. All rights reserved.
//

import Cocoa

// ----------------------------------------------------------------------------
// MARK: - Public constants

public let kPayload_0 = "Payload_0"
public let kPayload_1 = "Payload_1"
public let kPayload_2 = "Payload_2"
public let kPayload_3 = "Payload_3"
public let kPayload_4 = "Payload_4"

final class BroadcasterDefaults {
    
    // ----------------------------------------------------------------------------
    // MARK: - Private properties
    
    private let payload_0 =
    [
        "discovery_protocol_version=2.0.0.0",
        "model=FLEX-6300",
        "serial=1234-5678-6300-1234",
        "version=2.0.17.96",
        "nickname=Flex_1",
        "callsign=K3TZR",
        "ip=10.0.1.150",
        "port=4992",
        "status=Available",
        "inuse_ip=",
        "inuse_host="
    ]
    private let payload_1 =
    [
        "discovery_protocol_version=2.0.0.0",
        "model=FLEX-6500",
        "serial=4567-8901-6500-1234",
        "version=1.10.16.91",
        "nickname=Flex_2",
        "callsign=K3TZR",
        "ip=10.0.1.153",
        "port=4992",
        "status=Available",
        "inuse_ip=",
        "inuse_host="
    ]
    private let payload_2 =
    [
        "discovery_protocol_version=2.0.0.0",
        "model=FLEX-6700",
        "serial=7890-1234-6700-1234",
        "version=2.0.17.91",
        "nickname=Flex_3",
        "callsign=K3TZR",
        "ip=10.0.1.156",
        "port=4992",
        "status=Available",
        "inuse_ip=",
        "inuse_host="
    ]
    private let payload_3 =
    [
        "discovery_protocol_version=2.0.0.0",
        "model=FLEX-6400",
        "serial=2345-6789-6400-1234",
        "version=2.0.17.96",
        "nickname=Flex_4",
        "callsign=K3TZR",
        "ip=10.0.1.151",
        "port=4992",
        "status=Available",
        "inuse_ip=",
        "inuse_host="
    ]
    private let payload_4 =
    [
        "discovery_protocol_version=2.0.0.0",
        "model=FLEX-6600",
        "serial=5678-9012-6600-1234",
        "version=2.0.17.91",
        "nickname=Flex_5",
        "callsign=K3TZR",
        "ip=10.0.1.154",
        "port=4992",
        "status=Available",
        "inuse_ip=",
        "inuse_host="
    ]

    // ----------------------------------------------------------------------------
    // MARK: - Singleton shared instance
    
    static let sharedInstance = BroadcasterDefaults()
    
    // ----------------------------------------------------------------------------
    // MARK: - Initialization
    
    private init() {
        
        setupDefaults()
    }
    
    // ----------------------------------------------------------------------------
    // MARK: - Private methods
    
    /// Setup & Register User Defaults
    ///
    private func setupDefaults() {
        
        var _myDefaults = [String:Any]()
        
        _myDefaults[kPayload_0] = payload_0
        _myDefaults[kPayload_1] = payload_1
        _myDefaults[kPayload_2] = payload_2
        _myDefaults[kPayload_3] = payload_3
        _myDefaults[kPayload_4] = payload_4
        
        UserDefaults.standard.register(defaults: _myDefaults)
    }
    
}
