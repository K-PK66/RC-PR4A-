//
//  MemoryAlbum.swift
//  Recall
//
//  Created by jeffreyzfq on 2021/7/12.
//

import Foundation
import CoreData
import Combine
import SwiftUI

final class MemoryAlbum: NSManagedObject, Identifiable, Comparable {
    @NSManaged var name: String
    @NSManaged var image: UIImage
    
    public static func < (lhs: MemoryAlbum, rhs: MemoryAlbum) -> Bool {
        lhs.name < rhs.name
    }
}


extension MemoryAlbum {
    static func withName(_ name: String, context: NSManagedObjectContext) -> MemoryAlbum? {
        let request = fetchRequest(NSPredicate(format: "name = %@", name))
        let memoryAlbums = (try? context.fetch(request)) ?? []
        if let memoryAlbum = memoryAlbums.first {
            return memoryAlbum
        } else {
            return nil
        }
    }
    
    static func fetchRequest(_ predicate: NSPredicate) -> NSFetchRequest<MemoryAlbum> {
        let request = NSFetchRequest<MemoryAlbum>(entityName: "MemoryAlbum")
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        request.predicate = predicate
        return request
    }
    
    
    
    
    // MARK: - Insertion
    class func newAlbum(named name: String = "untitled", context: NSManagedObjectContext) {
        context.perform {
            let album = MemoryAlbum(context: context)
            album.name = nameUniqued(name: name, context: context)
            album.image = UIImage(named: "room\(Int.random(in: 1...5))")!
            try? context.save()
        }
    }
    
    // MARK: - Set name
    public func setName(newName name: String, context: NSManagedObjectContext) {
        let name = MemoryAlbum.nameUniqued(name: name, context: context)
        if let scenes = MemoryScene.ofAlbum(self.name, context: context) {
            for scene_ in scenes {
                scene_.setAlbumName(newName: name, context: context)
            }
        }
        self.name = name
        try? context.save()
    }
    
    // MARK: - Deletion
    class func delete(_ name: String, context: NSManagedObjectContext) {
        if let album = MemoryAlbum.withName(name, context: context) {
            context.delete(album)
            try? context.save()
        }
    }
    
    // MARK: - String uniqued
    static func nameUniqued(name: String, context: NSManagedObjectContext) -> String {
        var unique = name
        while MemoryAlbum.withName(unique, context: context) != nil {
            unique = unique.incremented
        }
        return unique
    }
}



