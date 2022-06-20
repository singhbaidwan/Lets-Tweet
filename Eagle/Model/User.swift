//
//  User.swift
//  Eagle
//
//  Created by Dalveer singh on 20/06/22.
//
import FirebaseFirestoreSwift
struct User:Identifiable,Decodable{
    @DocumentID var id:String?
    let username:String
    let fullname:String
    let profileImageUrl:String
    let email:String
}
