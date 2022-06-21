//
//  AuthViewModel.swift
//  Eagle
//
//  Created by Dalveer singh on 19/06/22.
//

import SwiftUI
import Firebase
import FirebaseAuth
class AuthViewModel:ObservableObject{
    @Published var userSession:FirebaseAuth.User?
    @Published var currentUser:User?
    @Published var didAuthenticateUser = false
    private var tempUserSession:FirebaseAuth.User?
    private let service = UserService()
    init(){
        self.userSession = Auth.auth().currentUser
        print("DEBUG : User session : \(self.userSession?.uid)")
        self.fetchUser()
    }
    func login(withEmail email:String,_ password:String)
    {
        print("DEBUG : Login with email : \(email)")
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error{
                print("DEBUG : Failed to sign in with error \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else {return }
            self.userSession = user
            self.fetchUser()
            print("DEBUG : did log user in")
            
        }
    }
    func register(withEmail email:String,password:String,userName:String,fullName : String)
    {
        print("DEBUG : Register with email : \(email)")
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error{
                print("DEBUG : Failed to register with error \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else {return }
            self.tempUserSession = user
            let data = ["email":email
                        ,"username":userName.lowercased(),
                        "fullname":fullName,
                        "uid":user.uid]
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    print("DEBUG : Did upload user data")
                    self.didAuthenticateUser = true
                }
        }
    }
    func signOut(){
        userSession = nil
        try? Auth.auth().signOut()
    }
    func uploadProfileImage(_ image:UIImage){
        guard let uid = tempUserSession?.uid else {return}
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users").document(uid).updateData(["profileImageUrl":profileImageUrl]) { _ in
                self.userSession = self.tempUserSession
                self.fetchUser()
            }
        }
    }
    func fetchUser(){
        guard let uid = self.userSession?.uid else {return }
        
        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
        }
    }
}
