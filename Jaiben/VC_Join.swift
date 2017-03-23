//
//  VC_Join.swift
//  Jaiben
//
//  Created by kidnapper on 18/02/2017.
//  Copyright © 2017 JaiBen. All rights reserved.
//

import UIKit

class VC_Join: VC_Base, UITextViewDelegate{
    
    var keyboardShowAlready: Bool = false
    var keyboardHeight: CGFloat = 0
    
    @IBOutlet var textView: UITextView!
    @IBOutlet var scrollView: UIScrollView!
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(VC_Join.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(VC_Join.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layer.sublayers!.remove(at: 0)
        self.hideKeyboard()

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
        
        let keyboardFrame: CGRect = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        keyboardHeight = keyboardFrame.height
        let changeInHeight = (keyboardFrame.height + 20) * (show ? 1 : -1)
        scrollView.contentInset.bottom += changeInHeight
        scrollView.scrollIndicatorInsets.bottom += keyboardFrame.height * (show ? 1 : -1)
        print(scrollView.contentInset.bottom)
        print(scrollView.scrollIndicatorInsets.bottom)
        
        print("adjustingHighLight")
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        let difference = (view.frame.maxY - keyboardHeight) - textView.frame.maxY
        scrollView.contentOffset = CGPoint(x: 0, y: -difference)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
        self.view.resignFirstResponder()
        print("end editing")
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
        scrollView.contentInset = UIEdgeInsets.zero
        scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
    }
}
