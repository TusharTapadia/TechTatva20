//
//  TwitterModel.swift
//  Revels-20
//
//  Created by Tushar Tapadia on 30/10/20.
//  Copyright © 2020 Naman Jain. All rights reserved.
//

import Foundation

struct twitter: Decodable {
    var data: [tweets]
}

struct tweets: Decodable {
    var tweet: String //description label
    var name: String //durationlabel
    var profileImage:String//views
    var like: String // yeet
    var reTweet: String // thumbnailImageView
}
