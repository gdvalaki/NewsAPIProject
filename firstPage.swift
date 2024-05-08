//
//  firstPage.swift
//  NewsAPIProject
//
//  Created by R91 on 08/04/24.
//

import UIKit

class firstPage: UIViewController, UITableViewDelegate, UITableViewDataSource,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var country = "in"
    var category = "sport"
    
    var viewModel : APIData = APIData()
    var array: News?
    var arr : NewsData?
    
    @IBOutlet weak var indiaOutlet: UIButton!
    @IBOutlet weak var usaOutlet: UIButton!
    @IBOutlet weak var ausOutlet: UIButton!
    @IBOutlet weak var chainaOutlet: UIButton!
    @IBOutlet weak var letestNewsOutlet: UIButton!
    @IBOutlet weak var sportNewsOutlet: UIButton!
    @IBOutlet weak var healthNewsOutlet: UIButton!
    @IBOutlet weak var politicNewsOutlet: UIButton!
    @IBOutlet weak var tableviewLayout: UITableView!
    @IBOutlet weak var collectionCell: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getNewes(country: "in", category: "sport") { newes in
            DispatchQueue.main.async { [self] in
                array = newes
                self.tableviewLayout.reloadData()
                self.collectionCell.reloadData()
            }
        }
    }
    
    func apicalling(country: String,category: String){
        viewModel.getNewes(country: country, category: category) { newes in
            DispatchQueue.main.async { [self] in
                array = newes
                self.tableviewLayout.reloadData()
            }
        }
    }
    
    // *** BUTTON FOR COUNTRY :---
    
    @IBAction func searchBtn(_ sender: Any) {
        navigate1()
    }
    
    @IBAction func homeBtn(_ sender: Any) {
        navigate()
    }
    
    @IBAction func indiaBtn(_ sender: Any) {
        country = "in"
        apicalling(country: country, category: category)
    }
    @IBAction func usaBtn(_ sender: Any) {
        country = "us"
        apicalling(country: country, category: category)
    }
    @IBAction func ausBtn(_ sender: Any) {
        country = "au"
        apicalling(country: country, category: category)
    }
    @IBAction func chainaBtn(_ sender: Any) {
        country = "ch"
        apicalling(country: country, category: category)
    }
    
    
    // *** BUTTON FOR NEWS :---
    
    @IBAction func letestnewsbtn(_ sender: Any) {
        category = "business"
        apicalling(country: country, category: category)
    }
    @IBAction func sportnewsbtn(_ sender: Any) {
        category = "sport"
        apicalling(country: country, category: category)
    }
    @IBAction func healthnewsbtn(_ sender: Any) {
        category = "health"
        apicalling(country: country, category: category)
    }
    @IBAction func politicnewsbtn(_ sender: Any) {
        category = "entertainment"
        apicalling(country: country, category: category)
    }
    
    func urlToImage(url: String) -> UIImage? {
        guard let data = try? Data(contentsOf: (URL(string: url)!) as URL) else { return nil }
        return UIImage(data: data, scale: -1)
    }
    
    // *** Table View :---
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array?.articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableviewLayout.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsTableViewCell
        
        cell.txtDiscription.text = array?.articles![indexPath.row].title
        cell.tableViewCellImg.image = urlToImage(url: array?.articles?[indexPath.row].urlToImage ?? "nil") ?? UIImage(systemName: "photo.on.rectangle")
        cell.tableViewCellImg.layer.cornerRadius = 10
        cell.layer.cornerRadius = 10
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let neviget = storyboard?.instantiateViewController(identifier: "SearchDataViewController") as! SearchDataViewController
        
        neviget.titles = array?.articles![indexPath.row].title ?? " "
        neviget.publishedLable = array?.articles?[indexPath.row].author ?? ""
        neviget.newsImage = urlToImage(url: array?.articles?[indexPath.row].urlToImage ?? "nil")
        neviget.Description = array?.articles?[indexPath.row].description ?? "Description Is Loading"
        
        navigationController?.pushViewController(neviget, animated: true)
    }
    
    // *** Collection View :---
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array?.articles?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionCell.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! myCollectionViewCell
        
        cell.cellImgOutlet.image = urlToImage(url: array?.articles?[indexPath.row].urlToImage ?? "nill")
        cell.cellImgOutlet.layer.cornerRadius = 10
        cell.collectionLable.text = array?.articles![indexPath.row].title
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 360, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let a = storyboard?.instantiateViewController(identifier: "SearchDataViewController") as! SearchDataViewController
        navigationController?.pushViewController(a, animated: true)
        a.titles = array?.articles![indexPath.row].title ?? " "
        a.publishedLable = array?.articles?[indexPath.row].author ?? ""
        a.newsImage = urlToImage(url: array?.articles?[indexPath.row].urlToImage ?? "nil")
        a.Description = array?.articles?[indexPath.row].description ?? "Description Is Loading"
    }
    
    func navigate(){
        _ = storyboard?.instantiateViewController(identifier: "LoginPageViewController") as! LoginPageViewController
        navigationController?.popViewController(animated: true)
    }
    
    func navigate1(){
        let a =  storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        navigationController?.pushViewController(a, animated: true)
    }
}

