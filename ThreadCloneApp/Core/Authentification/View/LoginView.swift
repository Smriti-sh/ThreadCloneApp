//
//  LoginView.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 27/01/25.
//

import SwiftUI

struct LoginView: View {
//    The @State keyword ensures that changes to email and password trigger an automatic UI update.
//    @State private var email = ""
//    @State private var password = ""
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack{
            
            
            VStack{
                
                Spacer()
                
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150,height: 150)
                    .padding()
                
                VStack{
                     
                    TextField("Enter you email", text: $viewModel.email)
                        .modifier(ThreadsTextFieldModifier())
                        .autocapitalization(.none)
                    
                    SecureField("Enter your password", text: $viewModel.password)
                        .modifier(ThreadsTextFieldModifier())
                }
                
                NavigationLink{
                    Text("Forget password")
                }label: {
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .padding(.trailing, 28)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                Button{
                    Task{try await viewModel.login()}
                } label: {
                    Text("Login")
                        .modifier(ThreadButtonFieldModifier())
                }
                
                Spacer()
                
                Divider()
                
                NavigationLink{
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                }label: {
                    HStack(spacing:4){
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                    .foregroundColor(.black)
                }
                .padding(.vertical,16)
                
            }
        }
    }
}

#Preview {
    LoginView()
}
 
