//
//  VC_Base.swift
//  Jaiben
//
//  Created by kidnapper on 11/02/2017.
//  Copyright © 2017 JaiBen. All rights reserved.
//
import UIKit


class VC_Base: UIViewController, UITextFieldDelegate{

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //gradien Background
        let color1 = UIColor(red: 238/255, green: 110/255, blue: 73/255, alpha: 1)
        let color2 = UIColor(red: 238/255, green: 158/255, blue: 73/255, alpha: 1)
        
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        gradient.colors = [color1.cgColor, color2.cgColor]
        gradient.startPoint = CGPoint(x: 0,y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1.2)
        self.view.layer.insertSublayer(gradient, at: 0)
        
        
        
        
        // Do any additional setup after loading the view.
    }
    

//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        let touch = touches.first
//        print("1234566")
//        print(touch!.locationInView(self.view))
//        print("1234566")
//        self.view.endEditing(true)
//    }
    
    override var shouldAutorotate : Bool {
        return false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buildJBRequest(input: String, urlAfterJB: String!, log: String?) -> URLRequest{
        var requestString = "hash=This is Ivan Speaking."
        if (input != "") {
            requestString += "&" + input
        }
        var request = URLRequest(url: NSURL(string: "http://actionstar.sa.ntnu.edu.tw/jiabong/" + urlAfterJB)! as URL)
        request.httpMethod = "POST"
        request.httpBody = requestString.data(using: .utf8)
        if (log != "") {
//            print(log! + requestString)
        }
        return request
    }
    func buildDataTaskWithRequst(request: URLRequest, requestName: String?, f:@escaping (() ->())={return }){
        URLSession.shared.dataTask(with: request){
            data, response, error in
            print("error = \(error as AnyObject)")
            guard (data != nil && error == nil) else{
                print("error")
                self.showMessage(message: "發生錯誤，請檢查網路連線後再試一次(error)", buttonText: "確認")
                return
            }
            if data == nil{
                self.showMessage(message: "無法取得資料，請確認連線正常後再試一次", buttonText: "確認")
            }else if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200{
                print("statusCode should be 200 but it's \(httpStatus.statusCode)")
                print("response = \(response)")
                self.showMessage(message: "發生錯誤，請檢查網路連線後再試一次", buttonText: "確認")
                return
            }
            let result = String(data: data!, encoding: .utf8)!
            print("******************************")
            if (result != "{\"success\":\"False\"}") {
                print("here is dump started \(result as AnyObject) here is dump end")
                self.getDataAfterRequest(result: result)
                print("data! = \(data!)")
                
            }
    //            print("result = \(result)")
            DispatchQueue.main.async {
                f()
            }
        }.resume()
    }
    func showMessage(message: String!, buttonText: String!){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonText, style: .default, handler: {action in self.doThingsAfterComfirmed()})
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func doThingsAfterComfirmed(){
        
    }
    
    func getDataAfterRequest(result: String){
        
    }
    
    func decodeFromJson(result: String) -> [String:Any]?{
        do{
            if let data = result.data(using: .utf8){
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:Any]
                print("success decodeFromJson")
//                print("json = \(json)")
                return json
            }else{
                print("here")
                return nil
            }
        }catch{
            print(error)
            print("陣列抓不成功")
            return nil
        }
    }
    
    
//    func textViewShouldEndEditing(textView: UITextView) -> Bool {
//        textView.resignFirstResponder()
//        return true
//    }
//    func textFieldShouldReturn(textField: UITextField) -> Bool {
//        self.view.endEditing(true)
//        return true
//    }

//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        self.view.endEditing(true)
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

extension NSLayoutConstraint {
    func setMultiplier(multiplier:CGFloat) -> NSLayoutConstraint{
        NSLayoutConstraint.deactivate([self])
        
        let newConstrain = NSLayoutConstraint(item: firstItem, attribute: firstAttribute, relatedBy: relation, toItem: secondItem, attribute: secondAttribute, multiplier: multiplier, constant: constant)
        
        newConstrain.priority = priority
        newConstrain.shouldBeArchived = self.shouldBeArchived
        newConstrain.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstrain])
        return newConstrain
    }
}
