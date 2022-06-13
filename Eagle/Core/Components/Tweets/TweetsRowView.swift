//
//  TweetsRowView.swift
//  Eagle
//
//  Created by Dalveer singh on 13/06/22.
//

import SwiftUI

struct TweetsRowView: View {
    var body: some View {
        VStack(alignment:.leading){
            HStack(alignment:.top,spacing: 12){
                // User Image
                Circle().frame(width: 60, height: 60)
                    .foregroundColor(Color(.systemBlue))
                // User info &tweet
                VStack(alignment:.leading,spacing: 4){
                    HStack{
                        
                        Text("Name")
                            .font(.subheadline).bold()
                        Text("@avenger")
                            .foregroundColor(.gray)
                            .font(.caption)
                        Text("49 weeks")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    // Tweet
                    Text("I am a Avenger fan")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
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

struct TweetsRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetsRowView()
    }
}
