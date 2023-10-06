//
//  FavouriteArticles.swift
//  newnews
//
//  Created by Artem Dumchev on 08/06/2023.
//
// Observable object data used to store and dynamically update view that use it in the application

import SwiftUI
import Combine

struct FavArticle: Identifiable{
    let id = UUID()
    var title: String
    var imageUrl: String
    var siteName: String
    var url: String
}

class ObservableFavArticle: ObservableObject {
    @Published var FavArticles: [FavArticle] = []
}









