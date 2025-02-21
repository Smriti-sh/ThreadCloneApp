import SwiftUI

struct CurrentUserProfileView: View {
    @StateObject var viewModel = CurrentUserProfileViewModel()
    @State private var showEditProfile = false
    
    //for changing hard coded data to dynamic
    private var currentUser : User?{
        return viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: true){
                
                VStack (spacing: 20){
                    ProfileHeaderView(user: currentUser)
                    Button{
                        showEditProfile.toggle()
                    }label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .frame(width: 352, height: 32)
                            .background(.white)
                            .cornerRadius(8)
//                            .padding(.top,8)
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color(.systemGray4), lineWidth: 1)
                            }
                    }
                    
                    //user content and list view
                    if let user = currentUser{
                        UserContentListView(user: user)
                    }
                }
                
            }
            .sheet(isPresented: $showEditProfile, content:{
                if let user = currentUser {
                    EditProfileView(user: user)
                }
            })
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        AuthService.shared.signOut()
                    }label:{
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    CurrentUserProfileView()
}
