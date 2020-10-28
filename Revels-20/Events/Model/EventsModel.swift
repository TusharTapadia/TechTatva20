//
//  EventsModel.swift
//  TechTetva-19
//
//  Created by Naman Jain on 26/08/19.
//  Copyright © 2019 Naman Jain. All rights reserved.
//

struct EventsResponse: Codable{
    let success: Bool
    let data: [Event]?
}

struct Event: Codable{

    let name: String
    let category: String
    let tags: [String]?
    let mode: String?
    let description: String
    let teamSize: String?
    let eventID : Int?
//    let can_register: Int
//    let visible: Int
//
    init() {
        category = ""
        name = ""
        tags = []
        mode = ""
        description = ""
        teamSize = ""
        eventID = 0
    }
}


