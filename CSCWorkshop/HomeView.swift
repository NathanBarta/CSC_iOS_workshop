//
//  HomeView.swift
//  CSCWorkshop
//
//  Created by Nathan Barta on 1/22/24.
//

import SwiftUI

struct Story {
  let username: String
  let profileImage: Color
}

struct Post: Identifiable {
  var id: UUID = UUID()
  let username: String
  let profileImage: Color
  let image: Color
  let caption: String
}

struct HomeView: View {
  
  private let mockStories: [Story] = [
    Story(username: "tom", profileImage: .cyan),
    Story(username: "shreyash", profileImage: .red),
    Story(username: "tianyi", profileImage: .green),
    Story(username: "robbie", profileImage: .yellow),
  ]
  
  private let mockPosts: [Post] = [
    Post(username: "tom", profileImage: .cyan, image: .pink, caption: "Hi"),
    Post(username: "tom", profileImage: .cyan, image: .green, caption: "Hello!"),
    Post(username: "robbie", profileImage: .yellow, image: .gray, caption: "Hello csc")
  ]
  
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      stories
      posts
    }
  }
  
  var stories: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      LazyHStack {
        ForEach(mockStories, id: \.username) { story in
          Circle()
            .fill(story.profileImage)
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .padding(.trailing, 10)
        }
      }
    }
  }
  
  var posts: some View {
    LazyVStack {
      ForEach(mockPosts) { post in
        VStack {
          
          HStack {
            Circle()
              .fill(post.profileImage)
              .frame(width: 44, height: 44, alignment: .center)
              .padding(.leading)
            
            Text(post.username)
            
            Spacer()
          }
          
          Rectangle()
            .fill(post.image)
            .frame(width: .infinity, height: 350, alignment: .center)
          
          HStack {
            Image(systemName: "heart")
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
