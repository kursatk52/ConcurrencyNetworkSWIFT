//
//  Created by Kursat Korkmaz on 13.02.2023.
//
//  Lists all users in a list
//

import SwiftUI

struct ListUsersView: View {
    
    @StateObject var VM = UserViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading){
                Text("User List").font(.title)
              
                ForEach(VM.users, id: \.id) { user in
                    
                    NavigationLink {
                        ListPostsView(user: user)
                    } label: {
                        UserRow(user: user,url: VM.getUserImageURL(userId: user.id))
                    }
                }
                
                Spacer()
            }
            .overlay {
                if VM.isLoading{
                    ProgressView()
                }
            }
        }
        .navigationTitle("Users")
        .navigationBarTitleDisplayMode(.large)
        .padding()
        .onAppear(){
            Task {
                try? await VM.fetchUsers()
            }
        }
        
    }
}

struct ListUsersView_Previews: PreviewProvider {
    static var previews: some View {
        ListUsersView()
    }
}


// ROW View
struct UserRow : View{
    var user : User
    var url : URL
    var body: some View{
        HStack{
            AsyncImage(url: url) { image in
                image.resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(12)
            } placeholder: {
                ProgressView()
            }

            
            VStack(alignment: .leading){
                Text(user.username)
                    .font(.body.bold())
                Text(user.name).font(.subheadline)
                
            }
            Spacer()
            Text(user.email).font(.callout)
            Spacer()
            Image(systemName: "chevron.forward")
        }
        .foregroundColor(.black)
        .padding(.horizontal,16)
        .padding(.vertical,8)
        .frame(maxWidth: .infinity)
        .background{
            Color(.systemGray5)
                .cornerRadius(16)
        }
    }
}
