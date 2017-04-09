//
//  VC_eatWith.swift
//  Jaiben
//
//  Created by kidnapper on 08/04/2017.
//  Copyright © 2017 JaiBen. All rights reserved.
//

import UIKit

class VC_eatWith : VC_Base{

    //UI
    @IBOutlet var btn_seekFriend : UIButton?
    
    //Data
    private var socialData : social = social()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btn_click_seekFriend(_ sender: Any){
        
    }
    
    private func seekRequest()->URLRequest{
        return buildJBRequest(input: "unimplement", urlAfterJB:"social/seekPartner.php", log: "build seeking request")
    }
    
    private func seekPost(){
        buildDataTaskWithRequst(request: seekRequest(), requestName: "Friend Seeking Post~")
    }
}
