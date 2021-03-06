//
//  SKReachability.swift
//  SimpleKit
//
//  Created by Amr Omran on 01/04/2019.
//

import Foundation

/// To use InternetReachability you need to conform this protocol to AppDelegate
/// call startReachability(_:) in didFinishLaunchingWithOptions(_:)
/// create instance from Reachability pass to startReachability(_:) to activate the Notification Listener
public protocol InternetReachability {
    
    /**
     Call this method in didFinishLaunchingWithOptions to start the Notification Center.
     - Parameter reachability: Reachability class.
     */
    func startReachabilityCheckNotifier(reachability: Reachability)
    
    /**
     Call this method in applicationDidEnterBackground to stop the Notification Center.
     - Parameter reachability: Reachability class.
     */
    func stopReachabilityCheckNotifier(reachability: Reachability)
}

public extension InternetReachability {
    
    /**
     Call this method in didFinishLaunchingWithOptions to start the Notification Center.
     - Parameter reachability: Reachability class.
     */
    func startReachabilityCheckNotifier(reachability: Reachability) {
        reachability.whenReachable = { reachability in
            switch reachability.connection {
                case .wifi:
                    print("Reachable via WiFi")
                    InternetChecker.setInternetAvailable = true
                case .cellular:
                    print("Reachable via Cellular")
                    InternetChecker.setInternetAvailable = true
                case .none:
                    print("no internet")
            }
        }
        
        reachability.whenUnreachable = { _ in
            print("not reachable")
            InternetChecker.setInternetAvailable = false
        }
        
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
    
    /**
     Call this method in applicationDidEnterBackground to stop the Notification Center.
     - Parameter reachability: Reachability class.
     */
    func stopReachabilityCheckNotifier(reachability: Reachability) {
        reachability.stopNotifier()
        InternetChecker.setInternetAvailable = false
    }
    
}

public class InternetChecker {

    /// get the internet connectivity status
    public static private(set) var isInternetAvailable: Bool = false
    
    fileprivate static var setInternetAvailable: Bool {
        get {
            return isInternetAvailable
        }
        set {
            return isInternetAvailable = newValue
        }
    }
}


