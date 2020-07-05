//
//  ContentView.swift
//  SwiftUIForms
//
//  Created by Lucas Spusta on 7/5/20.
//

import SwiftUI

struct ContentView: View {
    
    var iceCreamTypes = ["Vanilla", "Strawberry", "Chocolate"]

    @State var specialRequestEnabled = false;
    
    @State var addSprinkles = false;
    
    @State var name = "";
    
    @State private var showingAlert = false

    
    @State private var selectedStrength = 0
    
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    
                    Section{
                        Picker(selection: $selectedStrength, label: Text("Ice Cream Type")) {
                            ForEach(0 ..< iceCreamTypes.count) {
                                Text(self.iceCreamTypes[$0])
                            }
                        }
                        
                    }
                    
                    Section{
                        Toggle(isOn: $specialRequestEnabled, label: {
                            Text("Special Items")
                        })
                        
                        if specialRequestEnabled {
                            Toggle(isOn: $addSprinkles, label: {
                                Text("Add Sprinkles")
                            })
                        }
                        
                    }
                    
                    
                    Section{
                        TextField("Name", text: $name)
                    }
                 
                    
                    Section{
                        Button(action: {
                            self.showingAlert = true
                        }) {
                            Text("Order")
                          
                        }.alert(isPresented: $showingAlert) {
                            Alert(title: Text("Ice Cream Ordered"), message: Text("Your Ice Cream Has been Ordered"), dismissButton: .default(Text("OK")))
                        }
                    }
                   
                }
            }.navigationBarTitle("Ice Cream Order Form")
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
