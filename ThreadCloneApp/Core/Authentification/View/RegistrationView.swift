//
//  RegistrationView.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 28/01/25.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var fullname = ""
    @State private var username = ""
    @State private var password = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            
            Spacer()
            
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 150,height: 150)
                .padding()
            
            VStack{
                
                TextField("Enter you email", text: $email)
                    .modifier(ThreadsTextFieldModifier())
                    .autocapitalization(.none)

                TextField("Enter your Fullname", text: $fullname)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal,24)

                TextField("Enter you Username", text: $username)
                    .modifier(ThreadsTextFieldModifier())

                
                SecureField("Enter your password", text: $password)
                    .modifier(ThreadsTextFieldModifier())
            }

            Button {
//                link
            } label: {
                Text("Sign Up")
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
