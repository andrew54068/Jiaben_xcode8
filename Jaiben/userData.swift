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
    static let parameters = ["fields": "id, name, picture.type(normal), gender, email"]
    
    static var userID: String! = ""
    static var name: String! = ""
    static var nickname: String = ""
    static var profile_photo: UIImage = UIImage()
    static var gender: String! = ""
    static var email: String! = ""
    static var birthday: String! = ""
    static var password: String = ""
    
    static var FBid: String! = ""
    static var isFB: Bool! = false
    
//    func urlToImage(url: URL){
//        profile_photo = UIImage(data:)
//    }
}
