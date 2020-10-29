//
//  UserModel.swift
//  TechTetva-19
//
//  Created by Naman Jain on 27/09/19.
//  Copyright © 2019 Naman Jain. All rights reserved.
//

import UIKit

struct UserResponse: Decodable {
    let success: Bool
    let msg: String?
    let data : [User]?
}

struct User: Codable{
    let timeStamp: String?
    let branch:String?
    let verified:String?
    let regEvents:[String]?
    let userID: Int?
    let name: String?
    let email: String?
    let phoneNo: Int64?
    let college: String?
    let state: String?
    let isMahe: Bool?
    let driveLink: String?
    let __v:Int?
//    let id: Int
//    let name: String
//    let regno: String
//    let mobile: String
//    let email: String
//    let qr: String
//    let collname: String
}

struct UserData: Codable{
    let timeStamp: String
    let branch:String?
    let verified:String?
    let regEvents:[Event]?
    let userID: Int
    let name: String
    let email: String
    let phoneNo: Int64
    let college: String
    let state: String
    let isMahe: Bool
    let driveLink: String
    let __v:Int
}
    
//                "userID": 5013,
//                "name": "Rohit Kuber",
//                "email": "rohitkuber42@gmail.com",
//                "phoneNo": 9604724700,
//                "college": "MIT Manipal",
//                "state": "Maharashtra",
//                "isMahe": true,
//                "driveLink": "Abc",
//                "__v": 0

