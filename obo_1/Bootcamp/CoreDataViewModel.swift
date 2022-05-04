//
//  CoreDataViewModel.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/05/04.
//

import SwiftUI
import CoreData

class CoreDataViewModel: ObservableObject {
    
    @Environment(\.managedObjectContext) private var viewContext
    /*
    @FetchRequest(
        entity: SentenceEntity.entity(),
        sortDescriptors: [
            NSSortDescriptor(
                keyPath: \SentenceEntity.sentenceModified,
                ascending: true)
        ]
    )
    private var sentencesModified: FetchedResults<SentenceEntity>
     */
    
//    let container: NSPersistentContainer
    
    
    @Published var savedEntities: [SentenceEntity] = []
    /*
    init() {
        container = NSPersistentContainer(name: "SentencesContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error)")
            } else{
                print("Successfully loaded core data!")
            }
        }
        fetchSentences()
    }
    */
    
    func fetchSentences() {
        let request = NSFetchRequest<SentenceEntity>(entityName: "SentenceEntity")
        do {
            savedEntities = try viewContext.fetch(request)
            //try한 결과를 저장
        }catch let error {
            print("Error fetching. \(error)")
        }
        
    }
    func addSentence(text: String) {
        
        withAnimation {
            let newSentenceModified = SentenceEntity(context: viewContext)
            newSentenceModified.sentenceModified = text
            print("addSentence", text, newSentenceModified.sentenceModified ?? "")
            saveData(data: newSentenceModified.sentenceModified!)
        }
    }
    
    func deleteSentence(indexSet: IndexSet) {
        guard let index = indexSet.first else {return}
        let entity = savedEntities[index]
        viewContext.delete(entity)
//        saveData()
    }
    
    func saveData(data: String) {
        let sentenceEntity = SentenceEntity(context: viewContext)
        sentenceEntity.sentenceModified = data
        
        do {
            try viewContext.save()
            fetchSentences()
        }catch let error {
            print("Error saving. \(error)")
            //저장을 누를때마다 published 변수를 다시 업데이트 해야함 -> 가장 간단한 방법이 fetchSentences를 다시 호출하는 것
        }
        
    }
    
}

