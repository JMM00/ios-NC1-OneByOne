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
            dialogue: "I just wanted to take another look at you.",
            mean: "그냥 다시 한번 널 보고 싶었어",
            source: "A star is born"),
        DialogueData(
            dialogue: "The greatest thing you'll ever learn is just to love and be loved in return",
            mean: "살면서 배우는 것 중 가장 위대한 것은 사랑하는 것과 사랑받는 거야",
            source: "Moulin Rouge"),
        DialogueData(
            dialogue: "It's only after we've lost everything that we're free to do anything",
            mean: "우린 모든 것을 잃은 후에야 무슨 일이든 자유롭게 할 수 있다",
            source: "Fight Club"),
        DialogueData(
            dialogue: "It is not our abilities that show what we truly are, it is our choices",
            mean: "우리가 진정 무엇인지 보여주는 것은 우리의 능력이 아니라 우리가 만드는 선택이다",
            source: "Harry Potter"),
        DialogueData(
            dialogue: "The past can hurt, but you can either run from it, or learn from it",
            mean: "과거는 아플 수 있어, 하지만 과거로부터 도망갈 수도 있고 배울 수도 있어",
            source: "Lion King"),
        DialogueData(
            dialogue: "If we didn't do what we loved, we wouldn't exist",
            mean: "만약 우리가 사랑하지 않았다면 우리는 존재도 하지 않았을 거야",
            source: "Adonis"),
        DialogueData(
            dialogue: "At some point you've got to decide for yourself who you gonna be. Can't let nobody make that decision for you",
            mean: "어떤 순간에는 네가 무엇이 되고 싶은지 너 스스로 결정해야 해. 그때는 그 누구도 널 대신해서 결정해 줄 수는 없어",
            source: "Moonlight"),
        DialogueData(
            dialogue: "Every man dies, not every man really lives",
            mean: "모든 사람은 죽지만 모든 사람이 실제로 사는 것은 아니야",
            source: "Braveheart"),
        DialogueData(
            dialogue: "The best love is the kind that awakens the soul and makes us reach for more, that plants a fire in our hearts and brings peace to our minds. And that's what you've given me. That's what I'd hoped to give you forever",
            mean: "최고의 사랑이란 영혼을 깨우고, 더 많은 것을 위해 손을 뻗으며 마음속에 불을 심고 마음의 평화를 가져다주는 것이에요. 그것이 내가 당신에게 평생 주고 싶었던 것이에요",
            source: "The Notebook"),
        DialogueData(
            dialogue: "Ideals are peaceful, history is violent",
            mean: "이상은 평화롭고 역사는 폭력적이야",
            source: "Don Collier"),
        DialogueData(
            dialogue: "A boy's best friend is his mother",
            mean: "남자아이의 가장 친한 친구는 그의 어머니야",
            source: "Psycho"),
        DialogueData(
            dialogue: "There's no place like home",
            mean: "어딜 가든 집 같은 곳은 없어",
            source: "The Wizard of Oz"),
        DialogueData(
            dialogue: "I don't regret the things I've done, but those I did not do",
            mean: "내가 한 일들을 후회하진 않지만, 하지 않은 일들은 후회해",
            source: "Empire Records"),
        DialogueData(
            dialogue: "All we have to decide is what to do with the time that is given to us",
            mean: "우리가 결정해야 하는 것은 우리에게 주어진 지간을 어떻게 사용할 것인가 그뿐이야",
            source: "Lord of the rings"),
        DialogueData(
            dialogue: "What we do in life echoes in eternity",
            mean: "우리가 살면서 하는 것은 영원히 반복된다",
            source: "Gladiator"),
        DialogueData(
            dialogue: "Being Human is a condition which requires an anesthetic",
            mean: "인간이라는 병, 이것에는 마취제가 항상 필요한 법이야",
            source: "Bohemian Rhapsody"),
        DialogueData(
            dialogue: "Just because something works doesn't mean it can't be improved",
            mean: "어떤 것이 효과가 있다고 해서 개선될 수 없다는 게 아니야",
            source: "Black Panther"),
        DialogueData(
            dialogue: "If I'm black enough and if I'm not white enough then tell me what am I",
            mean: "충분한 흑인이나 충분하지 않은 백인이라면, 내가 뭔지 말해줘",
            source: "Green Book"),
        DialogueData(
            dialogue: "The best way to guarantee a loss is to quit",
            mean: "손실을 보장하는 가장 좋은 방법은 그만하는 것이야",
            source: "Morgan Freeman"),
        DialogueData(
            dialogue: "We need to fail. We need to fail down here so we don't fail up there",
            mean: "우린 실패해야 해, 여기서 실패해야지만 거기서 실패하지 않아",
            source: "First man")
        
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
