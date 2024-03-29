//
//  ModalExView.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/04/29.
//

import SwiftUI

struct ModalExView: View {
    @Binding var avaliableWidth: CGFloat
    
    var body: some View {
        Text("I wanted to take another look at this view.")
            .font(.system(size: 18, weight: .regular))
            .frame(width: avaliableWidth, height: 24, alignment: .leading)
            .foregroundColor(Color.gray)
    }
}

struct ModalExView_Previews: PreviewProvider {
    static var previews: some View {
        ModalExView(
            avaliableWidth: .constant(350)
        )
    }
}
