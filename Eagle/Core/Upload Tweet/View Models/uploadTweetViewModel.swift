//
//  uploadTweetView.swift
//  Eagle
//
//  Created by Dalveer singh on 21/06/22.
//

import Foundation

class UploadTweetViewModel:ObservableObject{
    @Published var didUploadTweet = false
    let service = TweetService()
    func uploadTweet(with caption:String){
        service.uploadTweet(caption: caption) { sucess in
            if sucess {
                self.didUploadTweet = true
            }
            else{
                // error occured while uploading tweet
            }
        }
    }
}
