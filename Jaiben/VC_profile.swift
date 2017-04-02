//
//  VC_profile.swift
//  Jaiben
//
//  Created by kidnapper on 03/03/2017.
//  Copyright © 2017 JaiBen. All rights reserved.
//

import UIKit

class VC_profile: UIViewController {

    @IBOutlet var photo: UIImageView!
    @IBOutlet var character: UIImageView!
    @IBOutlet var gender: UIImageView!
    @IBOutlet var email: UILabel!
    @IBOutlet var nickname: UILabel!
    @IBOutlet var name: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        
        name.text = userData.name
        nickname.text = userData.nickname ?? userData.name
        email.text = userData.email
        photo.image = userData.profile_photo_large
        photo.contentMode = .scaleAspectFill
        print("sucessfully change the profile photo")
        
        
        if userData.gender != nil{
            if userData.gender == "male"{
                gender.image = UIImage(named: "male")
            }else if userData.gender == "female"{
                gender.image = UIImage(named: "female")
            }else{
                print("not getting gender")
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.layer.sublayers!.remove(at: 0)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
