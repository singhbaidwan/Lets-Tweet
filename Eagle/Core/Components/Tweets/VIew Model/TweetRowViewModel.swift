//
//  TweetRowViewModel.swift
//  Eagle
//
//  Created by Dalveer singh on 22/06/22.
//

import Foundation
class TweetRowViewModel:ObservableObject{
    private let service = TweetService()
    @Published var tweet:Tweet
    init(tweet:Tweet)
    {
        self.tweet = tweet
        checkIfUserLikedTweet()
    }
    func likeTweet(){
        service.likeTweet(tweet) {
            self.tweet.didLike = true
        }
    }
    func checkIfUserLikedTweet(){
        service.checkIfUserLikedTweet(tweet) { didLike in
            if didLike {
                self.tweet.didLike = true
            }
        }
    }
    func unlikeTweet(){
        service.unlikeTweet(tweet) {
            self.tweet.didLike = false
        }
    }
}
