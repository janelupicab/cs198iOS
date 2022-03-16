//
//  ContentView.swift
//  Shopping List
//
//  Created by Tony Hong on 3/11/22.
//

import SwiftUI

class Items: Identifiable {
    let imageName: String
    let itemName: String
    let quantity: Int
   
    init (imageName: String, itemName: String, quantity: Int ){
        self.imageName = imageName
        self.itemName = itemName
        self.quantity = quantity
    }
}

struct ContentView: View {
    var produce = [
        Items(imageName: "banana", itemName: "Banana", quantity: 3),
        Items(imageName: "apple", itemName: "Apple", quantity: 4),
        Items(imageName: "kiwi", itemName: "Kiwis", quantity: 2)
    ]
    
    var dairy = [
        Items(imageName: "yogurt", itemName: "Yogurt", quantity: 6),
        Items(imageName: "milk", itemName: "Milk", quantity: 1),
    ]
    
    var snacks = [
        Items(imageName: "goldfish", itemName: "Goldfish", quantity: 1),
        Items(imageName: "cookies", itemName: "Cookies", quantity: 6),
        Items(imageName: "worms", itemName: "Gummy Worms", quantity: 2),
    
    ]
    var body: some View {
        NavigationView{
            List {
                Section(header:Text("PRODUCE")){
                    ForEach(produce) { i in
                        CustomCell(imageName: i.imageName, itemName: i.itemName, quantity: i.quantity)
                    }
                }
                Section(header:Text("DAIRY")){
                    ForEach(dairy) { i in
                        CustomCell(imageName: i.imageName, itemName: i.itemName, quantity: i.quantity)
                    }
                }
                Section(header:Text("SNACKS")){
                    ForEach(snacks) { i in
                        CustomCell(imageName: i.imageName, itemName: i.itemName, quantity: i.quantity)
                    }
                }
            }
           .navigationTitle("Shopping List")
        }
    }
}
