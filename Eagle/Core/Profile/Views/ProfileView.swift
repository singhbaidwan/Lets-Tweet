//
//  ProfileView.swift
//  Eagle
//
//  Created by Dalveer singh on 13/06/22.
//

import SwiftUI
import Kingfisher
struct ProfileView: View {
    @State private var selectedFilter:TweetFilterVIewModel = .tweets
    @Environment(\.presentationMode) var mode
    @Namespace var animation
    private let user:User
    init(user:User)
    {
        self.user = user
    }
    var body: some View {
        VStack(alignment:.leading){
            HeaderView
            actionButtons
            userInfoDetails
           tweetFilterBar
            tweetsView
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(id: NSUUID().uuidString, username: "hell", fullname: "fff", profileImageUrl: "https://google.com", email: "nowat@123.com"))
    }
}

extension ProfileView{
    var HeaderView: some View{
        ZStack(alignment: .bottomLeading) {
            Color(.systemBlue)
                .ignoresSafeArea()
            VStack {
                
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 16, y: -4)
                }
                
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle() )
                    .frame(width: 72, height: 72)
                    .offset(x: 16, y: 25)
            }
        }
        .frame(height:100)
    }
    var actionButtons:some View{
        HStack(spacing:12){
            Spacer()
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray,lineWidth: 0.75))
            Button {
                
            } label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .bold()
                    .frame(width: 120, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray,lineWidth: 0.75))
                
            }
            
        }.padding(.trailing)
    }
    var userInfoDetails:some View{
        VStack(alignment:.leading,spacing: 4){
            HStack{
                Text(user.fullname)
                    .font(.title2).bold()
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            Text("@\(user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text("This is Dalveer singh Bio")
                .font(.subheadline)
                .padding(.vertical)
            HStack(spacing:24){
                HStack{
                    Image(systemName: "mappin.and.ellipse")
                    Text("Chandigarh , India")
                    
                }
                HStack{
                    Image(systemName: "link")
                    Text("www.linkedin.com")
                }
            }
            .foregroundColor(.gray)
            .font(.caption)
            HStack(spacing:24){
                HStack(spacing:4){
                    Text("900")
                        .font(.subheadline)
                        .bold()
                    Text("Following")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                HStack(spacing:4){
                    Text("900")
                        .font(.subheadline)
                        .bold()
                    Text("Followers")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .padding(.vertical)
        }
        .padding(.horizontal)
    }
    var tweetFilterBar:some View{
        HStack{
            ForEach(TweetFilterVIewModel.allCases,id:\.rawValue) { item in
                VStack{
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        .foregroundColor(selectedFilter == item ? .black : .gray)
                    if selectedFilter == item{
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height:3)
                            .matchedGeometryEffect(id: "filters", in: animation)
                    }
                    else{
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height:3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut){
                        self.selectedFilter = item
                    }
                }
            }
        }.overlay(Divider().offset(x:0 , y:16))
    }
    var tweetsView: some View{
        ScrollView{
            LazyVStack{
                ForEach(0 ... 9, id: \.self) { _ in
                    TweetsRowView()
                        .padding()
                }
            }
        }
    }
}
