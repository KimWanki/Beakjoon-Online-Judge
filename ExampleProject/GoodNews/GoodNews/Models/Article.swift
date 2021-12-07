//
//  Article.swift
//  GoodNews
//
//  Created by WANKI KIM on 2021/11/30.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
}
