//
//  ProfileView.swift
//  Eagle
//
//  Created by Dalveer singh on 13/06/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(alignment:.leading){
            HeaderView
            actionButtons
          userInfoDetails
            
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

extension ProfileView{
    var HeaderView: some View{
        ZStack(alignment: .bottomLeading) {
            Color(.systemBlue)
                .ignoresSafeArea()
            VStack {
                
                Button {
                    
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 16, y: 12)
                }
                
                Circle()
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
                Text("Dalveer Singh")
                    .font(.title2).bold()
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            Text("@Dalveer")
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
}
