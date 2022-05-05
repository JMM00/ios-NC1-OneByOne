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
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            
            Text(dialogues.mean)
//                .font(.system(size: 15, weight: .medium))
                .font(.body)
                .frame(maxWidth: availablewidth, alignment: .trailing)
                .padding(.vertical)
             
            Text(dialogues.source)
                .font(.footnote)
//                .font(.system(size: 15, weight: .medium))
                .frame(maxWidth: availablewidth, alignment: .trailing)
                .foregroundColor(Color.gray)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
        }
        .frame(width: availablewidth)
        .foregroundColor(Color.blackE)
//        .padding()
//        .background(Color.blueE)
    }
}

struct ModalTopView_Previews: PreviewProvider {
    static var previews: some View {
        ModalTopView(
            dialogues: DialogueData.sampleData[7],
            availablewidth: .constant(350)
        )
    }
}
