//
//  TextModel.swift
//  EnglishReader
//
//  Created by Gregory Qian on 3/3/16.
//  Copyright © 2016 Gregory Qian. All rights reserved.
//

import Foundation
import UIKit

class TextModel {
    
    var text: String?
    
    init() {
        
        self.text = self.readTextFromLocalTxtFile()
        
    }
    
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
    func separateContentToWordArray() -> [TextObject] {
        var wordObjectArray = [TextObject]()
        let wordArray = self.text?.componentsSeparatedByString(" ")
        for i in 0..<wordArray!.count {
            var textObject = TextObject()
            
            let content = wordArray![i]
            
            if i%10 == 0 {
                textObject.dictionary = "翻译翻译翻译\(i)"
                textObject.content = self.formatTextAttribute(content, type: "line")

            }else {
                textObject.content = self.formatTextAttribute(content, type: "normal")

            }
            wordObjectArray.append(textObject)
        }
        print("\(wordObjectArray)")
        return wordObjectArray
    }
    
    // format text attribute
    func formatTextAttribute(initialString: String, type: String) -> NSMutableAttributedString {
        
        let attributeString = NSMutableAttributedString(string: initialString)
        
        if type == "line" {
            attributeString.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.StyleSingle.rawValue, range: NSMakeRange(0, initialString.characters.count))
            
        }
        
        return attributeString
        
    }
    
    // generate image form string
    func imageFromString(string: String, attributes:[String : AnyObject]?, rect: CGRect) -> UIImage {
        
        let caculaterLabel = UILabel()
        caculaterLabel.attributedText = NSMutableAttributedString(string: string)
        
        caculaterLabel.sizeToFit()
        
        let size = CGSize(width: caculaterLabel.frame.size.width, height: caculaterLabel.frame.size.height)
        
        
        
        //Setup the image context using the passed image.
        UIGraphicsBeginImageContextWithOptions(size, false, 0);
        
        //Setups up the font attributes that will be later used to dictate how the text should be drawn
        let textFontAttributes = [
            //            NSFontAttributeName: textFont,
            NSForegroundColorAttributeName: UIColor.blackColor(),
        ]
        
        //Now Draw the text into an image.
        
        string.drawInRect(CGRect(x: 0, y: 0, width: size.width, height: size.height), withAttributes: textFontAttributes)
        
        
        // Create a new image out of the images we have created
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // End the context now that we have the image we need
        UIGraphicsEndImageContext()
        
        //And pass it back up to the caller.
        return newImage
    }
    
    
}
