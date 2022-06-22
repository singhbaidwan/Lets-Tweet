//
//  profileViewModel.swift
//  Eagle
//
//  Created by Dalveer singh on 22/06/22.
//

import Foundation
class ProfileViewModel:ObservableObject{
    @Published var tweets = [Tweet]()
    @Published var likedTweets = [Tweet]()
    private let service = TweetService()
    private let userService = UserService()
    let user:User
    init(user:User){
        self.user = user
        self.fetchUserTweets()
        self.fetchLikedTweets()
    }
    var actionButtonTitle:String{
        return user.isCurrentUser ? "Edit Profile" : "Follow"
    }
    func tweets(forfilter filter:TweetFilterVIewModel)->[Tweet]{
        switch filter {
        case .tweets:
            return tweets
        case .replies:
            return tweets
        case .likes:
            return likedTweets
        }
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
    func fetchLikedTweets()
    {
        guard let uid = user.id else {return}
        service.fetchLikedTweets(foruid: uid) { tweet in
            self.likedTweets = tweet
            for i in 0..<tweet.count{
                let uid = tweet[i].uid
                self.userService.fetchUser(withUid: uid) { user in
                    self.likedTweets[i] .user = user
                }
            }
        }
    }
}
