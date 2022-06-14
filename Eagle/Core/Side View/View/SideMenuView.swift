//
//  SideMenuView.swift
//  Eagle
//
//  Created by Dalveer singh on 14/06/22.
//

import SwiftUI

struct SideMenuView: View {
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
                HStack(spacing:25){
                    Image(systemName: item.imageName)
                        .font(.headline)
                        .foregroundColor(.gray)
                    Text(item.description)
                        .font(.subheadline)
                    Spacer()
                    
                }
                .frame(height:40)
                .padding(.horizontal)
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
