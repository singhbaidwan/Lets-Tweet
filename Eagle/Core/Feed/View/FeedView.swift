//
//  FeedView.swift
//  Eagle
//
//  Created by Dalveer singh on 13/06/22.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetView = false
    var body: some View {
        ZStack(alignment : .bottomTrailing) {
            ScrollView{
                LazyVStack{
                    ForEach(0 ... 20,id: \.self) { _ in
                        TweetsRowView()
                            .padding()
                    }
                }
            }
            Button {
                showNewTweetView.toggle()
            } label: {
                Image(systemName: "plus")
                    .font(.system(size: 40))
                    .frame(width: 40, height: 40)
                    .padding()
             }
            .foregroundColor(.white)
            .background(Color(.systemBlue))
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showNewTweetView) {
                Text("Add new Tweet ")
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
