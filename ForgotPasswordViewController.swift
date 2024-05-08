//
//  ForgotPasswordViewController.swift
//  NewsAPIProject
//
//  Created by R91 on 15/04/24.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var emailtextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sendOTPBtn(_ sender: Any) {
        if emailtextfield.text == "" {
            alert(message: "Please Enter Your E-mail")
        }
        else{
            navigate()
        }
    }
    
    func alert(message: String){
        let alertview = UIAlertController(title: "Oops", message: message, preferredStyle: .alert)
        alertview.addAction(UIAlertAction(title: "Back", style: .default))
        alertview.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alertview, animated: true)
    }
    func navigate(){
        let navigateToOTPpage = storyboard?.instantiateViewController(identifier: "OTPViewController") as! OTPViewController
        navigationController?.pushViewController(navigateToOTPpage, animated: true)
    }
   

}
