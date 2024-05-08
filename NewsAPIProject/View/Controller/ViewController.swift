//
//  ViewController.swift
//  NewsAPIProject
//
//  Created by R91 on 08/04/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    @IBAction func googlebtn(_ sender: Any) {
        navigate()
    }
    @IBAction func loginbtn(_ sender: Any) {
        navigate()
    }
    
    func navigate(){
        let frontPagrnavigate = storyboard?.instantiateViewController(identifier: "LoginPageViewController") as! LoginPageViewController
        navigationController?.pushViewController(frontPagrnavigate, animated: true)
    }
    
}

