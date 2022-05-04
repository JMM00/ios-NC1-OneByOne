//
//  WritingView.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/05/02.
//

import SwiftUI

struct WritingView: View {
    
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
    
    //list출력 요소
    @State private var result = ""
    
    private func populateSentences() {
        listHeight = CGFloat(sentences.count * 53 * 2)
        sentences = coreDM.getAllSentences()
    }
    
    @ObservedObject var viewModel = ViewModel()
    @State private var testText = "This is the story of how i die."
    
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
                        Text("나만의 문장 만들기")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        HStack {
                            TextField("i just wanted to take another look at you.", text: $sentenceModified)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            Button{
                                testText = sentenceModified
                                viewModel.requestAPI(sentence: testText) //왜 여기서 바로 결과가 나오지 않지?
                                
                                coreDM.saveSentence(
                                    modifiedSentence: sentenceModified,
                                    meanSentence: viewModel.text
//                                        viewModel.requestAPI(sentence: testText)
//                                        viewModel.text
                                )
                                populateSentences()
                                
                                sentenceModified = ""
                                testText = ""
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
                                ForEach(sentences, id: \.self) { sentence in
                                    Text(sentence.modifiedSentence ?? "")
                                    Text(sentence.meanSentence ?? "")
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
