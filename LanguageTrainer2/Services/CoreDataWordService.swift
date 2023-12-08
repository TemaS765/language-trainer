//
//  CoreDataWordRepository.swift
//  LanguageTrainer2
//
//  Created by Macbook Air on 07.01.2022.
//

import Foundation
import CoreData

final class CoreDataWordService: WordServiceProtocol
{
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Words")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Unresolved error \(error)")
            }
        }
        return container
    }()
    
    private func saveContext()
    {
        let context = persistentContainer.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror)")
            }
        }
    }
    
    func get(id: Int64) -> Word? {
        let fetchRequest = WordEntity.fetchRequest()
        let context = persistentContainer.viewContext;
        
        fetchRequest.predicate = NSPredicate.init(format: "id==\(id)")
        
        if let result = try? context.fetch(fetchRequest) {
            for entity in result {
                return Word(id: entity.id, text: entity.text, translate: entity.translate)
            }
        }
        return nil
    }
    
    func list() -> [Word] {
        var words:[Word] = []
        
        do {
            let entities = try persistentContainer.viewContext.fetch(WordEntity.fetchRequest())
            entities.forEach { entity in
                words.append(Word(id: entity.id, text: entity.text, translate: entity.translate))
            }
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror)")
        }
        return words
    }
    
    func add(_ item: Word) -> Void {
        let context = self.persistentContainer.viewContext
        let nsobject = WordEntity(context: context)
        nsobject.id = getNextId()
        nsobject.text = item.text
        nsobject.translate = item.translate
        saveContext()
    }
    
    private func getNextId() -> Int64 {
        let fetchRequest = WordEntity.fetchRequest()
        fetchRequest.fetchLimit = 1
        let indexSort = NSSortDescriptor.init(key: "id", ascending: false)
        fetchRequest.sortDescriptors = [indexSort]
        
        if let result = try? persistentContainer.viewContext.fetch(fetchRequest) {
            for entity in result {
                return entity.id + 1
            }
        }

        return 1
    }
    
    func delete(_ item: Word) -> Void {
        let fetchRequest = WordEntity.fetchRequest()
        let context = persistentContainer.viewContext;
        
        fetchRequest.predicate = NSPredicate.init(format: "id==\(item.id)")
        
        if let result = try? context.fetch(fetchRequest) {
            for entity in result {
                context.delete(entity)
            }
            saveContext()
        }
    }
    
    func edit(_ item: Word) -> Void {
        let fetchRequest = WordEntity.fetchRequest()
        let context = persistentContainer.viewContext;
        
        fetchRequest.predicate = NSPredicate.init(format: "id==\(item.id)")
        
        if let result = try? context.fetch(fetchRequest) {
            for entity in result {
                entity.text = item.text
                entity.translate = item.translate
                saveContext()
            }
        }
    }
    
    func findByText(_ text: String) -> Word? {
        let fetchRequest = WordEntity.fetchRequest()
        let context = persistentContainer.viewContext;
        
        fetchRequest.predicate = NSPredicate(format: "text like %@", text)
        if let entity = try? context.fetch(fetchRequest).first {
            return Word(id: entity.id, text: entity.text, translate: entity.translate);
        }
        
        return nil
    }
}
