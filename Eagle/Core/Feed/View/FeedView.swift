//
//  FeedView.swift
//  Eagle
//
//  Created by Dalveer singh on 13/06/22.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(0 ... 20,id: \.self) { _ in
                    TweetsRowView()
                        .padding()
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
