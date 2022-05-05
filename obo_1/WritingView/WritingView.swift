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
    
    @State private var sentencesNow = [[String]]()
    
    //list출력 요소
    @State private var result = ""
    
    private func populateSentences() {
        sentences = coreDM.getAllSentences()
        listHeight = CGFloat((sentences.count+1) * 40 * 2)
    }
    
    @ObservedObject var viewModel = ViewModel()
    @State private var testText = "This is the story of how i die."
    
//    init() {
//        UITableView.appearance().showsVerticalScrollIndicator = false
//    }
    
    var body: some View {
        NavigationView {
            ScrollView (showsIndicators: false) {
                VStack{
                    ModalTopView(
                        dialogues: dialogue,
                        availablewidth: $availableWidth
                    )
                    Divider().foregroundColor(Color.blackE)
                    Group {
                        Text("나만의 문장 만들기")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        HStack{
                            ZStack(alignment: .topLeading) {
                                
                                if sentenceModified.isEmpty {
                                    Text("Make your own Expression")
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .padding(.vertical, 8)
                                        .background(Color.gray4)
                                }
                                TextEditor(text:$sentenceModified)
                                    .padding(2)
                                    .frame(maxWidth: .infinity)
                                    .submitLabel(.done)
                            }
                            .background(sentenceModified.isEmpty ? Color.gray4 : Color.blackE)
                            .font(.body)
                            Button{
                                UIApplication.shared.endEditing()
                                testText = sentenceModified
                                viewModel.requestAPI(sentence: testText) //왜 여기서 바로 결과가 나오지 않지?
                                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                                  // 1초 후 실행될 부분
                                    print(testText, "______________________testTest")
                                    print("button click__",viewModel.text)

                                    coreDM.saveSentence(
                                        modifiedSentence: sentenceModified,
                                        meanSentence: viewModel.text
                                    )
                                    sentencesNow.append([sentenceModified,viewModel.text])
                                    
                                    let _ = print("coreDM.savesentence")
                                    
                                    populateSentences()

                                    sentenceModified = ""
                                    testText = ""
                                }
                                
                            } label: {
                                Image(systemName: "plus")
                            }.disabled(sentenceModified.isEmpty ? true : false)
                            .frame(maxWidth: 30, maxHeight: .infinity)
                            .background(
                                RoundedRectangle(
                                    cornerRadius: 8
                                )
                                .fill(
                                    sentenceModified.isEmpty ? Color.gray4 : Color.blackE
                                )
                            ).accentColor(Color.whiteE)
                            
                        }//hstack
                        Spacer()
                        VStack {
                            if !sentencesNow.isEmpty {
                                List{
                                    ForEach(sentencesNow, id: \.self) { sentence in
                                        writingListRow2(
                                            availableWidth: $availableWidth,
                                            sentence: sentence)
                                    }.onDelete(perform: { indexSet in
                                        indexSet.forEach { index in
                                            
                                            sentencesNow.remove(at: index)
                                            //delete it using core data manager
                                            let sentence = sentences[index]
                                            coreDM.deleteSentence(sentence: sentence)
                                            populateSentences()
                                            
                                        }
                                    })
                                    
                                }
                                .listStyle(PlainListStyle())
        //                        .accentColor(needRefresh ? .white : .black)
                                .frame(width: availableWidth, height: listHeight, alignment: .leading)
                            }
                            
                        }
                        .onAppear (perform : UIApplication.shared.hideKeyboard)
                    }
                }//VStack
                .onAppear{
                    populateSentences()
                }
                
                .padding(.horizontal)
            }
            .padding(.horizontal)
        .frame(maxWidth: availableWidth, maxHeight: .infinity)
        .navigationBarTitleDisplayMode(.inline)
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
    }
}
