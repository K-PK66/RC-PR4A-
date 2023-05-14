//
//  LocalFileManager.swift
//  Recall
//
//  Created by jeffreyzfq on 2021/9/19.
//

import SwiftUI
import SceneKit

class LocalFileManager {
    static let instance = LocalFileManager()
    
    let sceneFolderName = "3dSceneObjects"
    let imageFolderName = "images"
    
    init() {
        creatFolderForSceneObjectIfNeeded()
    }
    
    private func creatFolderForSceneObjectIfNeeded() {
        guard
            let path = FileManager
                .default
                .urls(for: .documentDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(sceneFolderName)
                .path
        else {
            return
        }
        
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
                
                // debug
                print("Successfully creating folder for scene objects.")
            } catch let error {
                print("Error creating folder for scene objects. \(error)")
            }
        }
    }
    
    private func creatFolderForImagesIfNeeded() {
        guard
            let path = FileManager
                .default
                .urls(for: .documentDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(imageFolderName)
                .path
        else {
            return
        }
        
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
                
                // debug
                print("Successfully creating folder for images.")
            } catch let error {
                print("Error creating folder for images. \(error)")
            }
        }
    }
    
    // MARK: - Scene Objects
    private func getPathForSceneObject(name: String) -> URL? {
        guard
            let path = FileManager
                .default
                .urls(for: .documentDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(sceneFolderName)
                .appendingPathComponent("\(name).ply")
        else {
            print("Error getting scene object path.")
            return nil
        }
        return path
    }
    
    func getObjectScene(url path: URL) -> SCNScene? {
        do {
            let scene1 = try SCNScene(url: path, options: nil)
            //print("successfully trasformed ply to")
            return scene1
        } catch let error {
            print("Error converting ply to SCNScene. \(error)")
            return nil
        }
    }
    
    func getAllSceneObjects() -> [String : URL] {
        var sceneObjects = [String : URL]()
        guard
            let path = FileManager
                .default
                .urls(for: .documentDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(sceneFolderName)
        else {
            print("Error getting all scene objects.")
            return sceneObjects
        }
        
        do {
            let urls = try FileManager.default.contentsOfDirectory(at: path, includingPropertiesForKeys: .none, options: .producesRelativePathURLs)
            for url in urls {
                sceneObjects[fileNameOf(url: url)] = url
            }
            return sceneObjects
            
        } catch let error {
            print("Error getting contents of scene object directory. \(error)")
            return sceneObjects
        }
    }
    
    func fileNameOf(url: URL) -> String {
        let fullName: String = FileManager.default.displayName(atPath: url.path)
        //return fullName
        var name: String = ""
        for character in fullName {
            if character == "." {
                break
            }
            name.append(character)
        }
        return name
    }
    
    func extensionNameOf(url: URL) -> String {
        let fullName: String = FileManager.default.displayName(atPath: url.path)
        var name: String = ""
        for character in fullName.reversed() {
            if character == "." {
                break
            }
            name.append(character)
        }
        return String(name.reversed())
    }
    
    
    func changeFileName(of url: URL, newName: String) {
        guard let newPath = FileManager
            .default
            .urls(for: .documentDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(sceneFolderName)
            .appendingPathComponent("\(newName).\(extensionNameOf(url: url))")
        else { return }
        try? FileManager.default.moveItem(at: url, to: newPath)
    }
    
    // MARK: - Images
    private func getPathForImage(name: String) -> URL? {
        guard
            let path = FileManager
                .default
                .urls(for: .documentDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(imageFolderName)
                .appendingPathComponent("\(name).jpg")
        else {
            print("Error getting image.")
            return nil
        }
        return path
    }
    
    func getImage(name: String) -> UIImage? {
        guard
            let path = getPathForImage(name: name)?.path,
            FileManager.default.fileExists(atPath: path)
        else {
            print("Error getting image path.")
            return nil
        }
        return UIImage(contentsOfFile: path)
    }
    
    func saveImage(image: UIImage, name: String) {
        guard
            let data = image.jpegData(compressionQuality: 1.0),
            let path = getPathForImage(name: name)
        else {
            print("Error getting image data.")
            return
        }
        
        do {
            try data.write(to: path)
            print("Success saving!")
            print(path)
        } catch let error {
            print("Error saving. \(error)")
        }
    }
    
}
