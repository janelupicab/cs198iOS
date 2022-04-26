//
//  ContentView.swift
//  EasyRes
//
//  Created by Jane on 4/25/22.
//

import SwiftUI

class myInfo: ObservableObject{
    //this class is used to transfer the user's input so that it can be used across views (aka the resume views)
    //TODO: use these variable names when creating your template view
    
    //basic information variables
    @Published var name: String = ""
    @Published var location: String = ""
    @Published var linkedIn: String = ""
    @Published var website: String = ""
    @Published var email: String = ""
    @Published var phone: String = ""
    
    //school variables
    @Published var school: String = ""
    @Published var startSchool: String = ""
    @Published var endSchool: String = ""
    @Published var gpa: String = ""
    @Published var clubs: String = ""
    @Published var awards: String = ""

    //work experience 1 variables
    @Published var e1title: String = ""
    @Published var e1company: String = ""
    @Published var e1location: String = ""
    @Published var e1start: String = ""
    @Published var e1end: String = ""
    @Published var e1detail1: String = ""
    @Published var e1detail2: String = ""
    @Published var e1detail3: String = ""

    //work experience 2 variables
    @Published var e2title: String = ""
    @Published var e2company: String = ""
    @Published var e2location: String = ""
    @Published var e2start: String = ""
    @Published var e2end: String = ""
    @Published var e2detail1: String = ""
    @Published var e2detail2: String = ""
    @Published var e2detail3: String = ""
    
    //work experience 3 variables
    @Published var e3title: String = ""
    @Published var e3company: String = ""
    @Published var e3location: String = ""
    @Published var e3start: String = ""
    @Published var e3end: String = ""
    @Published var e3detail1: String = ""
    @Published var e3detail2: String = ""
    @Published var e3detail3: String = ""
    
    //project 1 variables
    @Published var p1name: String = ""
    @Published var p1title: String = ""
    @Published var p1detail1: String = ""
    @Published var p1detail2: String = ""
    @Published var p1detail3: String = ""
    
    //project 2 variables
    @Published var p2name: String = ""
    @Published var p2title: String = ""
    @Published var p2detail1: String = ""
    @Published var p2detail2: String = ""
    @Published var p2detail3: String = ""
    
    //project 3 variables
    @Published var p3name: String = ""
    @Published var p3title: String = ""
    @Published var p3detail1: String = ""
    @Published var p3detail2: String = ""
    @Published var p3detail3: String = ""
    
    //skills
    @Published var skill1: String = ""
    @Published var skill2: String = ""
    @Published var skill3: String = ""
    @Published var skill4: String = ""
    @Published var skill5: String = ""
    
    //courses
    @Published var course1: String = ""
    @Published var course2: String = ""
    @Published var course3: String = ""
    @Published var course4: String = ""
    @Published var course5: String = ""
    
   
}



struct ContentView: View {
    //basic information variables
        @State var temp1: String = ""
        @State var temp2: String = ""
        @State var temp3: String = ""
        @State var temp4: String = ""
        @State var temp5: String = ""
        @State var temp6: String = ""
        @State var temp7: String = ""
        @State var temp8: String = ""

    
    @StateObject var me = myInfo()
    
    init(){
            UITableView.appearance().backgroundColor = .clear
            UITabBar.appearance().backgroundColor = UIColor.white

        }
    
    var body: some View {
        NavigationView {
            TabView {
    
                // ///////////////// ///
                //TEMPLATES TAB VIEW //
                // ///////////////////

                //****TODO: make it look a bit nicer if we want
                VStack{
                    Text("Resume Templates").font(.custom("Arimo-Bold", size: 30))
                        .padding(.bottom, 40)
                    HStack{ //templates 1 and 2
                        
                        //Template 1
                        NavigationLink(destination: JaneView().environmentObject(self.me)) {
                            VStack{
                                Image("jane")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 119, height: 154)
                                    Text("Bold Resume")
                                        .font(.custom("Arimo-Regular", size: 16))
                                }
                        }.padding(25)
                        
                        //Template 2
                        NavigationLink(destination: JeffreyView().environmentObject(self.me)) {
                            VStack{
                                Image("jeffrey")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 119, height: 154)
                                    Text ("Project Resume")
                                        .font(.custom("Arimo-Regular", size: 16))
                                }
                        }.padding(25)
                    }
                   
                    HStack{ // templates 3 & 4
                        
                        //Template 3
                        NavigationLink(destination: VibhaView().environmentObject(self.me)) {
                            VStack{
                                Image("vibha")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 119, height: 154)
                                    Text ("Detailed Resume")
                                        .font(.custom("Arimo-Regular", size: 16))
                                }
                        }.padding(25)
                        
                        //Template 4
                        NavigationLink(destination: VivianView().environmentObject(self.me)) {
                            VStack{
                                Image("vivian")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 119, height: 154)
                                
                                    Text ("Technical Resume")
                                        .font(.custom("Arimo-Regular", size: 16))
                                }
                        }.padding(25)
                    }
                } .tabItem{
                    Image(systemName: "house.fill")
                    Text("Templates")}
                
                
                // /////////////////
                //PROFILE TAB VIEW //
                // //////////////////
                VStack{
                    Text("My Information").font(.custom("Arimo-Bold", size: 30))
                        .padding(.bottom, 40)
                    List {
                        //BASIC INFORMATION
                        Section(header:Text("BASIC INFORMATION") .font(.custom("Arimo-SemiBold", size: 16))){
                            
                            TextField("Full Name", text: $me.name)
                            TextField("Location", text: $me.location)
                            TextField("LinkedIn", text: $me.linkedIn)
                            TextField("Website", text: $me.website)
                            TextField("Email", text: $me.email)
                            TextField("Phone Number", text: $me.phone)
    
                        }
                        
                        //EDUCATION
                        Section(header:Text("EDUCATION")
                            .font(.custom("Arimo-SemiBold", size: 16))){

                            TextField("School Name", text: $me.school)
                            TextField("Start Month & Year", text: $me.startSchool)
                            TextField("End Month & Year", text: $me.endSchool )
                            TextField("GPA", text: $me.gpa)
                            TextField("Clubs", text: $me.clubs)
                            TextField("Awards", text: $me.awards)

                        }

                        //WORK EXPERIENCE
                        Section(header:Text("WORK EXPERIENCE 1") .font(.custom("Arimo-SemiBold", size: 16))){

                            TextField("Job Title", text: $me.e1title)
                            TextField("Company", text: $me.e1company)
                            TextField("Location", text: $me.e1location)
                            TextField("Start Month & Year", text: $me.e1start)
                            TextField("End Month & Year", text: $me.e1end)
                            TextField("Details 1", text: $me.e1detail1)
                            TextField("Details 2", text: $me.e1detail2)
                            TextField("Details 3", text: $me.e1detail3)
                        }

                        Section(header:Text("WORK EXPERIENCE 2") .font(.custom("Arimo-SemiBold", size: 16))){
                            
                            TextField("Job Title", text: $me.e2title)
                            TextField("Company", text: $me.e2company)
                            TextField("Location", text: $me.e2location)
                            TextField("Start Month & Year", text: $me.e2start)
                            TextField("End Month & Year", text: $me.e2end)
                            TextField("Details 1", text: $me.e2detail1)
                            TextField("Details 2", text: $me.e2detail2)
                            TextField("Details 3", text: $me.e2detail3)
                        }

                        Section(header:Text("WORK EXPERIENCE 3") .font(.custom("Arimo-SemiBold", size: 16))){

                            TextField("Job Title", text: $me.e3title)
                            TextField("Company", text: $me.e3company)
                            TextField("Location", text: $me.e3location)
                            TextField("Start Month & Year", text: $me.e3start)
                            TextField("End Month & Year", text: $me.e3end)
                            TextField("Details 1", text: $me.e3detail1)
                            TextField("Details 2", text: $me.e3detail2)
                            TextField("Details 3", text: $me.e3detail3)
                        }
                        
                        //PROJECT EXPERIENCE
                        Section(header:Text("PROJECT 1")
                            .font(.custom("Arimo-SemiBold", size: 16))){
                            
                            TextField("Project Name", text: $me.p1name)
                            TextField("Responsibilty Title", text: $me.p1title)
                            TextField("Details 1", text: $me.p1detail1)
                            TextField("Details 2", text: $me.p1detail2)
                            TextField("Details 3", text: $me.p1detail3)
                        }
                        
                        Section(header:Text("PROJECT 2")
                            .font(.custom("Arimo-SemiBold", size: 16))){
                            TextField("Project Name", text: $me.p2name)
                            TextField("Responsibilty Title", text: $me.p2title)
                            TextField("Details 1", text: $me.p2detail1)
                            TextField("Details 2", text: $me.p2detail2)
                            TextField("Details 3", text: $me.p2detail3)
                        }
                        
                        Section(header:Text("PROJECT 3")
                            .font(.custom("Arimo-SemiBold", size: 16))){
                            TextField("Project Name", text: $me.p3name)
                            TextField("Responsibilty Title", text: $me.p3title)
                            TextField("Details 1", text: $me.p3detail1)
                            TextField("Details 2", text: $me.p3detail2)
                            TextField("Details 3", text: $me.p3detail3)
                        }
                        
                        //SKILLS
                        Section(header:Text("SKILLS")
                            .font(.custom("Arimo-SemiBold", size: 16))){
                            TextField("Skill 1", text: $me.skill1)
                            TextField("Skill 2", text: $me.skill2)
                            TextField("Skill 3", text: $me.skill3)
                            TextField("Skill 4", text: $me.skill4)
                            TextField("Skill 5", text: $me.skill5)
                        }
                        
                        //COURSEWORK
                        Section(header:Text("COURSEWORK")
                            .font(.custom("Arimo-SemiBold", size: 16))){
                            
                            TextField("Coursework 1", text: $me.course1)
                            TextField("Coursework 2", text: $me.course2)
                            TextField("Coursework 3", text: $me.course3)
                            TextField("Coursework 4", text: $me.course4)
                            TextField("Coursework 5", text: $me.course5)
                        }
                    }
                    Spacer()
                }.tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("My Info")}
            
                
            } // end tab view bracket
        } //end navigation view bracket
    } // end var: body
} // end content view



//NAVIGATION VIEWS BELOW FOR EACH TEMPLATE:

// //////////////////////
//Jane Template View ////
// //////////////////////

struct JaneView: View {
    @EnvironmentObject var me: myInfo
    var body: some View {
        Text("JANE! \(me.name) \(me.location)\(me.email)\(me.phone)\(me.linkedIn)")
        Text("\(me.skill1)")
        Text("\(me.p1title)")
        //**** TODO: create template view

    }
}


// ///////////////////////
//Jeffrey Template View //
// //////////////////////
struct JeffreyView: View {
    @EnvironmentObject var me: myInfo
    
    var body: some View {
        Text("JEFFREY!")
        //**** TODO: create template view
        // use me.<variable name> from the variables above in class myInfo to capture what the user put in profile

    }
}


// //////////////////////
//Vibha Template View ///
// //////////////////////
struct VibhaView: View {
    @EnvironmentObject var me: myInfo
    
    var body: some View {
        Text("VIBHA!")
        //**** TODO: create template view
        // use me.<variable name> from the variables above in class myInfo to capture what the user put in profile

    }
}


// //////////////////////
//Vivian Template View //
// //////////////////////
struct VivianView: View {
    @EnvironmentObject var me: myInfo

    var body: some View {
        Text("VIVIAN!")
        //**** TODO: create template view
        // use me.<variable name> from the variables above in class myInfo to capture what the user put in profile

    }
}













//PREVIEW CODE:
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
