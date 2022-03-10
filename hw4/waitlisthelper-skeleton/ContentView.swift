//
//  ContentView.swift
//  waitlisthelper-skeleton
//
//  Created by Jordan Yee on 1/19/22.
//

import SwiftUI

struct ContentView: View {
    @State private var waitlistPlace: Double = 0
    @State private var classSize: Double = 0
    @State private var calculate = false
    @State var probability = 0
    @State var text = ""
    init(){
            UITableView.appearance().backgroundColor = .clear
            UITabBar.appearance().backgroundColor = UIColor.white

        }
    
    
    var body: some View {
       
            //YOUR CODE HERE (NavView)//
        NavigationView {
                //YOUR CODE HERE (TabView)//
            TabView {
        
                    ZStack {
                        //YOUR CODE HERE (background)//
                        Image("calculate_background")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .ignoresSafeArea()


                        VStack {
                            Spacer()
                            //YOUR CODE HERE (title)//
                            Text("WILL YOU GET OFF THE WAITLIST?")
                                .font(.custom("Avenir", size: 45))
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                .padding()
                            

                            Spacer()
                            HStack {
                                //YOUR CODE HERE (description)//
                                Text("place on waitlist: \(waitlistPlace, specifier: "%.f")")
                                    .font(.custom("Avenir", size: 18))
                                    .foregroundColor(.blue)

                                Spacer()
                            }
                            //YOUR CODE HERE (slider)//
                            Slider(
                                value: $waitlistPlace,
                                in: 0...200)
                            
                            HStack {
                                //YOUR CODE HERE (description)//
                                Text("class size: \(classSize, specifier: "%.f")")
                                    .font(.custom("Avenir", size: 18))
                                    .foregroundColor(.blue)

                                Spacer()
                            }
                            //YOUR CODE HERE (slider)//
                            Slider(
                                value: $classSize,
                                in: 0...1000,
                                step: 1)
                                .tint(.teal)

                            
                            NavigationLink(destination: ResultView(prob: $probability, feedback: $text), isActive: $calculate) { EmptyView() } .padding()
                            Button("CALCULATE") {
                                //YOUR CODE HERE (calculate)//
                                calculateProbability(waitlistPlace: Int(waitlistPlace), classSize: Int(classSize))
                                text = getFeedbackText()
                                calculate = true
                            } .buttonStyle(CustomButton())
                            
                            Spacer()
                            
                        } .padding()
                    
                    }
                    .tabItem{
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
              
                //DIY VIEW HERE
                    ZStack {
                        Image("calculate_background")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .ignoresSafeArea()
                        VStack {
                            HStack {
                                Spacer()
                                Text("MY CLASSES")
                                    .font(.custom("Avenir-bold", size: 40))
                                    .font(.largeTitle)
                                    .foregroundColor(Color.teal)
                                    .padding(.top, 150)
                                Spacer()
                            } .padding()
                            
                                Form{
                                    Section(header: Text("Class 1").foregroundColor(Color.gray)) {
                                        Text("Information Law & Policy")
                                        .padding(5)
                                        .listRowBackground(Color.teal)
                                    }
                                    Section(header: Text("Class 2").foregroundColor(Color.gray)){
                                        Text("Social Issues of Information")
                                            .padding(5)
                                            .listRowBackground(Color.teal)
                                    }
                                    Section(header: Text("Class 3").foregroundColor(Color.gray)){
                                        Text("Queering Digital Cultures")
                                            .padding(5)
                                            .listRowBackground(Color.teal)
                                    }
                                    Section(header: Text("Class 4").foregroundColor(Color.gray)){
                                        Text("User Experience Research")
                                            .padding(5)
                                            .listRowBackground(Color.teal)

                                    }
                                    Section(header: Text("Class 5").foregroundColor(Color.gray)){

                                        Text("Cubstart iOS Development")
                                            .padding(5)
                                            .listRowBackground(Color.teal)
                                    }
                                    Spacer()
                                  

                                } .font(.custom("Avenir", size: 20))
                                    .foregroundColor(Color.white)
                            Spacer()
                            }
                    }.tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("Profile")
                    }
                    }
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    .statusBar(hidden: true)
                    
        
        } .accentColor(Color.teal)

     
        }
    func calculateProbability(waitlistPlace: Int, classSize: Int) {
        let tenth = classSize / 10
                if  (waitlistPlace <= tenth) {
                    probability = 100
                } else if (waitlistPlace > tenth * 2) {
                    probability = 0
                } else {
                    probability = 100 - Int(((Float(waitlistPlace - tenth) / Float(tenth))*100))
                }
        
        
    }
    
    func getFeedbackText() -> String {
        for tuple in feedbackModel {
            if probability >= tuple.0 {
                return tuple.1
            }
        }
        return "Error"
    }
    
}

struct ResultView: View {
    @Environment(\.presentationMode) var presentation: Binding<PresentationMode>
    @Binding var prob: Int
    @Binding var feedback: String
    
    
    var body: some View {

        ZStack {
            Color(red: 50/255, green: 141/255, blue: 168/255)
                .ignoresSafeArea()
            
            Image("result_background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            VStack {
                HStack {
                    //YOUR CODE HERE (button back)//
                    Button(action: {
                         self.presentation.wrappedValue.dismiss()
                       }) {
                       Image(systemName: "arrow.left")
                           .foregroundColor(.white)
                           .font(.system(size: 25))
                       }
                       .navigationBarHidden(true)
                       .statusBar(hidden: true)


                    Spacer()
                } .padding(.top, 50)
                    .padding(.leading, 20)

                Spacer()
                Text("PROBABILITY")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Text("\(prob)%")
                    .font(.system(size: 80, weight: .bold))
                    .foregroundColor(Color.white)
                Text("\(feedback)")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color.white)
                Spacer()
                Spacer()
            } .padding()
        }
        
    }
}


struct CustomButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            //YOUR CODE HERE (button style)//
            .padding(10)
            .background(.teal)
            .clipShape(Capsule())
            .foregroundColor(.white)
            .scaleEffect(configuration.isPressed ? 1.1 : 1.0)


            
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
