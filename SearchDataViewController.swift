//
//  SearchDataViewController.swift
//  NewsAPIProject
//
//  Created by R91 on 10/04/24.
//

import UIKit

class SearchDataViewController: UIViewController {

    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var DescriptionLbl: UILabel!
    @IBOutlet weak var publishedLbl: UILabel!
    
    
    var newsImage = UIImage(named: "" )
    var publishedLable = ""
    var titles = ""
    var Description = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("===========\(titles)")
        imageOutlet.image = newsImage
        publishedLbl.text = publishedLable
        titleLbl.text = titles
        DescriptionLbl.text = Description
        imageOutlet.layer.cornerRadius = 15
        
    }
    
    @IBAction func homeBtn(_ sender: Any) {
        navigate()
    }
    
    func navigate(){
        _ = storyboard?.instantiateViewController(identifier: "firstPage") as! firstPage
        navigationController?.popViewController(animated: true)
    }
    
}
