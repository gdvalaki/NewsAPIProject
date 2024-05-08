//
//  NewsAPIServices.swift
//  NewsAPIProject
//
//  Created by R91 on 08/04/24.
//

import Foundation

class newAPIData{
    
    func getData(country: String,_ loaded : @escaping (_ news : News) -> Void)
        {
            let link = "https://newsapi.org/v2/everything?q=\(country)&from=2024-03-16&sortBy=publishedAt&apiKey=d49c25f995f2431c883b7fa65bd10084"
            var links = URLRequest(url: URL(string: link)!)
            links.httpMethod = "GET"
    
    
            URLSession.shared.dataTask(with: links) {data, response, error in
                do{
                    if(data != nil)
                    {
                        let news = try JSONDecoder().decode(News.self, from: data!)
                        loaded(news)
                        print(news)
                        print("===+++++===")
                        
                    }
                }catch{
                    print("@@@@@@@@@@@@@@")
                    print(error.localizedDescription)
                }
            }.resume()
        }
    
    // **** CATAGORY API FOR COUNTRY :-
    
    func getNewsData(country: String,category: String,_ loaded : @escaping (_ news : News) -> Void)
        {
            let linked = "https://newsapi.org/v2/top-headlines?country=\(country)&category=\(category)&apiKey=d49c25f995f2431c883b7fa65bd10084"
            var url = URLRequest(url: URL(string: linked)!)
            url.httpMethod = "GET"
    
    
            URLSession.shared.dataTask(with: url) {data, response, error in
                do{
                    if(data != nil)
                    {
                        let news = try JSONDecoder().decode(News.self, from: data!)
                        loaded(news)
                        print(news)
                        print("==============")
                        
                    }
                }catch{
                    print("@@@@@@@@@@@@@@")
                    print(error.localizedDescription)
                }
            }.resume()
        }
    
    
    
}
