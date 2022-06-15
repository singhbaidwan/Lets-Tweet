//
//  NewTweetView.swift
//  Eagle
//
//  Created by Dalveer singh on 14/06/22.
//

import SwiftUI

struct NewTweetView: View {
    @State var caption = "Hello"
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            HStack{
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemBlue))
                        .font(.title)
                    
                }
                Spacer()
                Button {
                    print("Tweet")
                } label: {
                    Text("Tweet")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical)
                        .background(Color(.systemBlue))
                        .foregroundColor(Color(.white))
                        .clipShape(Capsule())
                        .font(.title2)
                }
            }
            .padding()
            HStack(alignment:.top){
                Circle()
                    .frame(width:64,height: 64)
//                14434
                TextArea("This is placeholder", $caption)
            }
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
