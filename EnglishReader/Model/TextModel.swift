//
//  TextModel.swift
//  EnglishReader
//
//  Created by Gregory Qian on 3/3/16.
//  Copyright © 2016 Gregory Qian. All rights reserved.
//

import Foundation

class TextModel {
    
    let text: String?
    
   
    
    // read data
    func readTextFromLocalTxtFile() -> String{
        let fileLocation = NSBundle.mainBundle().pathForResource("text", ofType: "txt")!
        let text : String
        do
        {
            text = try String(contentsOfFile: fileLocation)
        }
        catch
        {
            text = ""
        }
        
        return text
    }
    
    // deal with data for collection view controller
    
    
    
}
