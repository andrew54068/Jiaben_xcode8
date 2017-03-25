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
            
        }else if segue.identifier == "unwindOutcome"{
            
        }
    }
    
    override func getDataAfterRequest(result: String) {
        let dataAfterDecode = self.decodeFromJson(result: result)
        storeData.getDataFromJson(result: dataAfterDecode!)
        print("storeData.photoUrl = \(storeData.photoUrl!)")
        storeData.loadPhoto(url: storeData.photoUrl!)
        print("123")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        DispatchQueue.global(qos: .userInitiated).async {
        
//            DispatchQueue.main.sync {
                print("YOYO1")
                print("YOYO2")
                VC_Login().getUserInfo(f:{
                print("YOYO3")
                    self.profile.setImage(userData.profile_photo_large, for: UIControlState.normal)
                let profile = userData.profile_photo_large
                self.profile.imageView?.image = profile
                self.profile.layer.cornerRadius = 0.5 * self.profile.bounds.width
                self.profile.clipsToBounds = true
//                if userData.profile_photo_large != nil {
//                    self.profile.imageView?.image = UIImage(named: "adventure_king")
//                    print("profile image set")
//                }else if userData.profile_photo_large == nil{
//                    print("userData.profile_photo = \(userData.profile_photo_large)123456")
//                }
            print("YOYO4")
            return
        })
//            }
//        }
        
        
        self.sideBar!.transform = CGAffineTransform(translationX: -self.view.bounds.width * 0.4, y: 0)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    

//    override func viewWillAppear(animated: Bool) {
//        UIView.animateWithDuration(0.4, delay: 0.0, options: [], animations: {
//            self.sideBar!.transform = CGAffineTransformMakeTranslation(-self.view.bounds.width * 0.4, 0)
//            }, completion: nil)
//    }

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
    

}

