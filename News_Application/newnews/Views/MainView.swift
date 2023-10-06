//
//  MainView.swift
//  newnews
//
//  Created by Artem Dumchev on 13/05/2023.
//
// Main View of the application

import SwiftUI

struct MainView: View {
    @StateObject private var observableFavArticle = ObservableFavArticle()

    var body: some View {
        TabView{
            ContentView()
                .tabItem{Label("News", systemImage: "list.dash")}
                .environmentObject(observableFavArticle)
            ProfileView()
                .tabItem{Label("profile", systemImage: "star")}
                .environmentObject(observableFavArticle)

        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
