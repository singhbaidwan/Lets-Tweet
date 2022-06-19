//
//  RegistrationView.swift
//  Eagle
//
//  Created by Dalveer singh on 15/06/22.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    @State private var fullname = ""
    @EnvironmentObject var viewModel:AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            VStack(alignment:.leading)
            {
                HStack(){Spacer()}
                Text("Get Started")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text("Create your account")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
            }
            .frame(height: 260)
            .padding(.leading)
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(RoundedShape(corners: [.bottomRight]))
            VStack(spacing:40)
            {
                CustomInputField(imageName: "envelope", placeHolderText: "Email", text: $email)
                CustomInputField(imageName: "person", placeHolderText: "Username", text: $username)
                CustomInputField(imageName: "person", placeHolderText: "Full Name", text: $fullname)
                CustomInputField(imageName: "lock", placeHolderText: "Password",isSecureField: true, text: $password)
            }
            .padding(.horizontal,32)
            .padding(.top,44)
            
            Button {
                viewModel.register(withEmail: email, password: password, userName: username, fullName: fullname)
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 350, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            Spacer()
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack{
                    Text("Already have an account")
                        .font(.footnote)
                    Text("Sign In")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                }
            }
            .padding(.bottom,32)
            .foregroundColor(Color(.systemBlue))

        }
        .ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
