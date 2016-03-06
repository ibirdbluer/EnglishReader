//
//  TranslateImage.swift
//  EnglishReader
//
//  Created by Gregory Qian on 3/6/16.
//  Copyright © 2016 Gregory Qian. All rights reserved.
//

import UIKit

class TranslateImage: UIImage {
    
    override init() {
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    required convenience init(imageLiteral name: String) {
        self.init()
    }
    
    func imageFromString(string: String, attributes:[String : AnyObject]?, rect: CGRect) -> UIImage {
        
        //Setup the image context using the passed image.
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0);
        
        //Setups up the font attributes that will be later used to dictate how the text should be drawn
        let textFontAttributes = [
            //            NSFontAttributeName: textFont,
                        NSForegroundColorAttributeName: UIColor.blackColor(),
        ]
        
        //Now Draw the text into an image.
        
        string.drawInRect(rect, withAttributes: textFontAttributes)
        
        
        // Create a new image out of the images we have created
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // End the context now that we have the image we need
        UIGraphicsEndImageContext()
        
        //And pass it back up to the caller.
        return newImage
    }
}