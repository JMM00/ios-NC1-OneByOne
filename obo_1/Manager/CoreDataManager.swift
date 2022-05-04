//
//  CoreDataManager.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/05/03.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentcontainer : NSPersistentContainer //핵심 데이터 초기화
    
    init() {
        persistentcontainer = NSPersistentContainer(name: "SentenceDataModel")
        persistentcontainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data Store failed \(error.localizedDescription)")
            }
        }
    }
    func updateSentence() {
        do {
            try persistentcontainer.viewContext.save()
        }catch {
            persistentcontainer.viewContext.rollback()
        }
    }
    func deleteSentence(sentence: Sentence) {
        persistentcontainer.viewContext.delete(sentence)
        
        do {
            try persistentcontainer.viewContext.save()
        }catch {
            persistentcontainer.viewContext.rollback()
            print("Failed to save content \(error)")
        }
    }
    func getAllSentences() -> [Sentence] {
        let fetchRequest: NSFetchRequest<Sentence> = Sentence.fetchRequest()
        
        do{
            return try persistentcontainer.viewContext.fetch(fetchRequest)
        }catch {
            return []
        }
    }
    
    func saveSentence(modifiedSentence: String) {
        let sentence = Sentence(context: persistentcontainer.viewContext)
        sentence.modifiedSentence = modifiedSentence
        
        do {
            try persistentcontainer.viewContext.save()
        }catch {
            print("Failed to save movie \(error)")
        }
    }
}
