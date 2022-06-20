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
    @Published var didAuthenticateUser = false
    init(){
        self.userSession = Auth.auth().currentUser
        print("DEBUG : User session : \(self.userSession?.uid)")
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
            
            print("DEBUG : Registered Successfully")
            print("DEBUG : User is \(self.userSession)")
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
}
