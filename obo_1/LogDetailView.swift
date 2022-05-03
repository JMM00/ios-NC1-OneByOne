//
//  LogDetailView.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/04/30.
//

import SwiftUI

struct LogDetailView: View {
    @Binding var availablewidth: CGFloat
    var body: some View {
        VStack (alignment: .leading) {
            ModalTopView(availablewidth: $availablewidth)
            Divider().padding(.bottom)
            
            LogRawView()
            LogRawView()
        }
        .frame(width: 350, height: 700, alignment: .top)
        
        
    }
}

struct LogDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LogDetailView(availablewidth: .constant(350))
    }
}
