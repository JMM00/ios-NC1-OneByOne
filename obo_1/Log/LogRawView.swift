//
//  LogRawView.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/04/29.
//

import SwiftUI

struct LogRawView: View {
    
    @Binding var availablewidth: CGFloat
    @Binding var sentence: String
    
    var body: some View {
        Text(sentence)
            .frame(maxWidth: availablewidth - 50,alignment: .leading)
            .multilineTextAlignment(.leading)
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius:15).stroke(lineWidth:2)
                    .foregroundColor(Color.gray)
            )
    }
}

struct LogRawView_Previews: PreviewProvider {
    static var previews: some View {
        LogRawView(
            availablewidth: .constant(350),
            sentence: .constant("")
        )
    }
}
