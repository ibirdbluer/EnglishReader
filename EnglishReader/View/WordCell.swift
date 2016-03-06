//
//  WordCell.swift
//  EnglishReader
//
//  Created by Gregory Qian on 3/5/16.
//  Copyright © 2016 Gregory Qian. All rights reserved.
//

import UIKit

class WordCell: UICollectionViewCell {
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var translateImage: UIImageView!
    
    let TextLabelSidePadding: CGFloat = 8.0

    var textObject = TextObject()
    
    
//    init() {
//        super.init(frame: CGRect.zero)
//    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
//        let image = TranslateImage()
//        if let text = contentLabel.text {
//            image.imageFromString(text, attributes: nil, rect: contentLabel.frame)
//        }
        
    }
    
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
////        containerView.frame = contentView.bounds
////        let textLabelFrame = CGRectInset(containerView.bounds, TextLabelSidePadding, TextLabelSidePadding)
//        
//        contentLabel.frame = CGRect(x: 0, y: 0, width: contentLabel.frame.size.width, height: contentLabel.frame.size.height)
////        self.contentLabel.drawTextInRect(CGRect(x: 0, y: 0, width: self.contentLabel.frame.size.width, height: self.contentLabel.frame.size.height))
//
//    }
    
//    // MARK: - Helper
//    
//    func imageFromString(string: String, attributes:[String : AnyObject]?, rect: CGRect) -> UIImage {
//        
//        //Setup the image context using the passed image.
//        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0);
//        
//        //Setups up the font attributes that will be later used to dictate how the text should be drawn
//        let textFontAttributes = [
//            NSForegroundColorAttributeName: UIColor.blackColor(),
//        ]
//        
//        //Now Draw the text into an image.
//        
//        string.drawInRect(rect, withAttributes: textFontAttributes)
//        
//        
//        // Create a new image out of the images we have created
//        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
//        
//        // End the context now that we have the image we need
//        UIGraphicsEndImageContext()
//        
//        //And pass it back up to the caller.
//        return newImage
//    }
    
}
