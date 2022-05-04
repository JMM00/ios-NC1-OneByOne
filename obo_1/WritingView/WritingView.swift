//
//  WritingView.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/05/02.
//

import SwiftUI

struct WritingView: View {
    let word = ["i", "just", "wanted", "to", "take", "another", "look" ,"at" ,"you"]
    @State var wordBool = [Bool] (repeating: false, count: 9)
    @StateObject var sentenceModel: SentenceModel = SentenceModel()
    @State private var test: String = ""
    @State private var needRefresh: Bool = false
    @State var listHeight: CGFloat = 0
    
    
    @Binding var availableWidth: CGFloat
    
    let dialogue: DialogueData
    
    //CoreData (데이터 입력 및 저장)
    let coreDM: CoreDataManager
    @State private var sentenceModified: String = ""
    @State private var sentences: [Sentence] = [Sentence] ()
    
    private func populateSentences() {
        listHeight = CGFloat(sentences.count * 53)
        sentences = coreDM.getAllSentences()
    }
    
     
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack{
                    ModalTopView(
                        dialogues: dialogue,
                        availablewidth: $availableWidth
                    )
                    Divider()
                    
                    Group {
                        Text("1단계: 문장 빈칸채우기")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("")
                        
                        _FlexibleView (
                            availableWidth: availableWidth,
                            data: word,
                            spacing: 8){ item in Text(verbatim: item)
                                    .padding(8)
                                    .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(Color.gray.opacity(0.2))
                                    )
                            }
                        
                        
                        Button{
                        } label: {
                             Image(systemName: "plus")
                        }
                        .frame(width: 30, height: 30)
                        .background(
                            RoundedRectangle(
                                cornerRadius: 8
                            )
                            .fill(
                                Color.gray.opacity(0.2)
                            )
                        )
                    }
                    
                    Divider()
                    
                    Group {
                        Text("2단계: 나만의 문장 만들기")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        HStack {
                            TextField("i just wanted to take another look at you.", text: $sentenceModified)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            Button{
                                coreDM.saveSentence(modifiedSentence: sentenceModified)
                                populateSentences()
                                sentenceModified = ""
                            } label: {
                                 Image(systemName: "plus")
                            }
                            .frame(width: 30, height: 30)
                            .background(
                                RoundedRectangle(
                                    cornerRadius: 8
                                )
                                .fill(
                                    Color.gray.opacity(0.2)
                                )
                            )
                        }
                        
                        VStack {
                            List{
                                /*
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
                                 */
                                ForEach(sentences, id: \.self) { sentence in
                                    Text(sentence.modifiedSentence ?? "")
                                }.onDelete(perform: { indexSet in
                                    indexSet.forEach { index in
                                        let sentence = sentences[index]
                                        //delete it using core data manager
                                        coreDM.deleteSentence(sentence: sentence)
                                        populateSentences()
                                    }
                                })
                            }
                            .onAppear {
                                 populateSentences()
                            }
                            .listStyle(PlainListStyle())
                            .accentColor(needRefresh ? .white : .black)
                        }
                        .onAppear {
                             populateSentences()
                        }
                        .frame(height: listHeight)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.horizontal)
            .frame(maxWidth: availableWidth, maxHeight: .infinity)
            Spacer()
        }
        
    }
}

struct WritingView_Previews: PreviewProvider {
    static var previews: some View {
        WritingView(
            availableWidth: .constant(350),
            dialogue: DialogueData.sampleData[1],
            coreDM: CoreDataManager()
        )
        .previewInterfaceOrientation(.portrait)
    }
}
