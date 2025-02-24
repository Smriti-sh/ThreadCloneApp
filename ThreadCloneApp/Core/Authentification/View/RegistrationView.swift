//
//  RegistrationView.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 28/01/25.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewModel() 
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            
            Spacer()
            
            Image("hive2")
                .resizable()
                .scaledToFit()
                .frame(width: 220,height: 220)
            
            Text("Connect    with    Hive    Community!")
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(.black)
                .opacity(0.5)
                
            Spacer()
            
            VStack{
                
                TextField("Enter you Username", text: $viewModel.username)
                    .modifier(ThreadsTextFieldModifier())
                    .autocapitalization(.none) 
                
                TextField("Enter your Fullname", text: $viewModel.fullname)
                    .modifier(ThreadsTextFieldModifier())
                
                TextField("Enter you email", text: $viewModel.email)
                    .modifier(ThreadsTextFieldModifier())
                    .autocapitalization(.none)
                
                SecureField("Enter your password", text: $viewModel.password)
                    .modifier(ThreadsTextFieldModifier())
            }

            Button {
//                link
                Task { try await viewModel.createUser() }
            } label: {
                Text("Sign Up")
                    .foregroundColor(.yellow)
                    .modifier(ThreadButtonFieldModifier())
            }
            .padding(.vertical)
            
            Spacer()
            
            Divider()
            
            Button {
                dismiss()
            } label: {
                HStack(spacing:4){
                    Text("Already have an account?")
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .foregroundColor(.black)
            }
            .padding(.vertical,16)
            }

        }
    }

#Preview {
    RegistrationView()
}
