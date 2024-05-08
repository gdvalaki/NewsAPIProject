//
//  OTPViewController.swift
//  NewsAPIProject
//
//  Created by R91 on 15/04/24.
//

import UIKit
import DPOTPView

class OTPViewController: UIViewController {
    
    @IBOutlet weak var otpOutlet: DPOTPView!
    @IBOutlet weak var progresbar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func verifyBtn(_ sender: Any) {
        guard let otp = otpOutlet.text else {
            return
        }
        var isValid = true
        for char in otp
        {
            if !char.isNumber
            {
                isValid = false
                break
            }
        }
        if otpOutlet.text?.count != 4
        {
            alert(message: "Enter 4 Digit OTP")
        }
        else if !isValid
        {
            alert(message: "Enter Digit Only In OTP")
        }
        else
        {
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) {[self] timer in
                progresbar.progress += 0.05
                if progresbar.progress == 1 {
                    timer.invalidate()
                    let c = storyboard?.instantiateViewController(identifier: "newPasswordViewController") as! newPasswordViewController
                    navigationController?.pushViewController(c, animated: true)
                    msgPopUp(message: "Profile Verification Successfully..!!")
                }
            }
        }
        
    }
    
    
    func alert(message: String){
        let alertview = UIAlertController(title: "Oops", message: message, preferredStyle: .alert)
        alertview.addAction(UIAlertAction(title: "Back", style: .default))
        alertview.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alertview, animated: true)
    }
    func msgPopUp(message: String){
        let congetView = UIAlertController(title: "Congretulation", message: message, preferredStyle: .alert)
        congetView.addAction(UIAlertAction(title: "Ok", style: .default))
        congetView.addAction(UIAlertAction(title: "Back", style: .default))
        present(congetView, animated: true)
    }
}
