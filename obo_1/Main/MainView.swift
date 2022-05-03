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
    
    var body: some View {
        mainSentenceView()
            .frame(width: 300, height: 400, alignment: .center)
            .background(Color.blue)
            .onTapGesture {
                if !showSheetView {
                    self.showSheetView = true
                }
                
            }
            .sheet(isPresented: self.$showSheetView) {ModalView(showSheetView: self.$showSheetView, avaliableWidth: $availableWidth)}
    }

}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(availableWidth: .constant(350))
    }
}
