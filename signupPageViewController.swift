//
//  signupPageViewController.swift
//  NewsAPIProject
//
//  Created by R91 on 15/04/24.
//

import UIKit

class signupPageViewController: UIViewController {
    
    // ** OUTLETS :-
    
    @IBOutlet weak var firstNameTxt: UITextField!
    @IBOutlet weak var lastNameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var paswdTxt: UITextField!
    @IBOutlet weak var confirmPaswdTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // ** BUTTONS :-
    
    @IBAction func signUpBtn(_ sender: Any) {
        if firstNameTxt.text == "" && lastNameTxt.text == "" && emailTxt.text == "" && paswdTxt.text == ""{
            alert(message: "Please Enter Your Details")
        }
        else if firstNameTxt.text == ""{
            alert(message: "Please Enter First Name")
        }
        else if lastNameTxt.text == ""{
            alert(message: "Please Enter Last Name")
        }
        else if emailTxt.text == ""{
            alert(message: "Please Enter Your E-mail")
        }
//        else  if !isValidEmail(email: emailTxt!.text!)
//        {
//            alert(message: "Please Enter valid E-mail..!!")
//        }
        else if paswdTxt.text == ""{
            alert(message: "Please Enter Strong Password")
        }
        else if confirmPaswdTxt.text == ""{
            alert(message: "Please Confirm Your Password")
        }
        else if paswdTxt.text != confirmPaswdTxt.text{
            alert(message: "Password Not Matched")
        }
        else{
            navigate()
            msgPopUp(message: "SignUp Successfully")
        }
    }
    
    // *** FUNCTIONS :-
    
//    private func isValidEmail(email: String) -> Bool{
//        let email = NSPredicate(format: "SELF MATCHES %@", "^[A-Za-z0-9+_.-]+@(.+)$")
//        return email.evaluate(with: email)
//    }
    
    func alert(message: String){
        let alertview = UIAlertController(title: "Oops", message: message, preferredStyle: .alert)
        alertview.addAction(UIAlertAction(title: "Ok", style: .default))
        alertview.addAction(UIAlertAction(title: "Back", style: .default))
        present(alertview, animated: true)
    }
    
    func msgPopUp(message: String){
        let congetView = UIAlertController(title: "Congretulation", message: message, preferredStyle: .alert)
        congetView.addAction(UIAlertAction(title: "Ok", style: .default))
        congetView.addAction(UIAlertAction(title: "Back", style: .default))
        present(congetView, animated: true)
    }
    
    func navigate(){
        let navigateToFirstPage = storyboard?.instantiateViewController(identifier: "firstPage") as! firstPage
        navigationController?.pushViewController(navigateToFirstPage, animated: true)
    }

}
