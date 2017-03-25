//
//  VC_advice.swift
//  Jaiben
//
//  Created by kidnapper on 25/02/2017.
//  Copyright © 2017 JaiBen. All rights reserved.
//

import UIKit

class VC_advice: VC_Base, UIPickerViewDataSource, UIPickerViewDelegate{

    @IBOutlet var optionView: UIPickerView!
    @IBOutlet var comments: UITextView!
    @IBAction func submitComments(_ sender: Any) {
        let input = "context=\(optionSelected):\(comments.text)" + "&userID=\(userData.userID)"
        let request = buildJBRequest(input: input,urlAfterJB: "Message/addMessage.php", log: "意見回傳")
        buildDataTaskWithRequst(request: request, requestName: nil)
        
    }
    let options = ["針對介面","針對現有功能(不足或多餘)","期待功能","Bug回報","改善建議","想說的話"]
    var optionSelected = "針對介面"
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        optionSelected = options[row]
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        let input = "context=\(optionSelected):\(comments.text)" + "&userID=\(userData.userID)"
//        let request = buildJBRequest(input: input,urlAfterJB: "Message/addMessage.php", log: "意見回傳")
//        buildDataTaskWithRequst(request: request, requestName: nil)
//        
//    }
    override func getDataAfterRequest(result: String) {
        DispatchQueue.main.async {
            self.showMessage(message: "謝謝您的寶貴建議！", buttonText: "不客氣")

        }
    }
    
    override func doThingsAfterComfirmed() {
        self.dismiss(animated: true, completion: nil)
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
