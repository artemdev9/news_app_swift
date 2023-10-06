//
//  ProfileView.swift
//  newnews
//
//  Created by Artem Dumchev on 13/05/2023.
//
//
// View that shows the profile view

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var observableFavArticle: ObservableFavArticle

    var body: some View {
        VStack{
            Text("profile")
            NavigationStack{
                List{
                    NavigationLink {
                        FavoritesView() // enviroment object
                            .environmentObject(observableFavArticle)
                    } label: {
                        Text("favourites")
                    }
                    
                    NavigationLink {
                        //LanguageView()
                    } label: {
                        Text("language")
                    }
                    
                    HStack{
                        Text("doomscrolling mode")
                        Spacer()
                        Text("+")
                    }
                    
                    
                }
                
                Text("personalisation")
                
                List{
                    HStack{
                        Text("technology")
                        Spacer()
                        Text("+")
                    }
                    HStack{
                        Text("business")
                        Spacer()
                        Text("+")
                    }
                    HStack{
                        Text("music")
                        Spacer()
                        Text("+")
                    }
                    HStack{
                        Text("science")
                        Spacer()
                        Text("+")
                    }
                    HStack{
                        Text("fashion")
                        Spacer()
                        Text("+")
                    }
                    HStack{
                        Text("health")
                        Spacer()
                        Text("+")
                    }
                }
                
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
