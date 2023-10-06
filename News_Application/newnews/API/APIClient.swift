//
//  APIClient.swift
//  newnews
//
//  Created by Artem Dumchev on 05/05/2023.
//
// https://api.spaceflightnewsapi.net/v3/articles
// Fetches the data from the API

import Foundation

struct SpaceData : Codable, Identifiable {
    var id: Int
    var title: String
    var url: String
    var imageUrl: String
    var newsSite: String
    var publishedAt: String
}

@MainActor class SpaceAPI : ObservableObject {
    @Published var news: [SpaceData] = []
    
    func getData(){
        guard let url = URL(string: "https://api.spaceflightnewsapi.net/v3/articles") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else{
                let tempError = error!.localizedDescription
                DispatchQueue.main.async {
                    self.news = [SpaceData(id: 0,title: tempError, url: "Error", imageUrl: "Error", newsSite: "Error", publishedAt: "Error")]
                }
                return
            }
            
            let spaceData = try! JSONDecoder().decode([SpaceData].self, from: data)
            
            DispatchQueue.main.async {
                print("Loaded new data successfully. Articles: \(spaceData.count)")
                self.news = spaceData
            }
        }.resume()
    }
}
