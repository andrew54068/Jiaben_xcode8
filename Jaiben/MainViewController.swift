//
//  MainViewController.swift
//  Jaiben
//
//  Created by kidnapper on 21/01/2017.
//  Copyright © 2017 JaiBen. All rights reserved.
//

import UIKit
import Foundation

class MainViewController: VC_Base {
    
    @IBOutlet var lid: newButton!
    var blurEffectView: UIVisualEffectView?
    var sideBarSwitch = true
    

    @IBAction func EdgePan(_ sender: AnyObject) {
        if let touch = sender as? UITouch{
            print(touch)
        }
        print(type(of: sender))
        print("@@@@@@@@@@@@@")
        switchOnSideBar()
        sideBarSwitch = false
    }

    @IBOutlet var bell: newButton!
    @IBOutlet var sideBar: UIView!
    
    
    @IBAction func bellTouched(_ sender: AnyObject) {
        guard sideBarSwitch else{
            switchOffSideBar()
            sideBarSwitch = true
            print("sideBarSwitch = \(sideBarSwitch)")
            return
        }
        switchOnSideBar()
        sideBarSwitch = false
        print("sideBarSwitch = \(sideBarSwitch)")
    }
    @IBAction func unwindSegueToMainView(_ segue: UIStoryboardSegue){
        if segue.identifier == "unwindMenu"{
            let destinationViewController = segue.destination as! MainViewController
            destinationViewController.blurEffectView!.removeFromSuperview()
        }else if segue.identifier == "unwindOutcome"{
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
            let sourceViewController = segue.source as! MainViewController
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
