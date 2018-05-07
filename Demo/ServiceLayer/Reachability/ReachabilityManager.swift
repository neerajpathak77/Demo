//
//  ReachabilitySwift.swift
//  Demo
//
//  Created by neeraj on 07/05/18.
//  Copyright © 2018 neeraj. All rights reserved.
//
//  Internet Copied class

import ReachabilitySwift

final class ReachabilityManager: NSObject {
    
    static  let reachabilityManager = ReachabilityManager()
    private override init() {
        super.init()
    }
    //================================================
    //The isNetworkAvailable should be a Observable type
    //in most of the cases but depends if we need to hit API
    // on NW availablity. For now this is not observable.
    //================================================
    var isNetworkAvailable: Bool {
        return reachabilityStatus != .notReachable
    }
    var reachabilityStatus: Reachability.NetworkStatus = .notReachable
    let reachability = Reachability()
    
    @objc func reachabilityChanged(notification: Notification) {
        let reachability = notification.object as! Reachability
        switch reachability.currentReachabilityStatus {
        case .notReachable:
            print("unreachable")
            reachabilityStatus = .notReachable
            
        case .reachableViaWiFi:
            print("WiFi")
            reachabilityStatus = .reachableViaWiFi
            
        case .reachableViaWWAN:
            print("Cellular Data")
            reachabilityStatus = .reachableViaWWAN
        }
    }
    
    // Starts monitoring the network availability status
    func startMonitoring() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.reachabilityChanged),
                                               name: ReachabilityChangedNotification,
                                               object: reachability)
        do {
            try reachability?.startNotifier()
        } catch {
            print("Could not start reachability notifier")
        }
    }
    
    // Stops monitoring the network availability status
    func stopMonitoring() {
        reachability?.stopNotifier()
        NotificationCenter.default.removeObserver(self,
                                                  name: ReachabilityChangedNotification,
                                                  object: reachability)
    }   
}
