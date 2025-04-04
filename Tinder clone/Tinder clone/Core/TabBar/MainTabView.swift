//
//  MainTabBar.swift
//  Tinder clone
//
//  Created by Pankaj Kumar Rana on 3/21/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            CardStackView()
                .tabItem{ Image(systemName: "flame")}
                .tag(0)
            Text("Search View")
                .tabItem{ Image(systemName: "magnifyingglass")}
                .tag(1)
            
            Text("Index View")
                .tabItem { Image(systemName: "bubble")}
                .tag(2)
            
            Text("Profile View")
                .tabItem { Image(systemName: "person")}
                .tag(3)
        }
        .tint(.primary)
    }
}

#Preview {
    MainTabView()
}
