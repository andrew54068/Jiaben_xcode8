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
    override func viewDidAppear(_ animated: Bool) {
        guard FBSDKAccessToken.current() != nil else{
            //User not logs in yet
            print("user not logs in yet")
            customFBLoginButton.addTarget(self, action: #selector(handleCustomFBLogin), for: .touchUpInside)
            return
        }
        
        //User is already logged in
        //        getFBUserData()
        performSegue(withIdentifier: "loginWithFB", sender: self)
        handleCustomFBLogin()
        customFBLoginButton.addTarget(self, action: #selector(handleCustomFBLogout), for: .touchUpInside)
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
            if FBSDKAccessToken.current() != nil{
                print("Successfully logged in with Facebook...")
                self.customFBLoginButton.setTitle("Log out FB", for: .normal)
                self.showUserInfo()
                self.performSegue(withIdentifier: "loginWithFB", sender: nil)
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
    
//    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
//
//        if error != nil{
//            print(error.localizedDescription)
//            return
//        }
//        print("Successfully logged in with Facebook...")
//        showUserInfo()
//        self.performSegue(withIdentifier: <#T##String#>, sender: <#T##Any?#>)
//    }
    func showUserInfo(){
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, name, email"]).start {
            (connection, result, err) in
            
            if err != nil{
                print("failed to start graph request:", err!)
                return
            }
            
            print(result!)
        }
        FBSDKGraphRequest(graphPath: "me/friends", parameters: ["fields": "id, name, email"]).start {
            (connection, result, err) in
            
            if err != nil{
                print("failed to get user friend:", err!)
                return
            }
            
            print(result!)
        }
    }
    
//    func getFBUserData(){
//        if((FBSDKAccessToken.current()) != nil){
//            FBSDKGraphRequest(graphPath: "me", parameters: StaticUserData.parameters).startWithCompletionHandler({ (connection, result, error) -> Void in
//                if (error == nil){
//                    StaticUserData.name = result["name"] as? String
//                    StaticUserData.email = result["email"] as? String
//                    let fbid = result["id"] as? String
//                    StaticUserData.fbid = fbid!
//                    StaticUserData.gender = result["gender"]as? String
//                    StaticUserData.nickname = StaticUserData.name
//                    StaticUserData.isFB = true
//                    
//                    //picture
//                    var pictureUrl = ""
//                    
//                    if let picture = result["picture"] as? NSDictionary,let data = picture["data"] as? NSDictionary,let url = data["url"] as? String {
//                        pictureUrl = url
//                    }
//                    let url = NSURL(string: pictureUrl)
//                    print(url)
//                    NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler:
//                        { (data, response, error) -> Void in
//                            if error != nil {
//                                print(error)
//                                return
//                            }else{
//                                let image = UIImage(data: data!)
//                                dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                                    StaticUserData.photo = image!
//                                })
//                            }
//                    }).resume()
//                    //player data
//                    self.builddataTaskWithRequest(self.postData.haveFBaccount(), requestType: "!")
//                }
//            })
//        }
//    }

    
//    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
//        print("Did log out of Facebook...")
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
