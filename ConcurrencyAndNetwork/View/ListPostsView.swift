//
//  ListPostsView.swift
//  ConcurrencyAndNetwork
//
//  Created by Kursat Korkmaz on 13.02.2023.
//

import SwiftUI

struct ListPostsView: View {
    
    @StateObject var VM = PostViewModel()
    var user : User
    
    
    var body: some View {
        NavigationStack {
            ScrollView{
                ForEach(VM.posts, id: \.id) { post in
                    PostRow(post: post, user: user)
                }
            }
        }
        .navigationTitle("Posts")
        .navigationBarTitleDisplayMode(.large)
        .onAppear{
            Task{
                try? await VM.fetchPosts(id:self.user.id)
            }
        }
    }
}

struct ListPostsView_Previews: PreviewProvider {
    static var previews: some View {
        ListUsersView()
    }
}



struct PostRow: View{
    var post : Post
    var user : User
    
    var body: some View{
        VStack(alignment: .leading, spacing: 20){
            Text(post.title)
                .font(.headline)
            Text(post.body)
            Text("Author: \(user.name)")
                .font(.subheadline)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background{
            Color(.systemMint)
                .cornerRadius(16)
        }
        
    }
    
}
