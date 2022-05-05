//
//  ModalView.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/04/29.
//

import SwiftUI

struct ModalView: View {
    @Binding var showSheetView: Bool
    @Binding var avaliableWidth: CGFloat
    @EnvironmentObject var sizeModel : ScreenSize
    
    let dialogue: DialogueData
    
    @State var wordArr: [String] = []
    
    func getWord(dialogue: String) {
        wordArr = dialogue.split(separator: " ").map {String($0)}
        print(wordArr, "_____main____getWord")
    }
    
    var body: some View {
        let width: CGFloat = avaliableWidth
        
        NavigationView {
            ScrollView (.vertical, showsIndicators: false, content:  {
                VStack{
                    ModalTopView(
                        dialogues: dialogue,
                        availablewidth: $avaliableWidth
                    )
                    Divider()
                        .background(Color.blackE)
                    
                    Text("오늘의 단어")
                        .font(.title3)//.bold()
//                        .frame(width: avaliableWidth, height: 24, alignment: .leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color.gray)
                        .padding(.vertical)
                    ForEach (wordArr, id:\.self) { word in
                        Text(word)
                            .font(.body).bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        ModalWordView(
    //                        word: .constant("how"),
                            width: $avaliableWidth,
                            dialogue: dialogue,
                            vm: DictionaryModel(word: word)
                        )
                        Divider()
//                            .background(Color.gray4)
                    }
//                    ModalWordView(
////                        word: .constant("how"),
//                        width: $avaliableWidth,
//                        dialogue: dialogue,
//                        vm: DictionaryModel(word: "hey")
//                    )
//                    Divider().padding(.vertical)

                }//vstack
                .frame(width: width)
                .navigationBarTitle("", displayMode: .inline)
                
                .navigationBarItems(trailing: Button(action: {
                                    print("Dismissing sheet view...")
                                    self.showSheetView = false }) {
                                    Text("Done").bold()
                                })
            })//scrollview
        }
        .onAppear {
            getWord(dialogue: dialogue.dialogue)
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView(
            showSheetView: .constant(true),
            avaliableWidth: .constant(350),
            dialogue: DialogueData.sampleData[1]
        )
    }
}
