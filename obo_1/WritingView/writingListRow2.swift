//
//  writingListRow2.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/05/06.
//

import SwiftUI

struct writingListRow2: View {
    
    @Binding var availableWidth: CGFloat
    
//    @ObservedObject var viewModel = ViewModel()
//    @State private var testText = "This is the story of how i die."
    @State var sentence: [String]
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(sentence[0])
                .frame(maxWidth: availableWidth, alignment: .leading)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
            
            Text(sentence[1])
                .frame(maxWidth: availableWidth, alignment: .leading)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
                .foregroundColor(Color.gray)
        }
        .frame(width: availableWidth - 20)
    }
}

struct writingListRow2_Previews: PreviewProvider {
    static var previews: some View {
        writingListRow2(
            availableWidth: .constant(350),
            sentence: ["",""]
        )
    }
}
