//
//  SentenceDetail.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/05/03.
//

import SwiftUI

struct SentenceDetail: View {
    
    let sentence: Sentence
    @State private var sentenceModified: String = ""
    let coreDM: CoreDataManager
    @Binding var needRefresh: Bool
    
    var body: some View {
        VStack {
            TextField(sentence.modifiedSentence ?? "", text: $sentenceModified)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Update") {
                if !sentenceModified.isEmpty{
                    sentence.modifiedSentence = sentenceModified
                    coreDM.updateSentence()
                }
            }
        }
    }
}

struct SentenceDetail_Previews: PreviewProvider {
    static var previews: some View {
        let sentence = Sentence()
        let coreDM = CoreDataManager()
        SentenceDetail(
            sentence: sentence,
            coreDM: coreDM,
            needRefresh: .constant(false)
        )
    }
}
