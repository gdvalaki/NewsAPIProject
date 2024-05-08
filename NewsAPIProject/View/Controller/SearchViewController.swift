//
//  SearchViewController.swift
//  NewsAPIProject
//
//  Created by R91 on 09/04/24.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var searchbarOutlet: UISearchBar!
    @IBOutlet weak var searchTableview: UITableView!
    @IBOutlet weak var titleLable: UILabel!
    
    var searchAPI: APIData = APIData()
    var searchArray : News?
    var searchTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchAPI.searchNewsCalling(topic: "tesla") {
            DispatchQueue.main.async { [self] in
                self.searchArray = searchAPI.news
                searchTableview.reloadData()
            }
        }

    }
    
    @IBAction func homeBtn(_ sender: Any) {
        navigatetoHome()
    }
    
    @IBAction func searchPageNavigate(_ sender: Any) {
        navigateToSearch()
    }
    
    @IBAction func searchBtn(_ sender: Any) {
        searchTitle = searchbarOutlet.text ?? "nil"
        titleLable.text = searchTitle
        
        searchAPI.searchNewsCalling(topic: searchTitle) {
            DispatchQueue.main.async { [self] in
                self.searchArray = searchAPI.news
                searchTableview.reloadData()
            }
        }
    }
    
    func urlToImage(url: String) -> UIImage? {
        guard let data = try? Data(contentsOf: URL(string: url)! as URL) else { return nil }
        return UIImage(data: data, scale: -1)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(searchArray?.articles?.count)
        return (searchArray?.articles?.count ?? 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTableview.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! SearchTableViewCell
        cell.searchDic.text = searchArray?.articles![indexPath.row].title ?? "nil"
        cell.searchImage.image = urlToImage(url: searchArray?.articles![indexPath.row].urlToImage ?? "nil") ?? UIImage(systemName: "photo.on.rectangle")
        cell.searchImage.layer.cornerRadius = 15
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let neviget = storyboard?.instantiateViewController(identifier: "SearchDataViewController") as! SearchDataViewController
        neviget.titles = "Headlines : \(searchArray?.articles?[indexPath.row].title ?? "")"
        neviget.publishedLable = "Authour By : \(searchArray?.articles?[indexPath.row].author ?? "")"
        neviget.newsImage = urlToImage(url: searchArray?.articles?[indexPath.row].urlToImage ?? "photo.on.rectangle") ?? UIImage(systemName: "photo.on.rectangle")
        neviget.Description = "Description : \(searchArray?.articles?[indexPath.row].description ?? "Description Is Loading...")"
        navigationController?.pushViewController(neviget, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    
    }
    
    func navigateToSearch(){
        let a = storyboard?.instantiateViewController(identifier: "SearchDataViewController") as! SearchDataViewController
        navigationController?.pushViewController(a, animated: true)
    }
    
    func navigatetoHome(){
        let b = storyboard?.instantiateViewController(identifier: "firstPage") as! firstPage
        navigationController?.popViewController(animated: true)
    }
}
