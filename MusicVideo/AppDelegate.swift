//
//  AppDelegate.swift
//  MusicVideo
//
//  Created by Duc Nguyen on 2/17/16.
//  Copyright © 2016 ND NINJA. All rights reserved.
//

import UIKit

var reachability: Reachability?
var reachabilityStatus = WIFI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	var internetCheck: Reachability?
	
	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		NSNotificationCenter.defaultCenter().addObserver(self, selector: "reachabilityChanged:", name: kReachabilityChangedNotification, object: nil)
		internetCheck = Reachability.reachabilityForInternetConnection()
		internetCheck?.startNotifier()
		return true
	}
	
	func reachabilityChanged(notification: NSNotification) {
		reachability = notification.object as? Reachability
		statusChangedWithReachability(reachability!)
	}
	func statusChangedWithReachability(currentReachabilityStatus: Reachability) {
		let networkStatus: NetworkStatus = currentReachabilityStatus.currentReachabilityStatus()
		
		switch networkStatus.rawValue {
		case NotReachable.rawValue : reachabilityStatus    = NOACCESS;break
		case ReachableViaWiFi.rawValue: reachabilityStatus = WIFI;break
		case ReachableViaWWAN.rawValue: reachabilityStatus = WWAN;break
		default: return
		}
		print(reachabilityStatus)
		NSNotificationCenter.defaultCenter().postNotificationName("ReachStatusChanged", object: nil)
	}
	func applicationWillResignActive(application: UIApplication) {
	}
	
	func applicationDidEnterBackground(application: UIApplication) {
	}
	
	func applicationWillEnterForeground(application: UIApplication) {
	}
	
	func applicationDidBecomeActive(application: UIApplication) {
	}
	
	func applicationWillTerminate(application: UIApplication) {
		NSNotificationCenter.defaultCenter().removeObserver(self, name: kReachabilityChangedNotification, object: nil)
	}
}

