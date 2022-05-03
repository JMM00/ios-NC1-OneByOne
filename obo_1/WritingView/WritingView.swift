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
    @State private var needRefresh: Bool = false
    
    @Binding var availableWidth: CGFloat
    
    //CoreData (데이터 입력 및 저장)
    let coreDM: CoreDataManager
    @State private var sentenceModified: String = ""
    @State private var sentences: [Sentence] = [Sentence] ()
    
    private func populateSentences() {
        sentences = coreDM.getAllSentences()
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack{
                    ModalTopView(availablewidth: $availableWidth)
                    Divider()
                    
                    Group {
                        Text("1단계: 나만의 문장 빈칸채우기")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("")
                        
                        _FlexibleView(availableWidth: availableWidth, data: word, spacing: sentenceModel.spacing){
                                item in
                                 Text(verbatim: item)
                                 .padding(8)
                                 .background(
                                 RoundedRectangle(cornerRadius: 8)
                                 .fill(Color.gray.opacity(0.2))
                                 )
                                 
                            }
                        Button("추가하기") {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }
                        .frame(width: 200, height: 30)
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.gray.opacity(0.2))
                        )
                    }
                    
                    Divider()
                    
                    Group {
                        Text("2단계: 나만의 문장 만들기")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        List{
                            
                            ForEach(sentences, id: \.self) { sentence in
                                NavigationLink(
                                    destination: SentenceDetail(
                                        sentence: sentence,
                                        coreDM: coreDM,
                                        needRefresh: $needRefresh
                                    ),
                                    label: {
                                    Text(sentence.modifiedSentence ?? "")
                                    }
                                )
                                
                            }.onDelete(perform: { indexSet in
                                indexSet.forEach { index in
                                    let sentence = sentences[index]
                                    //delete it using core data manager
                                    coreDM.deleteSentence(sentence: sentence)
                                    populateSentences()
                                }
                            })
                            
                        }
                        .listStyle(PlainListStyle())
                        .accentColor(needRefresh ? .white : .black)
                        .frame(width: 350, height: 300)
                        TextField("i just wanted to take another look at you.", text: $sentenceModified)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Button("추가하기") {
                            coreDM.saveSentence(modifiedSentence: sentenceModified)
                            populateSentences()
                        }
                        .frame(width: 200, height: 30)
                        .background(
                            RoundedRectangle(
                                cornerRadius: 8
                            )
                            .fill(
                                Color.gray.opacity(0.2)
                            )
                        )
                    }
                    
                    
                }
                .padding(.horizontal)
                
            }
            .padding(.horizontal)
            .frame(maxWidth: 350, maxHeight: .infinity)
            .onAppear {
                 populateSentences()
        }
        }
    }
}

struct WritingView_Previews: PreviewProvider {
    static var previews: some View {
        WritingView(
            availableWidth: .constant(350),
            coreDM: CoreDataManager()
        )
    }
}
