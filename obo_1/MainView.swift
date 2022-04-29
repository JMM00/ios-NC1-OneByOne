//
//  MainView.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/04/28.
//

import SwiftUI

struct MainView: View {
    @State private var showModal = false
    
    var body: some View {
        Text("탭 main view")
            .frame(width: 300, height: 300, alignment: .center)
            .background(Color.blue)
            .onTapGesture {
                if !showModal {
                    self.showModal = true
                }
                
            }
            .sheet(isPresented: self.$showModal) {ModalView()}
    }

}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
