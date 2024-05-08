//
//  newPasswordViewController.swift
//  NewsAPIProject
//
//  Created by R91 on 15/04/24.
//

import UIKit

class newPasswordViewController: UIViewController {
    
    @IBOutlet weak var newPaswd: UITextField!
    @IBOutlet weak var confirmNewPaswd: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func continueBtn(_ sender: Any) {
        if newPaswd.text == ""{
            alert(message: "Please Enter Your PAssword")
        }
        else if confirmNewPaswd.text == ""{
            alert(message: "Please Confirm Your Password")
        }
        else if newPaswd.text != confirmNewPaswd.text {
            alert(message: "Password not Matched Please Check it..!!")
        }
        else{
            navigate()
            msgPopUp(message: "Password Changed Successfully")
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
    
    func navigate(){
        let navigateToLogin = storyboard?.instantiateViewController(identifier: "LoginPageViewController") as! LoginPageViewController
        navigationController?.popToRootViewController(animated: true)
    }
    
}
