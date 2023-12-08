//
//  WordEntity+CoreDataProperties.swift
//  LanguageTrainer2
//
//  Created by Macbook Air on 07.01.2022.
//
//

import Foundation
import CoreData


extension WordEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WordEntity> {
        return NSFetchRequest<WordEntity>(entityName: "WordEntity")
    }

    @NSManaged public var id: Int64
    @NSManaged public var text: String
    @NSManaged public var translate: String
}

extension WordEntity : Identifiable {

}
