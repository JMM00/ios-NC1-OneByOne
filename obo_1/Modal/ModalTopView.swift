//
//  ModalTopView.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/04/29.
//

import SwiftUI

struct ModalTopView: View {
    let dialogues: DialogueData
    @Binding var availablewidth: CGFloat
    
    var body: some View {
        VStack(spacing: 0){
            Text(dialogues.dialogue)
                .font(.title2).bold()
//                .font(.system(size: 20, weight: .bold))
                .frame(maxWidth: .infinity, minHeight: 70, alignment: .leading)
            
            Text(dialogues.mean)
//                .font(.system(size: 15, weight: .medium))
                .font(.body)
                .frame(maxWidth: .infinity, minHeight: 20, alignment: .trailing)
                .padding(.vertical)
             
            Text(dialogues.source)
                .font(.footnote)
//                .font(.system(size: 15, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .foregroundColor(Color.gray)
                .padding(.bottom)
        }
        .frame(width: availablewidth)
    }
}

struct ModalTopView_Previews: PreviewProvider {
    static var previews: some View {
        ModalTopView(
            dialogues: DialogueData.sampleData[1],
            availablewidth: .constant(350)
        )
    }
}
