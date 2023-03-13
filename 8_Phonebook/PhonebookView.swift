//
//  ContentView.swift
//  8_Phonebook
//
//  Created by Alun King on 24/02/2023.
//

import SwiftUI

struct PhonebookView: View {
    @State var showView = false
    @State var searchText = ""
    @ObservedObject var data:Contacts
    @Environment(\.scenePhase) private var scenePhase
    let saveAction: ()->Void
    var body: some View {
        NavigationView{
            List (data.contacts.filter({"\($0.name)".contains(searchText) || searchText.isEmpty
            })){ contact in
                NavigationLink{
                    ContactDetailView(contact:contact)
                } label:{ContactRowView(contact:contact)
                }
            }
            .navigationTitle("Contacts")
            
            .toolbar{
                ToolbarItemGroup(placement: .primaryAction){
                    HStack{
                        Button{
                            showView.toggle()
                        } label:{
                            Image(systemName: "plus")
                        }.sheet(isPresented:$showView){
                        ContactAddView(contactList:data)
                    }
                    Menu{
                        Picker(selection: $data.sortBy, label:
                                
                            Text("Sorting options")){
                                Text("name up").tag(0)
                                Text("name down").tag(1)
                            }
                            
                    
                    }
                label:{
                    Label("Sort", systemImage:"arrow.up.arrow.down")
                }
                    }
                }
                
            }
            
            
        }.searchable(text: $searchText)
    
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
    }
}

struct PhonebookView_Previews: PreviewProvider {
    static var previews: some View {
        PhonebookView(data:Contacts(), saveAction: {})
    }
}
