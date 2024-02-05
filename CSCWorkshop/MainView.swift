//
//  MainView.swift
//  CSCWorkshop
//
//  Created by Nathan Barta on 1/22/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
      TabView {
        HomeView()
          .tabItem {
            Label("Home", systemImage: "house.fill")
          }
      }
      .accentColor(.black)
    }
}

#Preview {
    MainView()
}
