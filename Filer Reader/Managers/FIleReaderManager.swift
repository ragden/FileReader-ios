//
//  FIleReaderManager.swift
//  Filer Reader
//
//  Created by edgar paz moreno on 17/10/17.
//  Copyright © 2017 edgar paz moreno. All rights reserved.
//

import UIKit

class FIleReaderManager: NSObject {
    
    static func readFile(_ fromFile: String) -> String {
        let filePath = Bundle.main.url(forResource: fromFile, withExtension: "txt")
        do  {
            let fileContent = try String(contentsOf: filePath!, encoding: .utf8)
            
            return fileContent
        }
        catch {
            return ""
        }
    }

}
