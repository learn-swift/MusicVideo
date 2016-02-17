//
//  ViewController.swift
//  MusicVideo
//
//  Created by Duc Nguyen on 2/17/16.
//  Copyright © 2016 ND NINJA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()

		NSNotificationCenter.defaultCenter().addObserver(self, selector: "reachabilityStatusChanged", name: "ReachStatusChanged", object: nil)
		reachabilityStatusChanged()
		let api = APIManager()
		api.loadData("https://itunes.apple.com/us/rss/topmusicvideos/limit=10/json", completion: didLoadData)
	}
	
	func didLoadData(videos: [Videos]) {
		if videos.count <= 0 {
			return
		}
		
		for (index, item) in videos.enumerate() {
			print("\(index) - name = \(item.vName)")
		}
	}
	
	func doSomething(action: UIAlertAction) {
		print("click ok")
	}
	
	func reachabilityStatusChanged() {
		switch reachabilityStatus {
		case NOACCESS:
			view.backgroundColor = UIColor.redColor()
			break
		case WIFI:
			view.backgroundColor = UIColor.greenColor()
			break
		case WWAN:
			view.backgroundColor = UIColor.yellowColor()
			break
		default: return
		}
	}
	
	deinit{
		NSNotificationCenter.defaultCenter().removeObserver(self,name: "ReachStatusChanged",object: nil)
	}
}
