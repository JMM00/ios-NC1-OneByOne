//
//  ModalWordView.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/04/29.
//

import SwiftUI


class DictionaryModel: ObservableObject{
    
    @State var wordElement: String = ""
    
    @State var standardUrl: String = "https://api.dictionaryapi.dev/api/v2/entries/en/"
    @State var result = ""
    @Published var wordInfo: [WordInfoElement] = []
    
    @State var wordArray = ["The", "greatest", "thing", "you\'ll", "ever", "learn", "is", "just", "to", "love", "and", "be", "loved", "in", "return"]
    
    init() {
//        wordArray = 
        getPosts(word: wordArray[5])
        getPosts(word: wordArray[2])
    }
    
    func getPosts(word: String) {
        guard let url = URL(string: standardUrl + word )else{ return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data{
                let str = String(data: data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue)) ?? ""
                
                print("str____",str)
                
                let decoder = JSONDecoder()
                
                if let data = str.data(using: .utf8){
                    do {
                        let decodedResult = try decoder.decode([WordInfoElement].self, from: data)
                        print("decodedResult", decodedResult)
                        DispatchQueue.main.sync(){
                            
                            self.wordInfo = decodedResult
                            print("dispatchqueue___", self.wordInfo.count)
                        }
                        print("self.wordInfo: ",self.wordInfo)
                    }
                    catch let DecodingError.dataCorrupted(context) {
                        print("context", context)
                    } catch let DecodingError.keyNotFound(key, context) {
                        print("Key '\(key)' not found:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch let DecodingError.valueNotFound(value, context) {
                        print("Value '\(value)' not found:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch let DecodingError.typeMismatch(type, context)  {
                        print("Type '\(type)' mismatch:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch {
                        print("error: ", error)
                    }
                    return
                }
            }
        }
        .resume()

    }
}

struct ModalWordView: View {
    @StateObject var vm = DictionaryModel()
    @State var result = ""
    @State var wordArr: [String] = []
    
//    @EnvironmentObject var sizeModel : ScreenSize
    @Binding var avaliableWidth: CGFloat
    
    let dialogue: DialogueData
    
    func getWord(dialogue: String) {
        wordArr = dialogue.split(separator: " ").map {String($0)}
        print(wordArr, "_________getWord")
    }
    
    var body: some View {
        /*
        VStack {
            Text("just")
//                .font(.system(size: 20, weight: .medium))
                .font(.body).bold()
                .frame(maxWidth: .infinity, minHeight: 24, alignment: .leading)
                .foregroundColor(Color.black)
            DownloadWithEscaping(wordArr: wordArr)
            Text("1. (‘정확히’라는 뜻의) 딱[꼭]    2. …하는 바로[딱] 그 순간에    3. 공정한 (=fair)   4. 공정한 사람들")
//                .font(.system(size: 16, weight: .medium))
                .font(.body)
                .frame(maxWidth: .infinity, minHeight: 48, alignment: .leading)
                .foregroundColor(.gray)
        }
        .frame(width: avaliableWidth)
         */
//        let _ = getWord(dialogue: dialogue.dialogue)
        VStack{
//            ForEach(vm.getPosts(word: wordArr[0]).wordInfo)
            ForEach(vm.wordInfo) { word in
                VStack(spacing: 10) {
                    Text(word.word)
                        .font(.body).bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .onAppear(perform: {
                            getWord(dialogue: dialogue.dialogue)
                        })
                    ForEach(word.meanings) { meaning in
                        Text("[\(meaning.partOfSpeech)] : \(meaning.definitions[0].definition)")
//                        Text(meaning.definitions[0].definition)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color(UIColor.systemGray2))
//                        ForEach(meaning.definitions) { definition in
//                            Text("\(definition.definition) / ")
//                                .foregroundColor(Color(UIColor.systemGray2))
//                        }
                    }
//                    Text(result)
                }
                .frame(width: avaliableWidth, alignment: .leading)
                .padding()
            }
            /*
            ForEach(vm.wordInfo) { word in
                VStack(spacing: 10) {
                    Text(word.word)
                        .font(.body).bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ForEach(word.meanings) { meaning in
                        Text("[\(meaning.partOfSpeech)] : \(meaning.definitions[0].definition)")
//                        Text(meaning.definitions[0].definition)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color(UIColor.systemGray2))
//                        ForEach(meaning.definitions) { definition in
//                            Text("\(definition.definition) / ")
//                                .foregroundColor(Color(UIColor.systemGray2))
//                        }
                    }
//                    Text(result)
                }
                .frame(width: avaliableWidth, alignment: .leading)
                .padding()
            }*/
        }
    }
}

struct ModalWordView_Previews: PreviewProvider {
    static var previews: some View {
        ModalWordView(
            avaliableWidth: .constant(350),
            dialogue: DialogueData.sampleData[1]
        )
    }
}
