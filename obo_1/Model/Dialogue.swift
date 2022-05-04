//
//  Sentence.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/05/04.
//

import Foundation

struct DialogueData: Codable, Identifiable {
    
    var id = UUID()
    var dialogue: String
    var mean: String
    var source: String
    
    enum CodingKeys: CodingKey {
        case dialogue
        case mean
        case source
    }
    
    init(id: UUID = UUID(), dialogue: String, mean: String, source: String) {
        self.id = id
        self.dialogue = dialogue
        self.mean = mean
        self.source = source
    }
}

extension DialogueData {
    static let sampleData: [DialogueData] =
    [
        DialogueData(
            dialogue: "I just wanted to take another look at you",
            mean: "그냥 다시 한번 널 보고 싶었어",
            source: "A star is born"),
        DialogueData(
            dialogue: "The greatest thing you'll ever learn is just to love and be loved in return",
            mean: "살면서 배우는 것 중 가장 위대한 것은 사랑하는 것과 사랑받는 거야",
            source: "Moulin Rouge"),
        DialogueData(
            dialogue: "It's only after we've lost everything that we're free to do anything",
            mean: "Fight Club",
            source: "우린 모든 것을 잃은 후에야 무슨 일이든 자유롭게 할 수 있다")
    ]
}

class ReadData: ObservableObject {
    @Published var dialogues = [DialogueData] ()
    
    init() {
        loadData()
    }
    
    func loadData() {
        guard let url = Bundle.main.url(
            forResource: "SentenceData",
            withExtension: "json")
        else{
            print("Json file not found")
            return
        }
        
        let data = try? Data(contentsOf: url)
        let dialogues = try? JSONDecoder().decode([DialogueData].self, from: data!)
        self.dialogues = dialogues!
        
        
    }
}

extension Bundle {
    func decode<T: Decodable>(filename: String, as type: T.Type) -> T {
        guard let url = self.url(forResource: filename, withExtension: nil) else {
            fatalError("번들에 \(filename)이 없습니다.")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("\(url)로부터 데이터를 불러올 수 없습니다.")
        }
        guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
            fatalError("데이터 복호화에 실패했습니다.")
        }
        return decodedData
    }
}
