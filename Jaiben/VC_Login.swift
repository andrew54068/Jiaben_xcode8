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

    @IBOutlet var customFBLoginButton: UIButton!
    
    @IBAction func unwindSegue(_ segue:UIStoryboardSegue){
        self.handleCustomFBLogout()
    }
    override func viewWillAppear(_ animated: Bool) {
        print("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$")
//        print(FBSDKAccessToken.current())
        guard FBSDKAccessToken.current() != nil else{
            //User not logs in yet
            print("user not logs in yet")
            customFBLoginButton.addTarget(self, action: #selector(handleCustomFBLogin), for: .touchUpInside)
            return
        }
        
        //User is already logged in
        //        getFBUserData()
        showUserInfo()
        DispatchQueue.main.async {
            [unowned self] in
            self.performSegue(withIdentifier: "loginWithFB", sender: self)
        }
//        performSegue(withIdentifier: "loginWithFB", sender: self)
//        customFBLoginButton.addTarget(self, action: #selector(handleCustomFBLogout), for: .touchUpInside)
        print("user already logged in")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func handleCustomFBLogin() {
        FBSDKLoginManager().logIn(withReadPermissions: ["email", "public_profile", "user_friends"], from: self){
            (result, err) in
            
            if err != nil{
                print("custom FB Login failed:", err!)
                return
            }
            print(result!)
            self.showUserInfo()
            self.performSegue(withIdentifier: "loginWithFB", sender: self)
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
    
    func showUserInfo(){
        FBSDKGraphRequest(graphPath: "/me", parameters: userData.parameters).start {
            (connection, result, err) in
            
            if err != nil{
                print("failed to start graph request:", err!)
                return
            }else{
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
//                    userData.birthday = user_data["birthday"] as? String
                    
                    print(userData.userID!)
                    print(userData.name)
                    print(userData.gender)
                    print(userData.email)
                    print(userData.profile_photo_large)
//                    print(userData.birthday)
                    print(result!)
                }
            }
        }
        FBSDKGraphRequest(graphPath: "me/friends", parameters: ["fields": "id, name"]).start {
            (connection, result, err) in
            
            if err != nil{
                print("failed to get user friend:", err!)
                return
            }
            
            print(result!)
        }
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
