//
//  UserViewModel.swift
//  ConcurrencyAndNetwork
//
//  Created by Kursat Korkmaz on 13.02.2023.
//

import Foundation


class UserViewModel : ObservableObject{
    @Published var users : [User] = []
    @Published var avatars : [Avatar] = []
    @Published var isLoading : Bool = false
    
    
    @MainActor
    func fetchUsers() async throws{
        isLoading.toggle()
        defer{
            isLoading.toggle()
        }
        users = []
        avatars = []
        do{
            users = try await APIService.shared.fetchJSON(url: EndPoints.Users.rawValue)
            avatars = try await APIService.shared.fetchJSON(url: EndPoints.Photos.rawValue)
        }catch{
            users = []
            avatars = []
        }
    }
    
    func getUserImageURL(userId : User.ID) -> URL{
        var urlString : String = "https://www.w3schools.com/howto/img_avatar.png"
        avatars.forEach { av in
            if av.id == userId{
                urlString = av.url
            }
        }
        return URL(string: urlString)!
        
    }
}


extension UserViewModel{
    static let exampleUsers : [User] = [User(id: 0, name: "Kursat", username: "kursatk52", email: "kk123@hotmail.com")]
}
