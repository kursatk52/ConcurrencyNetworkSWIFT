//
//  PostViewModel.swift
//  ConcurrencyAndNetwork
//
//  Created by Kursat Korkmaz on 13.02.2023.
//

import Foundation

class PostViewModel : ObservableObject{
    @Published var posts : [Post] = []
    
    @MainActor
    func fetchPosts(id : User.ID) async throws{
        posts = []
        do{
            let allPosts : [Post] = try await APIService.shared.fetchJSON(url: EndPoints.Posts.rawValue)
            
            allPosts.forEach { post in
                if post.userId == id{
                    posts.append(post)
                }
            }

        }catch{
            posts = []
        }
    }
    
}
