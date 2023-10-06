//
//  NewsArticle.swift
//  newnews
//
//  Created by Artem Dumchev on 05/05/2023.
//
// View that build the article

import SwiftUI
import CachedAsyncImage

struct NewsArticle: View {
    let title: String
    let imageUrl: String
    let siteName: String
    let url: String
    @EnvironmentObject var observableFavArticle: ObservableFavArticle

    var body: some View{
        var articleAdded = false
 
        VStack(){
            
            HStack(alignment: .center) {
                
                CachedAsyncImage(url: URL(string: imageUrl),
                                 transaction: Transaction(animation: .easeInOut)) { phase in
                    if let image = phase.image{
                        image
                            .resizable()
                            .scaledToFit()
                            
                    } else {
                        HStack { // to display a placeholder if there is no image
                            //ProgressView()
                        }
                    }
                }
            }
            
            Text(title)
                .font(.headline)
                .padding(12)
            
            
            HStack{
                Text(siteName)
                
                Spacer()
                
                Button {
                    
                    let newItem = FavArticle(title: title,imageUrl: imageUrl ,siteName: siteName,url: url)
                    var index = 0
                    
                    for favarticle in observableFavArticle.FavArticles{
                        if (favarticle.title == title){
                            print("article removed")
                            articleAdded = true
                            observableFavArticle.FavArticles.remove(at: index)
                        }
                        index=index+1
                    }
                    
                    if ((observableFavArticle.FavArticles.isEmpty) != true && (articleAdded == false)){
                        observableFavArticle.FavArticles.append(newItem)
                        print("article was added")
                    }
                    
                    if ((observableFavArticle.FavArticles.isEmpty) && (articleAdded==false)){
                        observableFavArticle.FavArticles.append(newItem)
                        print("favarticles was empty so article was added")
                    }
                    
                } label: {
                    
                    if (checkForArticle(title: title, in: observableFavArticle) == true){
                        Image(systemName: "bookmark.fill")
                    }
                    else{
                        Image(systemName: "bookmark")
                    }
                        
                }
                .buttonStyle(.bordered)
                
                Button{
                    // shows the ios share screen
                    presentShareSheet(url: URL(string: url)!)
                } label: {
                    Image(systemName: "square.and.arrow.up")
                }
                .buttonStyle(.bordered)
                
            }
            .padding(12)
            
        }
        .background(.gray)
        .cornerRadius(20)
        .environmentObject(observableFavArticle)

    }
}

func checkForArticle(title: String, in observableFavArticle: ObservableFavArticle) -> Bool {
    for favarticle in observableFavArticle.FavArticles{
        if (favarticle.title == title){
            print(title)
            return true
        }
    }
    return false
}

extension View{
    
    func presentShareSheet(url: URL) {
        let activityVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?
            .keyWindow?
            .rootViewController?
            .present(activityVC, animated: true)
    }
    
}

struct NewsArticle_Previews: PreviewProvider {
    @EnvironmentObject var observableFavArticle: ObservableFavArticle
    static var previews: some View {
        NewsArticle(title: "Title", imageUrl: "loading...", siteName: "Source", url: "http")
    }
}
