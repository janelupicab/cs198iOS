//
//  ContentView.swift
//  Bullseye with SwiftUI
//
//  Created by Tony Hong on 2/17/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var myValue = 50.0
    @State var toggle = false

    var body: some View {
        VStack(){
            HStack(){
                VStack(){
                    Text("High Score:")
                        .padding(.bottom, 5)
                    Text("0")
                        .font(.system(size: 20))

                }
                .padding(.leading, 20)
                .padding(.top, 40)
                Spacer()
                VStack(){
                    Text("Current Level:")
                        .padding(.bottom, 5)
                    Text("1")
                        .font(.system(size: 20))

                }
                .padding(.trailing, 20)
                .padding(.top, 40)
            }
            Spacer()
            
            Text("move the slider to:")
                .padding(.bottom, 10)
                .font(.system(size: 30))
            Text("25")
                .font(.system(size: 30))
            Slider(
                value: $myValue,
                in: 0...100)
                .padding(40)
            Button("check"){
            }
            Spacer()
            Text("exact mode?")
            Toggle("", isOn: $toggle)
                .labelsHidden()
                .padding(.bottom, 40)
        }
    }
}
