//
//  WordCountModel.swift
//  Filer Reader
//
//  Created by edgar paz moreno on 17/10/17.
//  Copyright © 2017 edgar paz moreno. All rights reserved.
//

import UIKit

class WordCountModel: NSObject {
    var datasource : [WordCount]
    
    
    override init() {
        datasource = Array()
    }
    func readFromFile(completion: @escaping () -> ()) {
        DispatchQueue.global(qos: .background).async {
            let fileContent = FIleReaderManager.readFile("inputText")
            self.processString(fileContent: fileContent)
            DispatchQueue.main.async {
                completion()
            }
        }

    }
    
    private func processString(fileContent: String) {
        let stringArray : [String] = fileContent.components(separatedBy: CharacterSet(charactersIn: " \n"))
        var positionArray : [String] = Array()
        datasource.removeAll()
        
        for string in stringArray {
            if (positionArray.contains(string.capitalized)) {
                let index : NSInteger = positionArray.index(of: string.capitalized)!
                let word = datasource[index]
                word.count = word.count + 1
            }
            else {
                let word = WordCount(word: string.capitalized, order: datasource.count)
                positionArray.append(string.capitalized)
                datasource.append(word)
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
