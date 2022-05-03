//
//  ModalTopView.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/04/29.
//

import SwiftUI

struct ModalTopView: View {
    @Binding var availablewidth: CGFloat
    
    var body: some View {
        VStack(spacing: 0){
            Text("I just wanted to take another look at you.")
                .font(.title2).bold()
//                .font(.system(size: 20, weight: .bold))
                .frame(maxWidth: .infinity, minHeight: 70, alignment: .leading)
            
            Text("그냥 다시 한번 널 보고 싶었어")
//                .font(.system(size: 15, weight: .medium))
                .font(.body)
                .frame(maxWidth: .infinity, minHeight: 20, alignment: .trailing)
             
            Text("- A start is born")
                .font(.footnote)
//                .font(.system(size: 15, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .foregroundColor(Color.gray)
                .padding(.vertical)
        }
        .frame(width: availablewidth)
    }
}

struct ModalTopView_Previews: PreviewProvider {
    static var previews: some View {
        ModalTopView(availablewidth: .constant(350))
    }
}
