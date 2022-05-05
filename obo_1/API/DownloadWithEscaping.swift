//
//  DownloadWithEscaping.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/05/05.
//

import SwiftUI

class DownloadWithEscapingViewModel: ObservableObject {
    
    @State var standardUrl: String = "https://api.dictionaryapi.dev/api/v2/entries/en/"
    @State var result = ""
    @Published var wordInfo: [WordInfoElement] = []
    init() {
        getPosts()
    }
    
    func getPosts() {
        guard let url = URL(string: standardUrl + "just" )else{ return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data{
                let str = String(data: data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue)) ?? ""
                
                print("str____",str)
                
                let decoder = JSONDecoder()
                
                if let data = str.data(using: .utf8){
                    do {
                        let decodedResult = try decoder.decode([WordInfoElement].self, from: data)
                        print("decodedResult", decodedResult)
//                        guard let newPost = try? JSONDecoder().decode(WordInfoElement.self, from: data) else {return}
//                        print("newPost: ", newPost)
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
            
            /*
            guard let data = data else{
                print("데이터가 존재하지 않습니다.")
                return
            }
            guard error == nil else {
                print("오류: \(String(describing: error))")
                return
            }
            guard let response = response as? HTTPURLResponse else {
                print("잘못된 응답입니다.")
                return
            }
            guard response.statusCode >= 200 && response.statusCode < 300 else {
                print("Status Code는 2xx이 되야 합니다. 현재 Status Code는 \(response.statusCode) 입니다.")
                return
            }
            print("데이터 다운 성공적!!")
            print(data)
            
            let jsonString = String(data: data, encoding: .utf8)
            print(jsonString)
            
            guard let newPost = try? JSONDecoder().decode(WordInfoElement.self, from: data) else {return}
            
            DispatchQueue.main.async { [weak self] in
                self?.wordInfo.append(newPost)
            }
            
            let decoder = JSONDecoder()
            */
        }
        .resume()

    }
    
    
}
struct DownloadWithEscaping: View {
    
    @State var wordArr: [String]
    @StateObject var vm = DownloadWithEscapingViewModel()
    @State var result = ""
    
    
    
    func getResult(wordInfo: WordInfoElement){
        for i in wordInfo.meanings {
            result += i.definitions[0].definition
        }
    }
    
    var body: some View {
        let _ = print(vm.wordInfo.count)
//        Text(vm.wordInfo[0].word)
        ScrollView {
//
//            VStack(spacing: 10) {
//                Text(vm.wordInfo[0].word)
//                    .font(Font.title.bold())
//                ForEach(vm.wordInfo[0].meanings) { meaning in
//                    Text(meaning.partOfSpeech)
//                    ForEach(meaning.definitions) { definition in
//                        Text("\(definition.definition) / ")
//                            .foregroundColor(Color(UIColor.systemGray2))
//                    }
//                }
//            }
            
        
//            for i in vm.wordInfo.meanings {
//                result += i.definitions[0].definition
//            }
            
            ForEach(vm.wordInfo) { word in
                VStack(spacing: 10) {
                    Text(word.word)
                        .font(Font.title.bold())
                    ForEach(word.meanings) { meaning in
                        Text("[\(meaning.partOfSpeech)] : \(meaning.definitions[0].definition)")
//                        Text(meaning.definitions[0].definition)
                            .foregroundColor(Color(UIColor.systemGray2))
//                        ForEach(meaning.definitions) { definition in
//                            Text("\(definition.definition) / ")
//                                .foregroundColor(Color(UIColor.systemGray2))
//                        }
                    }
                    Text(result)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
             
             
        }
    }
}

struct DownloadWithEscaping_Previews: PreviewProvider {
    static var previews: some View {
        DownloadWithEscaping(wordArr: [])
    }
}
