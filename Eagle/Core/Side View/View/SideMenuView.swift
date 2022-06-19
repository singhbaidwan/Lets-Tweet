//
//  SideMenuView.swift
//  Eagle
//
//  Created by Dalveer singh on 14/06/22.
//

import SwiftUI

struct SideMenuView: View {
    @EnvironmentObject var authViewModel : AuthViewModel
    var body: some View {
        VStack (alignment : .leading,spacing:32){
            VStack(alignment : .leading){
                Circle()
                    .frame(width:48,height: 48)
                VStack(alignment : .leading, spacing: 4){
                    
                    Text("Dalveer Singh")
                        .font(.subheadline).bold()
                    Text("@dalveer")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                UserStatView()
            }
            .padding(.leading)
            ForEach(SideMenuViewModel.allCases, id :\.rawValue) { item in
                if item == .profile
                {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        SideMenuOptionRowView(item: item)
                    }
                }
                else if item == .logout{
                    Button {
                        print("Logout the user")
                        authViewModel.signOut()
                    } label: {
                        SideMenuOptionRowView(item: item)
                    }

                }
                else {
                    SideMenuOptionRowView(item: item)
                }
                
            }
            Spacer()
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
