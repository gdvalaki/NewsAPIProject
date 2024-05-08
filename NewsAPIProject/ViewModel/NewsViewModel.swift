//
//  NewsModel.swift
//  NewsAPIProject
//
//  Created by R91 on 08/04/24.
//

import Foundation

class APIData : NSObject {
    
    var countryNewes : newAPIData = newAPIData()
    var news : News?
    
//    func getNews(country: String,_ load : @escaping (_ news : News) -> Void) {
//        countryNews.getData(country: country) { news in
//            load(news)
//        }
//    }
    func getNewes(country: String,category: String,_ loading : @escaping (_ newes: News) -> Void){
        countryNewes.getNewsData(country: country, category: category) { news in
            loading(news)
        }
    }
    
    func searchNewsCalling(topic: String, _ load: @escaping() -> Void){
        countryNewes.getData(country: topic) { news in
            self.news = news
            load()
        }
    }
}


