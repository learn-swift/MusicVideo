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
		
		let api = APIManager()
		api.loadData("https://itunes.apple.com/us/rss/topmusicvideos/limit=10/json", completion: didLoadData)
		//		api.loadData("https://itunes.apple.com/us/rss/topmusicvideos/limit=10/json") {
		//			(result: String) in
		//			print(result)
		//		}
	}
	
	func didLoadData(result: String) {
		let alert = UIAlertController(title: result, message: nil, preferredStyle: .Alert)
		let okAction = UIAlertAction(title: "OK", style: .Default, handler: doSomething)
		alert.addAction(okAction)
		self.presentViewController(alert, animated: true, completion: nil)
	}
	
	func doSomething(action: UIAlertAction) {
		print("click ok")
	}
}
