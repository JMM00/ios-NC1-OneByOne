//
//  ContentView.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/04/28.
//

import SwiftUI


class ScreenSize: ObservableObject {
    @Published var width: CGFloat = UIScreen.main.bounds.width
}
struct ContentView: View {
    @StateObject var sizeModel: ScreenSize = ScreenSize()
    @State private var availableWidth: CGFloat = 0
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            Color.clear
                .frame(maxWidth: .infinity, maxHeight: 1)
                .readSize { size in
                    sizeModel.width = size.width - 70
                    availableWidth = size.width - 70
                }
            
            TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
                MainView(availableWidth: $availableWidth).tabItem {
                    Image("to").renderingMode(.template)
                    /*@START_MENU_TOKEN@*/Text("Tab Label 1")/*@END_MENU_TOKEN@*/
                    
                }.tag(1)
                WritingView(availableWidth: $availableWidth).tabItem {
                    Image("to").renderingMode(.template)
                    Text("add") }.tag(2)
                
                LogView().tabItem {
                    Image("to").renderingMode(.template)
                    /*@START_MENU_TOKEN@*/Text("Tab Label 2")/*@END_MENU_TOKEN@*/ }.tag(3)
            }
        }
        .environmentObject(sizeModel)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
