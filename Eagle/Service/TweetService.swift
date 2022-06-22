//
//  TweetService.swift
//  Eagle
//
//  Created by Dalveer singh on 21/06/22.
//

import Firebase

struct TweetService{
    func uploadTweet(caption:String,completion:@escaping(Bool)->Void)
    {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let data = ["uid":uid,
                    "caption":caption,
                    "likes":0 ,
                    "timestamp":Timestamp(date: Date())] as [String:Any]
        Firestore.firestore().collection("tweets")
            .document().setData(data) { error in
                if let error = error{
                    print("DEBUG : Failed to Upload Tweet with error \(error.localizedDescription)")
                    completion(false)
                    return
                }
                completion(true)
            }
    }
    func fetchTweets(completion:@escaping([Tweet])->Void){
        Firestore.firestore().collection("tweets")
            .order(by: "timestamp", descending: true)
            .getDocuments { snapshot, _ in
                print("DEBUG : uploaded Tweet")
                guard let documents = snapshot?.documents else{return}
                let tweets = documents.compactMap({try? $0.data(as: Tweet.self)})
                completion(tweets)
            }
    }
    func fetchUserTweets(foruid uid:String,completion:@escaping([Tweet])->Void)
    {
        Firestore.firestore().collection("tweets")
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                print("DEBUG : uploaded Tweet")
                guard let documents = snapshot?.documents else{return}
                var tweets = documents.compactMap({try? $0.data(as: Tweet.self)})
                completion(tweets.sorted(by: {$0.timestamp.dateValue() > $1.timestamp.dateValue()}))
            }
    }
}
