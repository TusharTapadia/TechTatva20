//
//  TeamDetailsModel.swift
//  Revels-20
//
//  Created by Rohit Kuber on 30/10/20.
//  Copyright © 2020 Naman Jain. All rights reserved.
//

import Foundation

struct TeamDetailsResponse : Codable {
    let success:Bool
    let msg:String
    let data: TeamMemberDetails?
}

struct TeamMemberDetails: Codable{
    let timeStamp: String// "2020-10-29T08:59:48.542Z",
    let members: [MemberInfo]
    let _id: String //"5f9ad8799f546c28600bc480",
    let teamID: Int //1020,
    let eventName: String //"Hopeless Opus",
    let minMembers: Int
    let partyCode: String// "zZTi7x",
    let maxMembers: Int
    let leader:Int // 5013,
    let __v: Int
}

struct MemberObject: Codable {
    let memberinfo: [MemberInfo]?
}

struct MemberInfo: Codable {
    let id: String
    let userID: Int
    let name:String
}
