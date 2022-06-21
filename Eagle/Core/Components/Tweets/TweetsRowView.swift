//
//  TweetsRowView.swift
//  Eagle
//
//  Created by Dalveer singh on 13/06/22.
//

import SwiftUI
import Kingfisher
struct TweetsRowView: View {
    let tweet:Tweet
    var body: some View {
        VStack(alignment:.leading){
            if let user = tweet.user
            {
                HStack(alignment:.top,spacing: 12){
                    // User Image
                    NavigationLink(destination: ProfileView(user: user)) {
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 60, height: 60)
                    }
                    
                        
                    // User info &tweet
                    VStack(alignment:.leading,spacing: 4){
                        HStack{
                            
                            
                            Text(user.fullname)
                                .font(.subheadline).bold()
                            Text("@\(user.username )")
                                .foregroundColor(.gray)
                                .font(.caption)
                            Text("49 weeks")
                                .foregroundColor(.gray)
                                .font(.caption)
                            
                        }
                        // Tweet
                        Text(tweet.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                }
                
            }
            // action buttons
            HStack{
                Button {
                    // action
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                    
                }
                Spacer()
                Button {
                    // action
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                    
                }
                Spacer()
                Button {
                    // action
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                    
                }
                Spacer()
                Button {
                    // action
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                    
                }
                
            }
            .padding()
            .foregroundColor(.gray)
            Divider()
        }
    }
}
//
//struct TweetsRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetsRowView()
//    }
//}
