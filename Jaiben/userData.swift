//
//  userData.swift
//  Jaiben
//
//  Created by kidnapper on 02/03/2017.
//  Copyright © 2017 JaiBen. All rights reserved.
//

//import Foundation
import UIKit

struct userData {
    static let parameters = ["fields": "id, name, picture.type(large), gender, email"]
    
    static var userID: String!
    static var name: String!
    static var nickname: String?
    static var profile_photo_large: UIImage = UIImage()
    static var profile_photo_normal: UIImage = UIImage()
    static var profile_photo_small: UIImage = UIImage()
    static var gender: String!
    static var email: String!
    static var birthday: String?
    static var password: String?
    
    //character
    static var level: Int = 0
    static var charactor: String?
    static var exp_total: [String:Int]!
    static var exp_current: Int = 0
    static var energy: Int!
    static var coin: Int!
    static var lottery_ticket: Int!
    
    static var user_menu_default: [String:Any] =
        ["meatEater" : "",
        "typeOfMeal" : "",
            "price" : "",
         "distance" : ""]
    
    static var FBid: String!
    static var isFB: Bool = false
    
    static func getDataFromJSon(result: Any?) {
        if let user_data = result as? [String:Any]{
            userData.userID = user_data["id"] as? String
            userData.name = user_data["name"] as? String
            userData.gender = user_data["gender"] as? String
            userData.email = user_data["email"] as? String
            if let photo = user_data["picture"] as? [String:Any]{
                let photo_data = photo["data"] as? [String:Any]
                let url = URL(string: (photo_data?["url"] as? String)!)
                let data = try! Data(contentsOf: url!)
                userData.profile_photo_large = UIImage(data: data)!
                print("get photo")
            }
        }
    }
    
//    func urlToImage(url: URL){
//        profile_photo = UIImage(data:)
//    }
}
