//
//  HomeView.swift
//  CSCWorkshop
//
//  Created by Nathan Barta on 1/22/24.
//

import SwiftUI

struct HomeView: View {
  
  @StateObject var viewModel = HomeViewViewModel()
  @State var isPresentingStory: Bool = false

  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      stories
      posts
    }
  }
  
  var stories: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      LazyHStack {
        ForEach(viewModel.mockStories, id: \.username) { story in
          Button {
            isPresentingStory.toggle()
          } label: {
            VStack {
              Circle()
                .fill(story.profileImage)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
              
              Text(story.username)
            }
            .padding(.trailing, 10)
          }
          .fullScreenCover(isPresented: $isPresentingStory) {
            Text("Story")
          }
        }
      }
    }
  }
  
  var posts: some View {
    LazyVStack {
      ForEach(viewModel.mockPosts) { post in
        VStack {
          
          HStack {
            Circle()
              .fill(post.profileImage)
              .frame(width: 44, height: 44, alignment: .center)
              .padding(.leading)
            
            Text(post.username)
            
            Spacer()
          }
          
          post.image
            .resizable()
            .frame(width: .infinity, height: 350, alignment: .center)
          
          HStack {
            Image(systemName: "heart")
              .background(post.liked ? .red : .clear)
            
            Image(systemName: "message")
            Image(systemName: "paperplane")
          
            
            Spacer()
            
            Image(systemName: "bookmark")
          }
          
          HStack {
            Text("Liked by 600")
              .font(.system(size: 14, weight: .bold, design: .default))
            
            Spacer()
          }
          
          HStack {
            Text(post.username)
              .font(.system(size: 14, weight: .bold, design: .default)) + Text(" ") +
            Text(post.caption)
            
            Spacer()
          }
        }
      }
    }
  }
}

#Preview {
    HomeView()
}
