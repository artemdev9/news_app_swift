//
//  ContentView.swift
//  newnews
//
//  Created by Artem Dumchev on 05/05/2023.
//
// 

import SwiftUI

struct ContentView: View {
    @StateObject var data = SpaceAPI()
    @State private var opac = 0.0
    @EnvironmentObject var observableFavArticle: ObservableFavArticle

    var body: some View {
        NavigationView{
            VStack {
                NewsView()
                    .opacity(opac)
                    .environmentObject(observableFavArticle)
            }
            .navigationTitle("News")
            .environmentObject(data)
            .onAppear(){
                data.getData()
                withAnimation(.easeIn(duration: 2)) {
                    opac = 1.0
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
