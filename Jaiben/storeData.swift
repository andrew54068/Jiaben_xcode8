//
//  storeData.swift
//  Jaiben
//
//  Created by kidnapper on 11/03/2017.
//  Copyright © 2017 JaiBen. All rights reserved.
//

import UIKit
import CoreLocation
import Foundation

struct storeData {
    static var id: String?
    static var name: String!
    static var photoUrl: URL?
    static var photo: UIImage?
    static var phone: String?
    static var address: String?
    static var menu_food: [String:Int]?
    static var menu_drink: [String:Int]?
    static var comments: [String:Any]?
    static var news: [String]?
    static var b_hours: [String]?
    static var allStoreList: [String] = []
    static var storeLocation: CLLocationCoordinate2D?
    
    static func getDataFromJson(result: [String:Any]) {
        storeData.id = result["id"] as? String
        storeData.name = result["name"] as! String
        print("storeData.name = \(storeData.name!)")
        storeData.phone = result["tel"] as? String
        storeData.address = result["address"] as? String
        storeData.photoUrl = URL(string: "http://actionstar.sa.ntnu.edu.tw/jiabong/pic/\(storeData.name!)/店面_\(storeData.name!)_1.jpg".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
        addressToGeoCoder(address: storeData.address!)
        print("storeData.photoUrl! = \(storeData.photoUrl!)")
        
        
    //        storeData.comments = result[""] as? [String:Any]
    //        storeData.news = result[""] as? [String]
            
//            if let menu = json[""] as? [String:Any]{
//                storeData.menu_food = menu[""] as? [String:Int]
//                storeData.menu_drink = menu[""] as? [String:Int]
//            }
        
    }
    
    static func buildStoreRequest(tag: Int, price: Int) -> URLRequest {
        var request = URLRequest(url: URL(string: "http://actionstar.sa.ntnu.edu.tw/jiabong/Menu/getStore.php")!)
        request.httpMethod = "POST"
        let requestString = "hash=This is Ivan Speaking.&option2=\(tag)&option4=\(price)"
        request.httpBody = requestString.data(using: .utf8)
        print("storeRequest = \(request)")
        print("storeRequestString = \(requestString)")
        return request
    }
    
    static func loadPhoto(url: URL){
        print("loadPhoto")
        URLSession.shared.dataTask(with: url, completionHandler: {
            (data, response, error) -> Void in
            guard (error == nil && data != nil) else{
                print("something wrong!!!!!!!!!!!!!!!!!!!!!!!!")
                print("error = \(String(describing: error))")
                return
            }
            let photo = UIImage(data: data!)
            storeData.photo = photo
            print("get photo~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
        }).resume()
        print("loadPhoto end")
    }
    
    static func addressToGeoCoder(address: String){
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(address) { (placemarks, error) in
            if placemarks != nil {
                self.storeLocation = placemarks?.first?.location?.coordinate
//                self.storeLocation?.longitude = (placemarks?.first?.location?.coordinate.longitude)!
                print("placemark exist and is \(placemarks as AnyObject)")
                print("placemark.first exist.location.coordinate and is \(String(describing: placemarks?.first?.location?.coordinate))")
                print("placemark.first.location.coordinate.latitude exist and is \((placemarks?.first?.location?.coordinate.latitude)!)")
                print("latitude = \(String(describing: self.storeLocation?.latitude))")
            }else{
                print("error = \(error as AnyObject)")
            }
        }
    }
}
