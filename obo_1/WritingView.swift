//
//  WritingView.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/05/02.
//

import SwiftUI

struct WritingView: View {
    let word = ["", "just", "", "to", "take", "another", "look" ,"at" ,"kgkjhgkjhkjhgkjh"]
    @StateObject var sentenceModel: SentenceModel = SentenceModel()
    @State var test: String = ""
    var body: some View {
        VStack {
            ModalTopView()
            Divider()
            Spacer()
            
            Text("1단계: 빈칸을 채워 나만의 문장을 완성하세요!")
            Text("")
            Spacer()
            
            //HStack{
            /*
             ForEach(sentenceModel.wordSentence, id: \.self) { item in
             ForEach(item, id: \.self) { word in
             if (word.isEmpty){
             Text("쿠쿠루삥뽕")
             }else{
             Text(word)
             }
             
             }
             */
            ScrollView{
                _FlexibleView(
                    availableWidth: 350,
                    data: word,
                    spacing: sentenceModel.spacing){
                        item in
                        TextField(item, text: $test)
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.gray.opacity(0.2))
                            )
                        /*
                        Text(verbatim: item)
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.gray.opacity(0.2))
                            )
                         */
                    }
                
            }
            .padding(.horizontal)
            
            /*
             ForEach(sentenceModel.wordSentence[0], id: \.self) { item in
             if (item.isEmpty){
             Text("쿠쿠ㄹㅍㅍ")
             }else{
             Text(item)
             }
             
             }
             */
        }
        .frame(maxWidth: 350, maxHeight: .infinity)
    }
}

struct WritingView_Previews: PreviewProvider {
    static var previews: some View {
        WritingView(test: " ")
    }
}
