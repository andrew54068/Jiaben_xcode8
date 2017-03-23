//
//  VC_Login.swift
//  Jaiben
//
//  Created by kidnapper on 11/02/2017.
//  Copyright © 2017 JaiBen. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FacebookLogin

class VC_Login: VC_Base{
    
    var user_friendIsApprrovaled = false
    var alreadyLogin = false

    @IBOutlet var customFBLoginButton: UIButton!
    
    @IBAction func unwindSegue(_ segue:UIStoryboardSegue){
        self.handleCustomFBLogout()
        let VC_login = VC_Login()
        self.present(VC_login, animated: true, completion: nil)
        print("12345")
    }
    override func viewWillAppear(_ animated: Bool) {
        print("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$")
        guard FBSDKAccessToken.current() != nil else{
            //User not logs in yet
            print("user not logs in yet")
            customFBLoginButton.addTarget(self, action: #selector(handleCustomFBLogin), for: .touchUpInside)
            return
        }
        
        //User is already logged in before
        getUserInfo()
        DispatchQueue.main.async {
            [unowned self] in
            self.performSegue(withIdentifier: "loginWithFB", sender: self)
        }
        self.alreadyLogin = true
        print("user already logged in")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func handleCustomFBLogin() {
        //顯示FB授權畫面
        FBSDKLoginManager().logIn(withReadPermissions: ["email", "public_profile", "user_friends"], from: self){
            (result, err) in
            
            guard err == nil else{
                //error occur
                print("custom FB Login failed:", err!)
                return
            }
            if (result?.grantedPermissions.contains("user_friends"))!{
                self.user_friendIsApprrovaled = true
            }
            
            if ((result?.grantedPermissions.contains("email"))! && (result?.grantedPermissions.contains("public_profile"))!){
                //email、public_profile為必要資訊
                FBSDKProfile.enableUpdates(onAccessTokenChange: true)
                print(result!)
                self.getUserInfo()
                self.performSegue(withIdentifier: "loginWithFB", sender: self)
            }else{
                print("must needed email & public_profile")
                //以下插入提示視窗
                
                return
            }
        }
    }
    func handleCustomFBLogout() {
        FBSDKLoginManager().logOut()
        self.customFBLoginButton.setTitle("Log in with FB", for: .normal)
        print("custom FB log out")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getUserInfo(f:@escaping (()->())={return }){
        FBSDKGraphRequest(graphPath: "/me", parameters: userData.parameters).start{
            (connection, result, err) in
            if err != nil{
                print("failed to start graph request:", err!)
                return
            }else{
                userData.getDataFromJSon(result: result)
                
//                    userData.birthday = user_data["birthday"] as? String
                    print(userData.userID!)
                    print(userData.name)
                    print(userData.gender)
                    print(userData.email)
                    print(userData.profile_photo_large)
//                    print(userData.birthday)
//                    print(result!)
            }
            if self.user_friendIsApprrovaled{
                //朋友清單被授權才執行
                FBSDKGraphRequest(graphPath: "me/friends", parameters: ["fields": "id, name"]).start {
                    (connection, result, err) in
                    
                    if err != nil{
                        print("failed to get user friend:", err!)
                        return
                    }
                    
                    print(result!)
                }
            }
            f()
        }
        
        return
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
