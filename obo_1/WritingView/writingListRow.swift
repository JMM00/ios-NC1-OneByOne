//
//  writingListRow.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/05/05.
//

import SwiftUI

struct writingListRow: View {
    
    @Binding var availableWidth: CGFloat
    
//    @ObservedObject var viewModel = ViewModel()
//    @State private var testText = "This is the story of how i die."
    @State var sentence: Sentence
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(sentence.modifiedSentence ?? "")
                .frame(maxWidth: availableWidth)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
            
            Text(sentence.meanSentence ?? "")
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
                .foregroundColor(Color.gray)
        }
        .frame(width: availableWidth - 20)
    }
}

struct writingListRow_Previews: PreviewProvider {
    static var previews: some View {
        writingListRow(
            availableWidth: .constant(350),
            sentence: Sentence()
        )
    }
}
