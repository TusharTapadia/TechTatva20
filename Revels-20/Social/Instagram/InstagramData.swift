//
//  InstagramData.swift
//  Revels-20
//
//  Created by Rohit Kuber on 27/09/20.
//  Copyright © 2020 Naman Jain. All rights reserved.
//

import Foundation

struct Edges: Decodable {
    let edges: [Node]
}

struct Node: Decodable {
    let node: Media
}

struct Media: Decodable {
    let display_url: String
//    let video_url: String?
//    let thumbnail_src: String
    let edge_sidecar_to_children: Child?
//    let edge_media_to_caption: Jij
}

// for accessing child posts
struct Child: Decodable {
    let edges: [Children]
}
struct Children: Decodable {
    let node: Kik
}
struct Kik: Decodable {
    let display_url: String
}

