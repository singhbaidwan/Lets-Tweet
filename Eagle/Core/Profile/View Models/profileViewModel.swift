//
//  profileViewModel.swift
//  Eagle
//
//  Created by Dalveer singh on 22/06/22.
//

import Foundation
class ProfileViewModel:ObservableObject{
    @Published var tweets = [Tweet]()
    private let service = TweetService()
    let user:User
    init(user:User){
        self.user = user
        self.fetchUserTweets()
    }
    func fetchUserTweets(){
        guard let uid = user.id else {return}
        service.fetchUserTweets(foruid: uid) { tweets in
            self.tweets = tweets
            for i in 0..<tweets.count {
                self.tweets[i].user = self.user
            }
        }
    }
}
