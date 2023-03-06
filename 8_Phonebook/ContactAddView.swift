//
//  ContactAddView.swift
//  8_Phonebook
//
//  Created by Alun King on 24/02/2023.
//

import SwiftUI

struct ContactAddView: View {
    @ObservedObject var contactList:Contacts
    @State private var showingImagePicker = false
    @State var image:Image?
    @State private var inputImage: UIImage?
    @StateObject var newContact = Contact(name:"", number:"")
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack{
            
            HStack {
                Button(action: {
                    dismiss()
                }) {
                    Text("Cancel")
                        .padding(6.0)
                }
                Spacer()
                
                Button(action: {
                    //do some validation here
                    //
                    //Save the image to the contact
                    newContact.image = self.image
                    newContact.editName = newContact.name
                    newContact.editNumber = newContact.number
                    contactList.contacts.append(newContact)
                    dismiss()
                }) {
                    Text("Save")
                        .padding(6.0)
                }
                
                
            } //End HStack
            Spacer()
            ZStack {
                        Rectangle()
                            .fill(.secondary)

                        Text("Tap to select a picture")
                            .foregroundColor(.white)
                            .font(.headline)
                        image?
                            .resizable()
                            .scaledToFit()
                    }
                    .onTapGesture {
                        showingImagePicker = true
                    }
            TextField("Name: ", text: $newContact.name)
            TextField("Number: ", text: $newContact.number)
            Spacer()
        }.padding(2.0)
            .onChange(of: inputImage) { _ in loadImage() }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
    }
}

struct ContactAddView_Previews: PreviewProvider {
    static var previews: some View {
        ContactAddView(contactList: Contacts())
    }
}
