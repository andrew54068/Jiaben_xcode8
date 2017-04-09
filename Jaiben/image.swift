//
//  image.swift
//  Jaiben
//
//  Created by kidnapper on 07/04/2017.
//  Copyright © 2017 JaiBen. All rights reserved.
//

import UIKit

class image: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        
//        for item in cart{
//            UploadRequest(uid:uid,item:item)
//        }
//        func UploadRequest(uid:String?,item:shopping_item)
//        {
//            let body = NSMutableData()
//            
//            let mimetype = "image/jpeg"
//            body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
//            body.append("Content-Disposition:form-data; name=\"test\"\r\n\r\n".data(using: String.Encoding.utf8)!)
//            body.append("hi\r\n".data(using: String.Encoding.utf8)!)
//            body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
//            body.append("Content-Disposition:form-data; name=\"file\"; filename=\"\(fname)\"\r\n".data(using: String.Encoding.utf8)!)
//            body.append("Content-Type: \(mimetype)\r\n\r\n".data(using: String.Encoding.utf8)!)
//            body.append(image_data!)
//            body.append("\r\n".data(using: String.Encoding.utf8)!)
//            body.append("--\(boundary)--\r\n".data(using: String.Encoding.utf8)!)
//            //body.append(postString.data(using: .utf8)!)
//            request.httpBody = body as Data
//            //let session = URLSession.shared
//            let task = URLSession.shared.dataTask(with: request as URLRequest) { (
//                data, response, error) in
//                guard let _:Data = data, let _:URLResponse = response , error == nil else {
//                    print("error")
//                    return
//                }
//                let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
//                print(dataString)
//            }
//            task.resume()
//        }
//        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
