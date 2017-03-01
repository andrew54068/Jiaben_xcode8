//
//  sideBarViewController.swift
//  Jaiben
//
//  Created by kidnapper on 04/02/2017.
//  Copyright © 2017 JaiBen. All rights reserved.
//

import UIKit

class VC_sideBar: UIViewController {

    var Switch: Bool = false
    @IBOutlet var bell: newButton!
    
    @IBAction func sideBarSwitch(_ sender: AnyObject) {
        let mainViewCOntroller = VC_mainView()
        guard Switch else{
            mainViewCOntroller.switchOnSideBar()
            Switch = true
            return
        }
        mainViewCOntroller.switchOffSideBar()
        Switch = false
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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
