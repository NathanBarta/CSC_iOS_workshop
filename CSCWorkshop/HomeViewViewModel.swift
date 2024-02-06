//
//  HomeViewViewModel.swift
//  CSCWorkshop
//
//  Created by Nathan Barta on 2/5/24.
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
  let image: Image
  let caption: String
  var liked: Bool = false
}

final class HomeViewViewModel: ObservableObject {
  
  public let mockStories: [Story] = [
    Story(username: "tom", profileImage: .cyan),
    Story(username: "shreyash", profileImage: .red),
    Story(username: "tianyi", profileImage: .green),
    Story(username: "robbie", profileImage: .yellow),
  ]
  
  public let mockPosts: [Post] = [
    Post(username: "tom", profileImage: .cyan, image: Image("test_photo_1"), caption: "Hi"),
    Post(username: "tom", profileImage: .cyan, image: Image("test_photo_1"), caption: "Hello!"),
    Post(username: "robbie", profileImage: .yellow, image: Image("test_photo_1"), caption: "Hello csc")
  ]
}
