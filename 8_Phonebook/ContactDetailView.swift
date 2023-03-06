//
//  ContactDetailView.swift
//  8_Phonebook
//
//  Created by Alun King on 24/02/2023.
//

import SwiftUI

struct ContactDetailView: View {
    @StateObject var contact:Contact
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @Environment(\.dismiss) private var dismiss
    
    func loadImage() {
        print("editing image")
        guard let inputImage = inputImage else { return }
        //update the image in the Contact structure
        contact.editImage = Image(uiImage: inputImage)
    }
    
    
    

    var body: some View {
        VStack{
            ZStack {
                        Rectangle()
                            .fill(.secondary)

                        Text("Tap to select a picture")
                            .foregroundColor(.white)
                            .font(.headline)
                contact.editImage?
                            .resizable()
                            .scaledToFit()
                    }
                    .onTapGesture {
                        showingImagePicker = true
                    }
            TextField("Name", text: $contact.editName)
            TextField("Number", text: $contact.editNumber)
        }.padding(2.0)
        .navigationBarItems(trailing:Button("Save"){
            contact.name = contact.editName
            contact.number = contact.editNumber
            contact.image = contact.editImage
            //clear cache and dispose view
            dismiss()
        })
        .onDisappear(perform:{
            //restore variables if dismissed - if we have saved this code is irrelevant
            contact.editName = contact.name
            contact.editNumber = contact.number
            contact.editImage = contact.image
        })
        .onChange(of: inputImage) { _ in loadImage() }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
    }
}

