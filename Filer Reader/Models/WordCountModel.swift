//
//  WordCountModel.swift
//  Filer Reader
//
//  Created by edgar paz moreno on 17/10/17.
//  Copyright © 2017 edgar paz moreno. All rights reserved.
//

import UIKit

enum FileReaderOrder : Int {
    case AppearOrder = 0
    case Alphabetical = 1
    case MostAppear = 2
}

class WordCountModel: NSObject {
    var datasource : [WordCount]
    
    override init() {
        datasource = Array()
    }
    func readFromFile(completion: @escaping () -> ()) {
        DispatchQueue.global(qos: .background).async {
            let fileContent : String = FIleReaderManager.readFile("inputText")
            
            // purge trash characters
            var finalContent = fileContent.replacingOccurrences(of: ",", with: "")
            finalContent = finalContent.replacingOccurrences(of: ".", with: "")
            finalContent = finalContent.replacingOccurrences(of: ":", with: "")
            
            self.processString(fileContent: finalContent)
            DispatchQueue.main.async {
                completion()
            }
        }

    }
    
    func sortByAlphabetical(completion: @escaping () -> ()) {
        DispatchQueue.global(qos: .background).async {
            self.datasource = self.datasource.sorted(by: {$0.word < $1.word})
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func sortByMostAppearingWord(completion: @escaping () -> ()) {
        DispatchQueue.global(qos: .background).async {
            self.datasource = self.datasource.sorted(by: {$0.count > $1.count})
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func sortByAppearingOrder(completion: @escaping () -> ()) {
        DispatchQueue.global(qos: .background).async {
            self.datasource = self.datasource.sorted(by: {$0.order < $1.order})
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    // MARK: Private methods
    
    private func processString(fileContent: String) {
        let stringArray : [String] = fileContent.components(separatedBy: CharacterSet(charactersIn: " \n"))
        var positionArray : [String] = Array()
        datasource.removeAll()
        
        for string in stringArray {
            if string.characters.count > 0 {
                var word : WordCount
                if (positionArray.contains(string.capitalized)) {
                    let index : NSInteger = positionArray.index(of: string.capitalized)!
                    word = datasource[index]
                }
                else {
                    word = WordCount(word: string.capitalized, order: datasource.count)
                    positionArray.append(string.capitalized)
                    datasource.append(word)
                }
                word.count = word.count + 1
            }
        }
    }
}

class WordCount: NSObject {
    let word : String
    var count : NSInteger
    let order : NSInteger
    
    init(word: String, order: NSInteger) {
        self.word = word
        self.count = 0
        self.order = order
    }
}
