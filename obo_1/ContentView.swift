//
//  ContentView.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/04/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            MainView().tabItem {
                Image("to").renderingMode(.template)
                /*@START_MENU_TOKEN@*/Text("Tab Label 1")/*@END_MENU_TOKEN@*/
                
            }.tag(1)
            WritingView().tabItem {
                Image("to").renderingMode(.template)
                Text("add") }.tag(2)
            
            LogView().tabItem {
                Image("to").renderingMode(.template)
                /*@START_MENU_TOKEN@*/Text("Tab Label 2")/*@END_MENU_TOKEN@*/ }.tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
