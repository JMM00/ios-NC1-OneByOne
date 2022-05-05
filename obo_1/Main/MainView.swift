//
//  MainView.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/04/28.
//

import SwiftUI

struct MainView: View {
    @State private var showSheetView = false
    @Binding var availableWidth: CGFloat
    
    let dialogue: DialogueData
    
    var body: some View {
        NavigationView {
            ZStack {
                Circle()
                    .fill(Color.gray1)
                    .frame(width: availableWidth+100, height: availableWidth + 100)
                    .opacity(0.5)
                    .shadow(color: Color.gray1, radius: 3, x: 3, y: 3)
                mainSentenceView(
                    availablewidth: $availableWidth,
                    dialogue: dialogue
                )
                .frame(width: availableWidth+5, height: availableWidth + 30, alignment: .center)
                .background(
                    Capsule()
                        .fill(Color.blackE)
                        .shadow(color: Color.blackE, radius: 10, x: 3, y: 3)
                )
                .padding(5)
                .onTapGesture {
                    if !showSheetView {
                        self.showSheetView = true
                    }
                    
                }
                .sheet(isPresented: self.$showSheetView) {
                    ModalView(
                        showSheetView: self.$showSheetView,
                        avaliableWidth: $availableWidth,
                        dialogue: dialogue
                    )
                }
                
                
            }
            .frame(maxHeight: .infinity)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("OneByOne")
                }
            }
        }
        .navigationBarColor(backgroundColor: UIColor.systemBackground, tintColor: UIColor.black)
    }
    

}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(
            availableWidth: .constant(350),
            dialogue: DialogueData.sampleData[2]
        )
    }
}
