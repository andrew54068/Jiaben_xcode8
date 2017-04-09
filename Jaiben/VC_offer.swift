//
//  VC_offer.swift
//  Jaiben
//
//  Created by kidnapper on 20/02/2017.
//  Copyright © 2017 JaiBen. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire

class VC_offer: VC_Base, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIPopoverPresentationControllerDelegate{
    var uploadFirst: Bool = true
    static var address: String = ""
    static var storeName: String = ""
    static var photoEncodedString: String = ""
    static var b_time: String = "1"
    static var menu: String = "1"
    static var phone: String = "1"
    
    
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
    
    @IBAction func addStore(_ sender: Any) {
        guard storeName.text! != "" else {
            showMessage(message: "店家名稱必填", buttonText: "確認")
            return
        }
        VC_offer.storeName = storeName.text!
        if (VC_offer.address != "" || VC_offer.photoEncodedString != "" || VC_offer.b_time != "" || VC_offer.menu != "" || VC_offer.phone != ""){
            self.performSegue(withIdentifier: "unwindOffer", sender: self)
        }else{
            self.showMessage(message: "除了店家名稱之外，至少擇一編輯", buttonText: "確認")
        }
    }
    
    
    @IBAction func uploadLocation(_ sender: AnyObject) {
        let popController = UIStoryboard(name: "sideBarTab", bundle: nil).instantiateViewController(withIdentifier: "offerLocation")
        popController.modalPresentationStyle = UIModalPresentationStyle.popover
        
        popController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.down
        popController.popoverPresentationController?.delegate = self
        popController.popoverPresentationController?.sourceView = (sender as! UIView)
        popController.popoverPresentationController?.sourceRect = sender.bounds
        
        self.present(popController, animated: true, completion: nil)
        
    }
    @IBAction func unwindToOffer(_ segue:UIStoryboardSegue){
        print("unwindToOffer")
        if segue.identifier == "offerLocation"{
            VC_offer.address = VC_offerLocation.addr
            print("VC_offerLocation.addr = \(VC_offerLocation.addr)")
        }
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
            let image = UIImageJPEGRepresentation(photoPicked, 0.1)!

            let fileManager = FileManager.default
//            let rootPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,
//                                                               .userDomainMask, true)[0] as String
//            let filePath = "\(rootPath)/pickedimage.jpg"
//            let imageData = UIImageJPEGRepresentation(photoPicked, 1.0)
//            let isCreate = fileManager.createFile(atPath: filePath, contents: imageData, attributes: nil)
//            
//            //上传图片55
//            if (fileManager.fileExists(atPath: filePath)){
//                //取得NSURL
//                let imageNSURL:URL = URL.init(fileURLWithPath: filePath) as URL
//                
//                //使用Alamofire上传
//                Alamofire.upload(imageNSURL,to: "http://140.122.184.227/~ivan/JB/addStore/test.php")
//                    .responseString { response in
//                        print("Success: \(response.result.isSuccess)")
//                        print("Response String: \(response.result.value!)")
//                }
//            }
            
//            Alamofire.request("http://140.122.184.227/~ivan/JB/addStore/test.php", method: .post, parameters: base64String, encoding: .Json, headers: "")
//            Alamofire.upload(image, to: "http://140.122.184.227/~ivan/JB/addStore/test.php").responseJSON { response in
//                print(response.request!)  // original URL request
//                print(response.response!) // HTTP URL response
//                print(response.data!)     // server data
//                print(response.result)   // result of response serialization
//                
//                if let JSON = response.result.value {
//                    print("JSON: \(JSON)")
//                }
//            }
            let jpg = UIImageJPEGRepresentation(photoPicked, 0.1)
            let jpgImage = UIImage(data: jpg!)
            upload.imageView?.contentMode = UIViewContentMode.scaleAspectFill
            upload.setImage(jpgImage, for: UIControlState.normal)
            upload_text.isHidden = true
            DispatchQueue.global(qos: .userInteractive).async {
                let jpgEncoded = jpg?.base64EncodedString(options: .endLineWithLineFeed)
                VC_offer.photoEncodedString = jpgEncoded!
//                print("jpgEncoded = \(jpgEncoded)")
            }
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
