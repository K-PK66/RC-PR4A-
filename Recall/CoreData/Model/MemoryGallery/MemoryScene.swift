//
//  MemoryScene.swift
//  Recall
//
//  Created by jeffreyzfq on 2021/7/13.
//

import Foundation
import CoreData
import SwiftUI

final class MemoryScene: NSManagedObject, Identifiable, Comparable {
    @NSManaged var name: String
    @NSManaged var image: UIImage
    @NSManaged var albumName: String?
    @NSManaged var testSceneName: String
   // @NSManaged var model: USDZSceneEntity?
    
    public static func < (lhs: MemoryScene, rhs: MemoryScene) -> Bool {
        lhs.name < rhs.name
    }
    
}

extension MemoryScene {
    static func withName(_ name: String, context: NSManagedObjectContext) -> MemoryScene? {
        let request = fetchRequest(NSPredicate(format: "name = %@", name))
        let memoryScenes = (try? context.fetch(request)) ?? []
        if let memoryScene = memoryScenes.first {
            return memoryScene
        } else {
            return nil
        }
    }
    
    class func ofAlbum(_ name: String, context: NSManagedObjectContext) -> [MemoryScene]? {
        let request = fetchRequest(NSPredicate(format: "albumName = %@", name))
        let memoryScenes = (try? context.fetch(request)) ?? nil
        return memoryScenes
    }
    
    static func fetchRequest(_ predicate: NSPredicate) -> NSFetchRequest<MemoryScene> {
        let request = NSFetchRequest<MemoryScene>(entityName: "MemoryScene")
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        request.predicate = predicate
        return request
    }
    
    // MARK: - Insertion
    // default
    class func newScene(named name: String = "untitled", context: NSManagedObjectContext) {
        context.perform {
            let scene_ = MemoryScene(context: context)
            scene_.name = MemoryScene.nameUniqued(name: name, context: context)
            scene_.testSceneName = "room\(Int.random(in: 1...5))"
            scene_.image = UIImage(named: scene_.testSceneName)!
            //scene_.model = nil
            scene_.albumName = nil
            try? context.save()
        }
    }
    // with target album
    class func newScene(named name: String = "untitled", ofAlbum albumName: String, context: NSManagedObjectContext) {
        context.perform {
            let scene_ = MemoryScene(context: context)
            scene_.name = MemoryScene.nameUniqued(name: name, context: context)
            scene_.testSceneName = "room\(Int.random(in: 1...5))"
            scene_.image = UIImage(named: scene_.testSceneName)!
            //scene_.model = nil
            scene_.albumName = albumName
            try? context.save()
        }
    }
    
    
    // MARK: - Join album
    public func joinAlbum(_ name: String, context: NSManagedObjectContext) {
        if let album = MemoryAlbum.withName(name, context: context) {
            self.albumName = album.name
        }
    }
    
    // MARK: - Set name
    public func setName(newName name: String, context: NSManagedObjectContext) {
        self.name = MemoryScene.nameUniqued(name: name, context: context)
        try? context.save()
    }
    
    // MARK: - Set albumName
    public func setAlbumName(newName name: String, context: NSManagedObjectContext) {
        self.albumName = name
        try? context.save()
    }
    
    // MARK: - Deletion
    class func delete(_ name: String, context: NSManagedObjectContext) {
        if let scene_ = MemoryScene.withName(name, context: context) {
            context.delete(scene_)
            try? context.save()
        }
    }
    
    // MARK: - String uniqued
    static func nameUniqued(name: String, context: NSManagedObjectContext) -> String {
        var unique = name
        while MemoryScene.withName(unique, context: context) != nil {
            unique = unique.incremented
        }
        return unique
    }
}
