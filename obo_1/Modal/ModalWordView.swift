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
    
    @State var word: String = ""
    
    init(word: String) {
        getPosts(word: word)

        print("dictionary model_______word")
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
//    @Binding var wordBinding: String
    @ObservedObject var vm = DictionaryModel(word: "")
    
    @State var result = ""
    @Binding var avaliableWidth: CGFloat

    let dialogue: DialogueData
    
    init(width: Binding<CGFloat>, dialogue: DialogueData, vm: DictionaryModel){
        self._avaliableWidth = width
        self.dialogue = dialogue
        self.vm = vm
    }
    
    var body: some View {
        VStack{
            
//            Text(vm.wordInfo[0].word)
            ForEach(vm.wordInfo) { wordInfo in
                VStack(spacing: 10) {
                    let _ = print("foreach modawordview")
//                    Text(wordInfo.word)
//                        .font(.body).bold()
//                        .frame(maxWidth: .infinity, alignment: .leading)
                    ForEach(wordInfo.meanings) { meaning in
                        Text("[\(meaning.partOfSpeech)] : \(meaning.definitions[0].definition)")
//                        Text(meaning.definitions[0].definition)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color.gray)
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
//            word: .constant("how"),
            width: .constant(350),
            dialogue: DialogueData.sampleData[1], vm: DictionaryModel(word: "how")
        )
    }
}
