//
//  FavoritesView.swift
//  newnews
//
//  Created by Artem Dumchev on 13/05/2023.
//
// View to show the favorite articles

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var data : SpaceAPI
    @Environment(\.openURL) var openURL
    private var textWidth = 300.0
    
    @State var showSafari = false
    @EnvironmentObject var observableFavArticle: ObservableFavArticle
    
    var body: some View {
        var urlString = "https://www.google.com"
        
        List {
            ForEach(observableFavArticle.FavArticles) { news in
                NewsArticle(title: news.title, imageUrl: news.imageUrl, siteName: news.siteName, url: news.url)
                    .environmentObject(observableFavArticle)
                    //on tap open safari view
                    .onTapGesture {
                        urlString = news.url
                        showSafari = true
                    }
                    .sheet(isPresented: $showSafari) {
                        SafariView(url:URL(string: urlString)!)
                    }
            }
            .listRowSeparator(.hidden)

        }
        .listStyle(PlainListStyle())
        .refreshable {
        }
       
    }
    
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}


