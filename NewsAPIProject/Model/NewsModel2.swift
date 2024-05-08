//
//  NewsModel2.swift
//  NewsAPIProject
//
//  Created by R91 on 09/04/24.
//

import Foundation

// MARK: - NewsData
struct NewsData: Codable {
    let status: String?
    let totalResults: Int?
    let articles2: [Articles]?
}

// MARK: - Article
struct Articles: Codable {
    let sources: Sources?
    let author: String?
    let title: String?
    let description2: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

// MARK: - Source
struct Sources: Codable {
    let id: String?
    let name: String?
}
