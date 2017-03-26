//
//  outcomeViewController.swift
//  Jaiben
//
//  Created by kidnapper on 10/02/2017.
//  Copyright © 2017 JaiBen. All rights reserved.
//

import UIKit

class VC_outcome: VC_Base {

    
    @IBOutlet var name: UILabel!
    @IBOutlet var photo: UIImageView!
    @IBOutlet var b_hours: UIImageView!
    @IBOutlet var address: newButton!
    @IBOutlet var phone: newButton!
    @IBOutlet var comments: newButton!
    @IBOutlet var store_menu: newButton!
    @IBOutlet var up: newButton!
    @IBOutlet var down: newButton!
    @IBOutlet var back: newButton!
    @IBOutlet var news: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        loadStoreData()
        print("viewWillAppear")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadStoreData(){
        name.text = storeData.name
        photo.image = storeData.photo

        print("storeData.name = \(storeData.name)")
        print("storeData.photo = \(storeData.photo)")
        
    }
    
    @IBAction func unwindSegueToOutcome(_ segue: UIStoryboardSegue){
        
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
