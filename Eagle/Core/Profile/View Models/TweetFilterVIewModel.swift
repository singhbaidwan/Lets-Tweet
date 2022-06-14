//
//  TweetFilterVIewModel.swift
//  Eagle
//
//  Created by Dalveer singh on 14/06/22.
//

import Foundation
enum TweetFilterVIewModel: Int , CaseIterable{
    case tweets
    case replies
    case likes
    var title:String{
        switch self
        {
        case .tweets : return "Tweets"
        case .replies : return "Replies"
        case .likes: return "Likes"
        }
    }
}
