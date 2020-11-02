//
//  Networking.swift
//  TechTetva-19
//
//  Created by Naman Jain on 25/08/19.
//  Copyright © 2019 Naman Jain. All rights reserved.
//

import Alamofire

struct UserKeys{
    static let sharedInstance = UserKeys()
    let mobile = "mobile"
    let firstName = "firstName"
    let lastName = "lastName"
    let userID = "userID"
    let email = "email"
    let loggedIn = "isLoggedIn"
    let active = "active"
}

let apiKey = "o92PqCYAstWGq1Mx0kou"
let resultsURL = "https://api.mitrevels.in/results" //"https://api.techtatva.in/results"
let eventsURL = "https://categories.techtatva.in/app/events"
let scheduleURL = "https://techtatvadata.herokuapp.com/schedule"
//let categoriesURL = "https://api.mitrevels.in/categories"
let categoriesURL = "https://categories.techtatva.in/app/category"
//let delegateCardsURL = "https://api.mitrevels.in/delegate_cards"
//let boughtDelegateCardsURL = "https://register.mitrevels.in/boughtCards"
//let paymentsURL = "https://register.mitrevels.in/buy?card="
//let mapsDataURL = "https://appdev.mitrevels.in/maps"
//let collegeDataURL = "http://api.mitrevels.in/colleges"
let defaults = UserDefaults.standard
let emailCached = defaults.object(forKey: "Email") as? String ?? ""
let passwordCached = defaults.object(forKey: "Password") as? String ?? ""
let userIDCached = defaults.object(forKey: "UserID") as! Int

struct NetworkResponse <T: Decodable>: Decodable{
    let success: Bool
    let data: [T]?
}

let newsLetterURL = "https://app.themitpost.com/newsletter"
    //"http://newsletter-revels.herokuapp.com/pdf"

struct NewsLetterApiRespone: Decodable{
    let data: String?
}
struct Networking {
    
    let userSignUpURL = "https://techtatva.in/app/signup"
    let userPasswordForgotURL = "https://techtatva.in/api/forgotpass"
    let userPasswordResetURL = "https://register.mitrevels.in/setPassword/"
    let userLoginURL = "https://techtatva.in/app/status"
    let userDetailsURL = "https://register.mitrevels.in/userProfile"
    let registerEventURL = "https://techtatva.in/app/createteam"
    let getRegisteredEventsURL = "https://techtatva.in/app/registeredevents"
    let leaveTeamURL = "https://techtatva.in/app/leaveteam"
    let joinTeamURL = "https://techtatva.in/app/jointeam"
    let removeTeammateURL = "https://techtatva.in/app/removeuser"
    let updateDriveLinkURL = "https://techtatva.in/app/updatedrive"
    
    let teamDetailsURL = "https://techtatva.in/app/teamDetails"

    
    let liveBlogURL = "https://app.themitpost.com/liveblog"
    
    static let sharedInstance = Networking()
    
    func getResults(dataCompletion: @escaping (_ Data: [Result]) -> (),  errorCompletion: @escaping (_ ErrorMessage: String) -> ()){
        
        Alamofire.request(resultsURL, method: .get, parameters: nil, encoding: URLEncoding()).response { response in
            if let data = response.data{
                do{
                    let resultsResponse = try JSONDecoder().decode(ResultsResponse.self, from: data)
                    if resultsResponse.success{
                        if let data = resultsResponse.data{
                            dataCompletion(data)
                        }
                    }else{
                        errorCompletion("Results Response Failed")
                    }
                }catch let error{
                    print(error)
                    errorCompletion("Decoding Error")
                }
            }
        }
    }
    
    func getData<T: Decodable>(url: String, decode: T, dataCompletion: @escaping (_ Data: [T]) -> (),  errorCompletion: @escaping (_ ErrorMessage: String) -> ()){

        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding()).response { response in
            if let data = response.data{
                do{
                    let resultsResponse = try JSONDecoder().decode(NetworkResponse<T>.self, from: data)
                    if resultsResponse.success{
                        if let data = resultsResponse.data{
                            dataCompletion(data)
                        }
                    }else{
                        errorCompletion("Response Failed in \(url)")
                    }
                }catch let error{
                    print(error)
                    errorCompletion("Decoding Error in getData(Networking)")
                }
            }
        }
    }
    
    func getEvents(dataCompletion: @escaping (_ Data: [Event]) -> (),  errorCompletion: @escaping (_ ErrorMessage: String) -> ()){
        
        Alamofire.request(eventsURL, method: .post, parameters: nil, encoding: URLEncoding()).response { response in
            if let data = response.data{
                do{
                    let resultsResponse = try JSONDecoder().decode(EventsResponse.self, from: data)
                    if resultsResponse.success{
                        if let data = resultsResponse.data{
                            dataCompletion(data)
                        }
                    }else{
                        errorCompletion("Events Response Failed(Networking)")
                    }
                }catch let error{
                    print(error)
                    errorCompletion("Decoding Error in getting Events(Networking)")
                }
            }
        }
    }
    
    
    func getScheduleData(dataCompletion: @escaping (_ Data: [ScheduleDays]) -> (),  errorCompletion: @escaping (_ ErrorMessage: String) -> ()){
        
        Alamofire.request(scheduleURL, method: .get, parameters: nil, encoding: URLEncoding()).response { response in
            if let data = response.data{
                do{
                    let resultsResponse = try JSONDecoder().decode(ScheduleResponse.self, from: data)
                        if let data = resultsResponse.data{
                            dataCompletion(data)
                        }
                    else{
                        errorCompletion("Schedule Response Failed(Networking)")
                    }
                }catch let error{
                    print(error)
                    errorCompletion("Decoding Error in getting Schedule(Networking)")
                }
            }
        }
    }
    
    

    // MARK: - Events
    
    func getCategories(dataCompletion: @escaping (_ Data: [Category]) -> (),  errorCompletion: @escaping (_ ErrorMessage: String) -> ()){
        
        Alamofire.request(categoriesURL, method: .post, parameters: nil, encoding: URLEncoding()).response { response in
            if let data = response.data{
                do{
                    let resultsResponse = try JSONDecoder().decode(CategoriesResponse.self, from: data)
                    if resultsResponse.success{
                        if let data = resultsResponse.data{
                            dataCompletion(data)
                        }
                    }else{
                        errorCompletion("Category Response Failed(Networking)")
                    }
                }catch let error{
                    print(error)
                    errorCompletion("Decoding Error in getting Categories(Networking)")
                }
            }
        }
    }
    
    
    // MARK: - Users
    
    func registerUserWithDetails(name: String, email: String, mobile: String,password:String, collname: String,sname:String, dlink:String, dataCompletion: @escaping (_ Data: String) -> (),  errorCompletion: @escaping (_ ErrorMessage: String) -> ()){
        let parameters = [
            "name": name,
            "email": email,
            "phoneNo": mobile,
            "password":password,
            "branch":"engineering",
            "college": collname,
            "state": sname,
            "isMahe": true,
            "driveLink": dlink,
            ] as [String : Any]
        
        Alamofire.request(userSignUpURL, method: .post, parameters: parameters, encoding: URLEncoding()).response { response in
            if let data = response.data{
                do{
                    let response = try JSONDecoder().decode(RegisterResponse.self, from: data)
                    if response.success{
//                        defaults.set(data[0].userID, forKey: "userId")
                        dataCompletion(response.msg)
                    }else{
                        print(response)
                        errorCompletion(response.msg)
                    }
                }catch let error{
                    errorCompletion("decoder_error")
                    print(error)
                }
            }
        }
    }
    
    func forgotPasswordFor(Email email: String, dataCompletion: @escaping (_ Data: String) -> (),  errorCompletion: @escaping (_ ErrorMessage: String) -> ()){
        let parameters = [
            "email": email
            ] as [String : Any]
        
        Alamofire.request(userPasswordForgotURL, method: .post, parameters: parameters, encoding: URLEncoding()).response { response in
            if let data = response.data{
                do{
                    let response = try JSONDecoder().decode(RegisterResponse.self, from: data)
                    if response.success{
                        dataCompletion(response.msg)
                    }else{
                        print(response)
                        errorCompletion(response.msg)
                    }
                }catch let error{
                    errorCompletion("decoder_error")
                    print(error)
                }
            }
        }
    }
    
    func resetPassword(Token: String, Password: String, dataCompletion: @escaping (_ Data: String) -> (),  errorCompletion: @escaping (_ ErrorMessage: String) -> ()){
        let parameters = [
            "token": Token,
            "password": Password,
            "password2": Password,
            ] as [String : Any]
        
        Alamofire.request(userPasswordResetURL, method: .post, parameters: parameters, encoding: URLEncoding()).response { response in
            if let data = response.data{
                do{
                    let response = try JSONDecoder().decode(RegisterResponse.self, from: data)
                    if response.success{
                        dataCompletion(response.msg)
                    }else{
                        print(response)
                        errorCompletion(response.msg)
                    }
                }catch let error{
                    errorCompletion("decoder_error")
                    print(error)
                }
            }
        }
    }
    
    func loginUser(Email: String, Password: String, dataCompletion: @escaping (_ Data: User) -> (),  errorCompletion: @escaping (_ ErrorMessage: String) -> ()){
        let parameters = [
            "email": Email,
            "password": Password,
            "key": apiKey
            ] as [String : Any]

        Alamofire.request(userLoginURL, method: .post, parameters: parameters, encoding: URLEncoding()).response { response in
            if let data = response.data{
                do{
                    let response = try JSONDecoder().decode(UserResponse.self, from: data)
                    if response.success{
                        if let data = response.data{
                            let defaults = UserDefaults.standard
                            defaults.set(Email, forKey: "Email")
                            defaults.set(Password, forKey: "Password")
                            defaults.set(data.userID, forKey: "UserID")
                            dataCompletion(data)
                        }
                    }else{
                        print(response)
                        errorCompletion(response.msg ?? "")
                    }
                }catch let error{
                    errorCompletion("decoder_error")
                    print(error)
                }
            }
        }
    }
    func toUpdateDriveLink(drivelink: String ,successCompletion: @escaping (_ SuccessMessage: String) -> (),  errorCompletion: @escaping (_ ErrorMessage: String) -> ()){
            let parameters = [
                "userID": userIDCached,
                "driveLink": drivelink,
                "email": emailCached,
                "password": passwordCached,
                "key": apiKey
                ] as [String : Any]

            Alamofire.request(updateDriveLinkURL, method: .post, parameters: parameters, encoding: URLEncoding()).response { response in
                if let data = response.data{
                    do{
                        let response = try JSONDecoder().decode(RegisterResponse.self, from: data)
                        if response.success{
                            successCompletion(response.msg)
                            }
                        else{
                            print(response)
                            errorCompletion(response.msg)
                        }
                    }catch let error{
                        print("Error in getting status update after registering" ,error)
                    }
                }
            }
        }
    
    func getStatusUpdate(dataCompletion: @escaping (_ Data: User) -> ()){
        let parameters = [
            "email": emailCached,
            "password": passwordCached,
            "key": apiKey
            ] as [String : Any]

        Alamofire.request(userLoginURL, method: .post, parameters: parameters, encoding: URLEncoding()).response { response in
            if let data = response.data{
                do{
                    let response = try JSONDecoder().decode(UserResponse.self, from: data)
                    if response.success{
                        if let data = response.data{
                            dataCompletion(data)
                        }
                    }else{
                        print(response)
                    }
                }catch let error{
                    print("Error in getting status update after registering" ,error)
                }
            }
        }
    }
    
    func getNewsLetterUrl(dataCompletion: @escaping (_ Data: String) -> (),  errorCompletion: @escaping (_ ErrorMessage: String) -> ()){
        
        Alamofire.request(newsLetterURL, method: .get, parameters: nil, encoding: URLEncoding()).response { response in
            if let data = response.data{
                do{
                    let resultsResponse = try JSONDecoder().decode(NewsLetterApiRespone.self, from: data)
                        if let data = resultsResponse.data{
                            dataCompletion(data)
                        }else{
                            errorCompletion("Unable to get Newletter URL")
                        }
                }catch let error{
                    print(error)
                    errorCompletion("Decoding Error")
                }
            }
        }
    }
    
    
    
    //MARK: - EVENTS
    
    
    func registerEventWith(eventID: Int, userid:Int, category:String, successCompletion: @escaping (_ SuccessMessage: String) -> (),  errorCompletion: @escaping (_ ErrorMessage: String) -> ()){
        
        let parameters = [
            "email": emailCached,
            "password": passwordCached,
            "key":apiKey,
            "userID": userid,
            "eventID":"\(eventID)",
            "category":category,
            ] as [String : Any]
        
        Alamofire.request(registerEventURL, method: .post, parameters: parameters, encoding: URLEncoding()).response { response in
            if let data = response.data{
                do{
                    let response = try JSONDecoder().decode(CreateTeamResponse.self, from: data)
                    if response.success{
                        successCompletion(response.msg)
                    }else{
                        print(response)
                        errorCompletion(response.msg)
                    }
                }catch let error{
                    errorCompletion("decoder_error")
                    print(error)
                }
            }
        }
    }
    
    func getRegisteredEvents(dataCompletion: @escaping (_ Data: [RegEvent]) -> (),  errorCompletion: @escaping (_ ErrorMessage: String) -> ()){
        
        let parameters = [
            "userID": userIDCached,
            "email": emailCached,
            "password": passwordCached,
            "key":apiKey,
            ] as [String : Any]
        
        Alamofire.request(getRegisteredEventsURL, method: .post, parameters: parameters, encoding: URLEncoding()).response { response in
            if let data = response.data{
                do{
                    let resultsResponse = try JSONDecoder().decode(RegisteredEventsResponse.self, from: data)
                    if resultsResponse.success{
                        if let data = resultsResponse.data{
                            dataCompletion(data)
                        }
                    }else{
                        errorCompletion("Coudn't Fetch Registered Events")
                    }
                }catch let error{
                    print(error)
                    errorCompletion("Decoding Error")
                }
            }
        }
    }
    
    func leaveTeamForEventWith(userID: Int, teamID:Int, eventID:Int, successCompletion: @escaping (_ SuccessMessage: String) -> (),  errorCompletion: @escaping (_ ErrorMessage: String) -> ()){
        let parameters = [
            "userID":userID,
            "teamID":teamID,
            "eventID": eventID,
            "email":emailCached,
            "password":passwordCached,
            "key":apiKey
            ] as [String : Any]
        
        Alamofire.request(leaveTeamURL, method: .post, parameters: parameters, encoding: URLEncoding()).response { response in
            if let data = response.data{
                do{
                    let response = try JSONDecoder().decode(RegisterResponse.self, from: data)
                    if response.success{
                        print(response.msg)
                        successCompletion(response.msg)
                    }else{
                        print(response)
                        errorCompletion(response.msg)
                    }
                }catch let error{
                    errorCompletion("decoder_error")
                    print(error)
                }
            }
        }
    }
    
    func removeTeammate(userID: Int, teamID:Int, eventID:Int,removeID: Int, successCompletion: @escaping (_ SuccessMessage: String) -> (),  errorCompletion: @escaping (_ ErrorMessage: String) -> ()){
        let parameters = [
            "userID":userID,
            "teamID":teamID,
            "eventID": eventID,
            "removeID": removeID,
            "email":emailCached,
            "password":passwordCached,
            "key":apiKey
            ] as [String : Any]
        
        Alamofire.request(removeTeammateURL, method: .post, parameters: parameters, encoding: URLEncoding()).response { response in
            if let data = response.data{
                do{
                    let response = try JSONDecoder().decode(RegisterResponse.self, from: data)
                    if response.success{
                        successCompletion(response.msg)
                    }else{
                        print(response)
                        errorCompletion(response.msg)
                    }
                }catch let error{
                    errorCompletion("decoder_error")
                    print(error)
                }
            }
        }
    }
    
    func joinTeam( eventId: Int,userID:Int,category :String,partyCode:String, successCompletion: @escaping (_ SuccessMessage: String) -> (),  errorCompletion: @escaping (_ ErrorMessage: String) -> ()){
        let parameters = [
            "userID":userID,
            "eventID": eventId,
            "category":category,
            "partyCode": partyCode,
            "email":emailCached,
            "password":passwordCached,
            "key":apiKey
            ] as [String : Any]
        
        Alamofire.request(joinTeamURL, method: .post, parameters: parameters, encoding: URLEncoding()).response { response in
            if let data = response.data{
                do{
                    let response = try JSONDecoder().decode(JoinTeamResponse.self, from: data)
                    if response.success{
                        successCompletion(response.msg)
                    }else{
                        print(response)
                        errorCompletion(response.msg)
                    }
                }catch let error{
                    errorCompletion("decoder_error")
                    print(error)
                }
            }
        }
    }
    
    
    func getTeamDetails(teamID:Int, dataCompletion: @escaping (_ Data: TeamMemberDetails) -> (),  errorCompletion: @escaping (_ ErrorMessage: String) -> ()){
        let parameters = [
            "teamID": teamID,
            "email": emailCached,
            "userID": userIDCached,
            "password": passwordCached,
            "key": apiKey
            ] as [String : Any]

        Alamofire.request(teamDetailsURL, method: .post, parameters: parameters, encoding: URLEncoding()).response { response in
            if let data = response.data{
                do{
                    let response = try JSONDecoder().decode(TeamDetailsResponse.self, from: data)
                    if response.success{
                        if let data = response.data{
                            print(data)
                            dataCompletion(data)
                        }
                    }else{
                        print(response)
                        errorCompletion(response.msg ?? "")
                    }
                }catch let error{
                    errorCompletion("decoder_error")
                    print(error)
                }
            }
        }
    }
    
    
    // live blog url
    
    func getLiveBlogData(dataCompletion: @escaping (_ Data: [Blog]) -> (),  errorCompletion: @escaping (_ ErrorMessage: String) -> ()){
        
        Alamofire.request(liveBlogURL, method: .get, parameters: nil, encoding: URLEncoding()).response { response in
            if let data = response.data{
                do{
                    let resultsResponse = try JSONDecoder().decode(BlogData.self, from: data)
                    if resultsResponse.success ?? false{
                        if let data = resultsResponse.data{
                            dataCompletion(data)
                        }
                    }else{
                        errorCompletion("Coudn't Fetch Registered Events")
                    }
                }catch let error{
                    print(error)
                    errorCompletion("Decoding Error")
                }
            }
        }
    }
    
    
}

