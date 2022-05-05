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
    
    //Json
//    @ObservedObject var dialogueDatas = ReadData()
    let dialogueIndex  = Int.random(in: 0..<3)
    
    //sample data
    let dialogues: [DialogueData]
    let index: Int = 2
    
    
    var body: some View {
        
        //화면 사이즈 계산
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            Color.clear
                .frame(maxWidth: .infinity, maxHeight: 1)
                .readSize { size in
                    sizeModel.width = size.width - 40
                    availableWidth = size.width - 40
                }
            
            //tab view
            TabView{
                MainView(
                    availableWidth: $availableWidth,
                    dialogue: dialogues[index]
                ).tabItem {
                    Image(systemName: "house.fill")
                    Text("Main")
                    
                }.tag(1)
                WritingView(
                    availableWidth: $availableWidth,
                    dialogue: dialogues[index],
                    coreDM: CoreDataManager()
                ).tabItem {
                    Image(systemName: "plus.circle.fill")
                    Text("Add") }.tag(2)
                
                LogView(
                    avaliableWidth: $availableWidth,
                    dialogue: dialogues[index]
                ).tabItem {
                    Image(systemName: "camera.macro")
                    Text("Log") }.tag(3)
            }
            .accentColor(.blackE)
        }
        .onAppear()
        {
            UITabBar.appearance().backgroundColor = .white
        }
//        .environmentObject(sizeModel)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(dialogues: DialogueData.sampleData)
    }
}
