//
//  WritingView.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/05/02.
//

import SwiftUI

struct WritingView: View {
    let word = ["", "just", "", "to", "take", "another", "look" ,"at" ,"asdfasdf"]
    @State var wordBool = [Bool] (repeating: false, count: 9)
    @StateObject var sentenceModel: SentenceModel = SentenceModel()
    @State private var test: String = ""
    
    @Binding var availableWidth: CGFloat
    
    var body: some View {
        ScrollView {
            VStack{
                ModalTopView(availablewidth: $availableWidth)
                Divider()
                Spacer()
                
                Text("1단계: 나만의 문장 빈칸채우기")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("")
                Spacer()
                
                _FlexibleView(availableWidth: availableWidth, data: word, spacing: sentenceModel.spacing){
                        item in
                    /*
                    Button(item) {
                        wordBool[1] = item.isEmpty ? false : true
                    }
                    .disabled(wordBool[1])
                    .padding(8)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.gray.opacity(0.2))
                        )
                     */
                    /*
                        TextField(item, text: $test)
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.gray.opacity(0.2))
                            )
                     */
                        
                         Text(verbatim: item)
                         .padding(8)
                         .background(
                         RoundedRectangle(cornerRadius: 8)
                         .fill(Color.gray.opacity(0.2))
                         )
                         
                    }
                
            }.padding(.horizontal)
            
        }
        .padding(.horizontal)
        .frame(maxWidth: 350, maxHeight: .infinity)
    }
}

struct WritingView_Previews: PreviewProvider {
    static var previews: some View {
        WritingView(availableWidth: .constant(350))
    }
}
