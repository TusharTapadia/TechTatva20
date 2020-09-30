//
//  YoutubeModel.swift
//  Revels-20
//
//  Created by Rohit Kuber on 27/09/20.
//  Copyright © 2020 Naman Jain. All rights reserved.
//

import Foundation

struct Youtube: Decodable {
    var count: Int
    var data: [Data]
}

//struct Data: Decodable {
//    var title: String
//    var time: String
//    var link: String
//    var thumbnail: String
//}
