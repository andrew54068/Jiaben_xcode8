//
//  VC_offer.swift
//  Jaiben
//
//  Created by kidnapper on 20/02/2017.
//  Copyright © 2017 JaiBen. All rights reserved.
//

import UIKit
import CoreLocation


class VC_offer: VC_Base, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIPopoverPresentationControllerDelegate {
    var uploadFirst: Bool = true
    
    
    @IBOutlet var storeName: UITextField!
    @IBOutlet var address: newButton!
    @IBOutlet var b_time: newButton!
    @IBOutlet var phone: newButton!
    @IBOutlet var menu: newButton!
    @IBOutlet var upload: newButton!
    @IBOutlet var confirm: newButton!
    @IBOutlet var cancel: newButton!
    @IBOutlet var upload_text: UILabel!
    @IBOutlet var upload_btn_width: NSLayoutConstraint!
    
    @IBAction func uploadLocation(_ sender: AnyObject) {
        let popController = UIStoryboard(name: "sideBarTab", bundle: nil).instantiateViewController(withIdentifier: "offerLocation")
        popController.modalPresentationStyle = UIModalPresentationStyle.popover
        
        popController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.down
        popController.popoverPresentationController?.delegate = self
        popController.popoverPresentationController?.sourceView = (sender as! UIView)
        popController.popoverPresentationController?.sourceRect = sender.bounds
        
        self.present(popController, animated: true, completion: nil)
        
    }
    
    @IBAction func uploadBeenTouched(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if uploadFirst{
            let newWidth = self.upload_btn_width.multiplier * 0.9
            upload_btn_width = upload_btn_width.setMultiplier(multiplier: newWidth)
            uploadFirst = false
        }
        
        if let photoPicked = info[UIImagePickerControllerOriginalImage] as? UIImage{
            let jpg = UIImageJPEGRepresentation(photoPicked, 1)
            let jpgImage = UIImage(data: jpg!)
            upload.imageView?.contentMode = UIViewContentMode.scaleAspectFill
            upload.setImage(jpgImage, for: UIControlState.normal)
            upload_text.isHidden = true
            
        }else{
            showMessage(message: "圖片載入失敗，請再試一次", buttonText: "確認")
            print("選擇圖片發生錯誤")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storeName.textAlignment = .center
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
        self.view.resignFirstResponder()
        print("end editing")
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        print("what is this for")
        return true
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
