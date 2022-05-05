//
//  LogDetailView.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/04/30.
//

import SwiftUI

struct LogDetailView: View {
    @Binding var availablewidth: CGFloat
    
    let dialogue: DialogueData
    
    var body: some View {
        VStack (alignment: .leading) {
            ModalTopView(
                dialogues: dialogue,
                availablewidth: $availablewidth
            )
            Divider().padding(.bottom)
            
            LogRawView(availablewidth: $availablewidth, sentence: .constant("test"))
//            LogRawView(availablewidth: $availablewidth)
        }
        .frame(width: 350, height: 700, alignment: .top)
        
        
    }
}

struct LogDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LogDetailView(
            availablewidth: .constant(350),
            dialogue: DialogueData.sampleData[0]
         )
    }
}
