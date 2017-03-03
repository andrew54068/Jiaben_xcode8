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
    
    override func viewWillAppear(_ animated: Bool) {
        photo.image = userData.profile_photo
        print("sucessfully change the profile photo")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
