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
    let image: UIImage
    @State private var photosPickerItem: PhotosPickerItem?
    private var imagePreview: UIImage {
        if let data {
              return UIImage(data: data)!
          } else{
              return UIImage(resource: .lotrFellowship)
              }
    }
      
    
    var body: some View {
        PhotosPicker(
            selection: $photosPickerItem,
            matching: .images,
            photoLibrary: .shared()
        ){
        
            Image(uiImage: image)
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

