//
//  NewsView.swift
//  newnews
//
//  Created by Artem Dumchev on 05/05/2023.
//
// View that shows the articles

import SwiftUI

struct NewsView: View {
    @EnvironmentObject var data : SpaceAPI
    @Environment(\.openURL) var openURL
    
    @State var showSafari = false
    @State var newsUrlString = "https://www.google.com"
    @EnvironmentObject var observableFavArticle: ObservableFavArticle

    var body: some View {
        List {
            ForEach(data.news) { news in
                NewsArticle(title: news.title, imageUrl: news.imageUrl, siteName: news.newsSite, url: news.url)
                    .environmentObject(observableFavArticle)
                    //on tap open safari view
                    .onTapGesture {
                        newsUrlString = news.url
                        showSafari = true
                    }
                    .sheet(isPresented: $showSafari) {
                        SafariView(url:URL(string: newsUrlString)!)
                    }
            }
            .listRowSeparator(.hidden)
            
        }
        .listStyle(PlainListStyle())
        .refreshable {
            data.getData()
        }
        
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}



