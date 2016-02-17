//
//  MusicVideo.swift
//  MusicVideo
//
//  Created by Duc Nguyen on 2/17/16.
//  Copyright © 2016 ND NINJA. All rights reserved.
//

import Foundation

class Videos {
	private var _vName: String
	private var _vRights: String
	private var _vPrice: String
	private var _vImageUrl: String
	private var _vArtist: String
	private var _vVideoUrl: String
	//private var _vImid: String
	private var _vGenre: String
	private var _vLinkToiTunes: String
	private var _vReleaseDte: String
	
	
	private var vImageData: NSData?
	
	var vName: String {
		return _vName
	}
	var vImageUrl: String {
		return _vImageUrl
	}
	var vVideoUrl: String {
		return _vVideoUrl
	}
	
	var vRights: String {
		return _vRights
	}
	
	var vPrice: String {
		return _vPrice
	}
	var vArtist: String{
		return _vArtist
	}
//	var vImid: String{
//		return _vImid
//	}
	var vGenre: String{
		return _vGenre
	}
	var vLinkToiTunes: String{
		return _vLinkToiTunes
	}
	var vReleaseDte: String{
		return _vReleaseDte
	}
	
	init(data: JSONDictionary) {
		if let name = data["im:name"] as? JSONDictionary,
			vName   = name["label"] as? String {
				self._vName = vName
		} else {
			self._vName = ""
		}
		
		if let rights = data["rights"] as? JSONDictionary,
			vRights   = rights["label"] as? String{
				self._vRights = vRights
		} else {
			self._vRights = ""
		}
		
		if let img = data["im:image"] as? JSONArray,
			image  = img[2] as? JSONDictionary,
			immage = image["label"] as? String {
				self._vImageUrl = immage.stringByReplacingOccurrencesOfString("100x100", withString: "600x600")
		} else {
			self._vImageUrl = ""
		}
		
		if let video	= data["link"] as? JSONArray,
			vUrl		= video[1] as? JSONDictionary,
			vHref		= vUrl["attributes"] as? JSONDictionary,
			vVideoUrl	= vHref["href"] as? String {
				self._vVideoUrl = vVideoUrl
		} else {
			self._vVideoUrl = ""
		}
		
		if let price = data["im:price"] as? JSONDictionary,
			prrice   = price["attributes"] as? JSONDictionary,
			vPrice	 = prrice["amount"] as? String{
				self._vPrice = vPrice
		} else{
			self._vPrice = ""
		}
		
		if let artist	= data["im:artist"] as? JSONDictionary,
			vArtist		= artist["label"] as? String {
				self._vArtist = vArtist
		} else{
			self._vArtist = ""
		}
		
		if let genre	= data["category"] as? JSONDictionary,
			rel2		= genre["label"] as? JSONDictionary,
			vGenre = rel2["term"] as? String {
				self._vGenre = vGenre
		} else{
			self._vGenre = ""
		}
		
		
		if let link2	  = data["id"] as? JSONDictionary,
			vLinkToiTunes = link2["label"] as? String {
				self._vLinkToiTunes = vLinkToiTunes
		} else{
			self._vLinkToiTunes = ""
		}
		
		if let release2	= data["im:releaseDate"] as? JSONDictionary,
			rel2		= release2["attributes"] as? JSONDictionary,
			vReleaseDte = rel2["label"] as? String {
				self._vReleaseDte = vReleaseDte
		} else{
			self._vReleaseDte = ""
		}
		
	}
}