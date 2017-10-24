//
//  MainViewController.swift
//  Jaiben
//
//  Created by kidnapper on 21/01/2017.
//  Copyright © 2017 JaiBen. All rights reserved.
//

import UIKit
import Foundation
import FBSDKLoginKit

class VC_mainView: VC_Base {
    
    var blurEffectView: UIVisualEffectView?
    var sideBarSwitch = true
    
    
    
    @IBOutlet var profile: newButton!
    @IBOutlet var lid: newButton!
    @IBOutlet var bell: newButton!
    @IBOutlet var sideBar: UIView!

    @IBAction func EdgePan(_ sender: AnyObject) {
        if let touch = sender as? UITouch{
            print(touch)
        }
        switchOnSideBar()
        sideBarSwitch = false
    }
    
    @IBAction func bellTouched(_ sender: AnyObject) {
        guard sideBarSwitch else{
            switchOffSideBar()
            sideBarSwitch = true
            
            return
        }
        switchOnSideBar()
        sideBarSwitch = false
        
    }
    @IBAction func unwindSegueToMainView(_ segue: UIStoryboardSegue){
        if segue.identifier == "unwindMenu"{
            let destinationViewController = segue.destination as! VC_mainView
            destinationViewController.blurEffectView!.removeFromSuperview()
            let storeRequest = storeData.buildStoreRequest(tag: VC_menu.tag, price: VC_menu.price)
            print(VC_menu.tag)
            print("storeRequest = \(storeRequest)")
            print(storeRequest.httpMethod!)
            print(storeRequest.httpBody!)
            buildDataTaskWithRequst(request: storeRequest, requestName: "取得店家資料")
        }
        
        if segue.identifier == "unwindOffer"{
            print("1234567890")
            if VC_offer.storeName != ""{
                let input = "img=\(VC_offer.photoEncodedString)&userID=\(userData.userID!)&name=\(VC_offer.storeName)&tel=\(VC_offer.phone)&address=\(VC_offer.address)&time=\(VC_offer.b_time)"
                let request = buildJBRequest(input: input, urlAfterJB: "addStore/img.php", log: "upload store")
                buildDataTaskWithAddStoreRequst(request: request)
                VC_offerLocation.prelocate = nil
            }
        }
    }
    
    override func getDataAfterRequest(result: String) {
        let dataAfterDecode = self.decodeFromJson(result: result)
        if dataAfterDecode != nil{
        storeData.getDataFromJson(result: dataAfterDecode!)
        print("storeData.photoUrl = \(storeData.photoUrl!)")
        storeData.loadPhoto(url: storeData.photoUrl!)
        print("123")
        }else{
            self.showMessage(message: "資料獲取失敗，請稍後再試", buttonText: "確認")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
            VC_Login().getUserInfo(f:{
                self.profile.setImage(userData.profile_photo_large, for: UIControlState.normal)
                self.profile.layer.cornerRadius = 0.5 * self.profile.bounds.width
                self.profile.clipsToBounds = true
                return
            })
        self.sideBar!.transform = CGAffineTransform(translationX: -self.view.bounds.width * 0.4, y: 0)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showMenu" {
            let sourceViewController = segue.source as! VC_mainView
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
            blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView?.frame = self.view.bounds
            sourceViewController.view.addSubview(blurEffectView!)
            sourceViewController.view.bringSubview(toFront: blurEffectView!)
        }
    }
    func switchOnSideBar(){
        UIView.animate(withDuration: 0.4, delay: 0.0, options: [], animations: {
            self.sideBar!.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: nil)
    }
    func switchOffSideBar(){
        UIView.animate(withDuration: 0.4, delay: 0.0, options: [], animations: {
            self.sideBar!.transform = CGAffineTransform(translationX: -self.view.bounds.width * 0.4, y: 0)
            }, completion: nil)    }
    func buildDataTaskWithAddStoreRequst(request: URLRequest){
        URLSession.shared.dataTask(with: request){
            data, response, error in
            guard (data != nil && error == nil) else{
                print("error")
                self.showMessage(message: "發生錯誤，請檢查網路連線後再試一次", buttonText: "確認")
                return
            }
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200{
                print("statusCode should be 200 but it's \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
                self.showMessage(message: "發生錯誤，請檢查網路連線後再試一次", buttonText: "確認")
                return
            }
//            let result = String(data: data!, encoding: .utf8)!
//            print("result = \(result)")
//            if (result != "{\"success\":\"False\"}") {
//                let jsonData = self.decodeFromJson(result: result)
//                print("jsonData! = \(jsonData!)")
//            }
        }.resume()
    }

}

