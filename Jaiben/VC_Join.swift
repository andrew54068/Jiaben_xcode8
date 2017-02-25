//
//  VC_Join.swift
//  Jaiben
//
//  Created by kidnapper on 18/02/2017.
//  Copyright © 2017 JaiBen. All rights reserved.
//

import UIKit

class VC_Join: VC_Base {

    var keyboardShowAlready: Bool = false
    @IBOutlet var scrollView: UIScrollView!
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(VC_Join.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(VC_Join.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.hideKeyboard()
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(_ notification: Notification) {
        guard keyboardShowAlready else{
            adjustingHightLight(true, notification: notification)
            keyboardShowAlready = true
            return
        }
    }
    
    func keyboardWillHide(_ notification: Notification) {
        adjustingHightLight(false, notification: notification)
        keyboardShowAlready = false
    }
    func adjustingHightLight(_ show: Bool, notification: Notification) {
        let userInfo = notification.userInfo!
        
        let keyboardFrame: CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue

        let changeInHeight = (keyboardFrame.height + 20) * (show ? 1 : -1)
        scrollView.contentInset.bottom += changeInHeight
        scrollView.scrollIndicatorInsets.bottom += changeInHeight
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
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

extension VC_Join
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(VC_Join.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
