
//
//  RegisteredEventModel.swift
//  TechTetva-19
//
//  Created by Naman Jain on 29/09/19.
//  Copyright © 2019 Naman Jain. All rights reserved.
//

struct RegisteredEventsResponse: Codable {
    let success: Bool
    let data : [RegEvent]?
}

struct RegEvent: Codable {
    let regEvent:[RegisteredEvent]?
}

struct RegisteredEvent: Codable{
        let tags : [String]
        let eventID: Int?
        let name: String
        let category: String
        let description: String
        let eventType: String
        let mode: String?
        let participationCriteria: String?
        let minMembers: Int?
        let maxMembers: Int?
        let prize: Int?
        let eventHead: [EventHead]?
        let __v: Int
        let deadline: String?
}

struct EventHead : Codable{
    let _id: String
    let name:String
    let phoneNo: Int64
}

