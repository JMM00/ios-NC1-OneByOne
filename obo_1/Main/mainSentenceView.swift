//
//  mainSentenceView.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/04/29.
//

import SwiftUI

struct mainSentenceView: View {
    @Binding var availablewidth: CGFloat
    
    let dialogue: DialogueData
    var body: some View {
        VStack (alignment: .center, spacing: 0){
            Text("\"")
                .font(.system(size: 60, weight: .bold))
                .frame(height: 6, alignment: .center)
                .padding(.top)
            Text(dialogue.dialogue)
                .font(.system(size: 30, weight: .bold))
                .frame(width: availablewidth - 50, alignment: .center)
                .padding()
            Text(dialogue.source)
            Divider().frame(width: availablewidth)
        }
    }
}

struct mainSentenceView_Previews: PreviewProvider {
    static var previews: some View {
        mainSentenceView(
            availablewidth: .constant(350),
            dialogue: DialogueData.sampleData[1]
        )
    }
}
