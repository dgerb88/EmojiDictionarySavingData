//
//  EmojiController.swift
//  EmojiDictionary
//
//  Created by Dax Gerber on 10/23/23.
//

import Foundation

class EmojiController {
    
    static let shared = EmojiController()
    
    var emojis = [Emoji]()
    
    let jsonDecoder = JSONDecoder()
    let jsonEncoder = JSONEncoder()
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

    
    func saveData(emojis: [Emoji]) {
        let folderURL = documentsDirectory.appendingPathComponent("json_file").appendingPathExtension("json")
        if let encodedEmojis = try? jsonEncoder.encode(emojis) {
            try? encodedEmojis.write(to: folderURL, options: .noFileProtection)
        } else {
            print("Error")
        }
    }
    
    func retrieveData() -> [Emoji] {
        var returnEmojis = [Emoji]()
        let folderURL = documentsDirectory.appendingPathComponent("json_file").appendingPathExtension("json")
        if let retrievedData = try? Data(contentsOf: folderURL), let decodedEmojis = try? jsonDecoder.decode([Emoji].self, from: retrievedData) {
            returnEmojis = decodedEmojis
        } else {
            print("Error")
        }
        return returnEmojis
    }
    
    
    
}
