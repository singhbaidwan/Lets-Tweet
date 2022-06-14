//
//  SideMenuOptionRowView.swift
//  Eagle
//
//  Created by Dalveer singh on 14/06/22.
//

import SwiftUI

struct SideMenuOptionRowView: View {
    let item : SideMenuViewModel
    var body: some View {
        HStack(spacing:25){
            Image(systemName: item.imageName)
                .font(.headline)
                .foregroundColor(.gray)
            Text(item.description)
                .font(.subheadline)
                .foregroundColor(.black)
            Spacer()
            
        }
        .frame(height:40)
        .padding(.horizontal)
    }
}

struct SideMenuOptionRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionRowView(item: .profile)
    }
}
