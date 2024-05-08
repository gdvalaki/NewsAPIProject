//
//  LoginPageViewController.swift
//  NewsAPIProject
//
//  Created by R91 on 15/04/24.
//

import UIKit

class LoginPageViewController: UIViewController {
    
    var a = 0
    
    // *** OUTLETS :-
    
    @IBOutlet weak var emailtxtfield: UITextField!
    @IBOutlet weak var passwordtxtfield: UITextField!
    @IBOutlet weak var paswordHideOrNotOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // *** BUTTONS :-
    
    @IBAction func forgotPaswdBtn(_ sender: Any) {
        navigate3()
    }
    
    @IBAction func googleBtn(_ sender: Any) {
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        if emailtxtfield.text == "" && passwordtxtfield.text == ""{
            alert(message: "Please Enter Your Details")
        }
        else if emailtxtfield.text == ""{
            alert(message: "Please Enter Your E-mail")
        }
        else if passwordtxtfield.text == ""{
            alert(message: "Please Enter your Password")
        }
        else  if !isValidEmail(email: emailtxtfield!.text!)
        {
            alert(message: "Please Enter valid E-mail..!!")
        }
        else{
//            msg(message: "Login Successfully")
            navigate()
        }
    }
    
    @IBAction func paswordHideOrNotBtn(_ sender: Any) {
        if a == 0
        {
            paswordHideOrNotOutlet.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            passwordtxtfield.isSecureTextEntry = false
            a = 1
        }
        else
        {
            paswordHideOrNotOutlet.setImage(UIImage(systemName: "eye"), for: .normal)
            passwordtxtfield.isSecureTextEntry = true
            a = 0
        }
    }
    
    @IBAction func signupBtn(_ sender: Any) {
        navigate2()
    }
    
    private func isValidEmail(email: String) -> Bool {
           let emailPredicate = NSPredicate(format: "SELF MATCHES %@", "^[A-Za-z0-9+_.-]+@(.+)$")
           return emailPredicate.evaluate(with: email)
       }
    
    func alert(message: String){
        let alertview = UIAlertController(title: "Oops", message: message, preferredStyle: .alert)
        alertview.addAction(UIAlertAction(title: "Back", style: .default))
        alertview.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alertview, animated: true)
    }
    func msg(message: String){
        let congretsMsg = UIAlertController(title: "CongreTilation", message: message, preferredStyle: .alert)
        congretsMsg.addAction(UIAlertAction(title: "Ok", style: .default))
        congretsMsg.addAction(UIAlertAction(title: "Back", style: .default))
        present(congretsMsg, animated: true)
    }
    
    func navigate(){
        let nevigateToFirstPage = storyboard?.instantiateViewController(identifier: "firstPage") as! firstPage
        navigationController?.pushViewController(nevigateToFirstPage, animated: true)
    }
    
    func navigate2(){
        let navigateToSignupPage = storyboard?.instantiateViewController(withIdentifier: "signupPageViewController") as! signupPageViewController
        navigationController?.pushViewController(navigateToSignupPage, animated: true)
    }
    
    func navigate3(){
        let navigateToForgotPaswd = storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
        navigationController?.pushViewController(navigateToForgotPaswd, animated: true)
    }
}
