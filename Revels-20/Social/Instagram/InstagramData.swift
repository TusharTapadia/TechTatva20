//
//  InstagramData.swift
//  Revels-20
//
//  Created by Rohit Kuber on 27/09/20.
//  Copyright © 2020 Naman Jain. All rights reserved.
//

import Foundation

struct Edges: Codable {
    let edges: [Node]
}

struct Node: Codable {
    let node: Media
}

struct Media: Codable {
    let display_url: String
    let edge_media_to_comment:num
    let edge_liked_by:num
}

struct num: Codable{
    let count:Int
}
