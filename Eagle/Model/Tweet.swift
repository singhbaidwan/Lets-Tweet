//
//  Tweet.swift
//  Eagle
//
//  Created by Dalveer singh on 21/06/22.
//

import FirebaseFirestoreSwift
import Firebase
struct Tweet:Identifiable,Decodable{
    @DocumentID var id:String?
    let caption:String
    let timestamp:Timestamp
    let uid:String
    var likes:Int
    var user:User?
}
