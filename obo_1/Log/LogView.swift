//
//  LogView.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/04/29.
//

import SwiftUI

struct LogView: View {
    
    @Binding var avaliableWidth: CGFloat
    let dialogue: DialogueData
    
    let coreDM: CoreDataManager
    @State private var sentences: [Sentence] = [Sentence] ()
    
    private func populateSentences() {
        sentences = coreDM.getAllSentences()
//        listHeight = CGFloat((sentences.count+1) * 40 * 2)
    }
    
    var body: some View {
        NavigationView {
            VStack (spacing:10) {
                Text(dialogue.dialogue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 22, weight: .bold))
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.top)
                Divider()
                    .background(Color.blackE)
//                HStack{
//                    LogBulletView()
//                    LogRawView(availablewidth: $avaliableWidth)
//                }
//                Spacer().padding()
                //core
                List{
                    ForEach(sentences, id: \.self) { sentence in
                        HStack {
                            LogBulletView()
                            LogRawView(availablewidth: $avaliableWidth, sentence: .constant(sentence.modifiedSentence ?? ""))
//                            Text(sentence.modifiedSentence ?? "")
                        }
                        .listRowSeparator(.hidden)
                    }
                }
                .listStyle(PlainListStyle())
                .onAppear {
                    populateSentences()
                }
            }
            .frame(width: avaliableWidth, alignment: .center)
            .navigationBarTitleDisplayMode(.inline)
//            .toolbar {
//                ToolbarItem(placement: .principal) {
//                    Text("OneByOne")
//                }
//            }
        }
    }
}

struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        LogView(
            avaliableWidth: .constant(350),
            dialogue: DialogueData.sampleData[1],
            coreDM: CoreDataManager()
        )
    }
}
