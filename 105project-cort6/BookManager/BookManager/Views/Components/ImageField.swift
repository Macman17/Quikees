//
//  ImageField.swift
//  BookManager
//
//  Created by Naqui Darby on 3/3/26.
//

import SwiftUI
import PhotosUI


struct ImageField: View {
    
    @Binding var data: Data?
    @State private var photosPickerItem: PhotosPickerItem?
    private var imagePreview: UIImage {
        if let data {
            UIImage(data: data)!
          } else{
              UIImage(resource: .lotrFellowship)
              }
    }
      
    
    var body: some View {
        PhotosPicker(
            selection: $photosPickerItem,
            matching: .images,
            photoLibrary: .shared()
        ){
        
            Image(uiImage: imagePreview)
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
        }.onChange(of: photosPickerItem) {
            Task {
                if let photosPickerItem,
                   let imageData = try? await photosPickerItem.loadTransferable(type: Data.self){
                    data = imageData
                }
            }
            
        }
    }
}

