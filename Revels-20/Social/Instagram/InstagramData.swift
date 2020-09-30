//
//  InstagramData.swift
//  Revels-20
//
//  Created by Rohit Kuber on 27/09/20.
//  Copyright © 2020 Naman Jain. All rights reserved.
//

import Foundation

struct Instagram: Decodable {
    let entry_data: ProfilePage
}

struct ProfilePage: Decodable {
    let ProfilePage: [Graphql]
}

struct Graphql: Decodable {
    let graphql: User
}

//struct User: Decodable {
//    let user: Edge_owner_to_timeline_media
//}

struct Edge_owner_to_timeline_media: Decodable {
    let edge_owner_to_timeline_media: Edges
}

struct Edges: Decodable {
    let edges: [Node]
}

struct Node: Decodable {
    let node: Media
}

struct Media: Decodable {
    let display_url: String
    let video_url: String?
    let thumbnail_src: String
}

