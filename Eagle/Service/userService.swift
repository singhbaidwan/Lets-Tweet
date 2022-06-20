//
//  userService.swift
//  Eagle
//
//  Created by Dalveer singh on 20/06/22.
//

import Firebase
import FirebaseFirestoreSwift
struct UserService{
    func fetchUser(withUid Uid:String,completion: @escaping(User)->Void)
    {
        Firestore.firestore().collection("users")
            .document(Uid).getDocument { snapshot, _ in
                guard let snapshot = snapshot else {return}
                
                guard let user = try? snapshot.data(as:User.self) else{return}
                completion(user)
            }
    }
}
