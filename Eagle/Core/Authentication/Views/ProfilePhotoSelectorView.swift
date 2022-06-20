//
//  ProfilePhotoSelectorView.swift
//  Eagle
//
//  Created by Dalveer singh on 20/06/22.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker = false
    @State private var selectedImage:UIImage?
    @State private var profileImage : Image?
    var body: some View {
        VStack{
            //            Header
            VStack(alignment:.leading)
            {
                HStack(){Spacer()}
                Text("Create Account")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text("Add a Profile Photo")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
            }
            .frame(height: 260)
            .padding(.leading)
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(RoundedShape(corners: [.bottomRight]))
            Button {
                showImagePicker.toggle()
            } label: {
                if let profileImage = profileImage{
                    profileImage
                        .resizable()
                        .modifier(ProfileImageModifier())
                        .clipShape(Circle() )
                }
                else{
                    Image(systemName: "person.crop.circle.fill.badge.plus")
                        .resizable()
                        .renderingMode(.template)
                        .modifier(ProfileImageModifier())
                    
                }
            }.sheet(isPresented: $showImagePicker,onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }
            .padding(.top,44)
            if profileImage != nil {
                Button {
                    
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 350, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                }
                .padding(.top,45)
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                
            }
            Spacer()
            
        }
        .ignoresSafeArea()
    }
    func loadImage(){
        guard let selectedImage = selectedImage else {return}
        profileImage = Image(uiImage: selectedImage)

    }
}
private struct ProfileImageModifier:ViewModifier{
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(.systemBlue))
            .scaledToFit()
            .frame(width: 180, height: 180)
            
        
    }
}
struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
