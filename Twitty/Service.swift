//
//  Service.swift
//  Twitty
//
//  Created by shaik mulla syed on 6/22/17.
//  Copyright © 2017 shaik mulla syed. All rights reserved.
//

import UIKit
import TRON
import SwiftyJSON


struct Service {
    static let sharedInstance = Service()
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    func fetchHomefeed(completion: @escaping (HomeFeed) -> ()){
        let request: APIRequest<HomeFeed,JsonError> = tron.request("/twitter/home2")
        request.perform(withSuccess: { (homefeed) in
            completion(homefeed)
            
        }) { (err) in
            print("error printed")
        }
    }
}

class HomeFeed: JSONDecodable{
    var users = [User]()
    var tweets = [Tweet]()
    
    required init(json: JSON) throws {
        //print("The returned json \(json)")
        let userArray = json["users"].array
        if let jsonusers = userArray{
//            self.users = jsonusers.map({ (jsonuser) -> User in
//                return User(json: jsonuser)
//            })
            self.users = jsonusers.map({User(json:$0)})
        }
        let tweetArray = json["tweets"].arrayValue
        self.tweets = tweetArray.map({Tweet(json:$0)})
    }
}

class JsonError: JSONDecodable{
    required init(json: JSON) throws {
        print("The returned error is \(json)")
    }
}

