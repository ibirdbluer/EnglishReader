//
//  ViewController.swift
//  EnglishReader
//
//  Created by Gregory Qian on 2/24/16.
//  Copyright © 2016 Gregory Qian. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var theScrollView: UIScrollView!
    
    // Mark: - life circle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add locally formatted strings to paragraph
        let paraStyle = NSMutableParagraphStyle()
        paraStyle.firstLineHeadIndent = 15.0
        paraStyle.paragraphSpacingBefore = 10.0
        paraStyle.lineSpacing = 20.0
        
        let titleAttributes = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline), NSForegroundColorAttributeName: UIColor.purpleColor(), NSParagraphStyleAttributeName: paraStyle]
        

        
        // Apply paragraph styles to paragraph
//        para.addAttribute(NSParagraphStyleAttributeName, value: paraStyle, range: NSRange(location: 0,length: para.length))
        
        
//        let titleString = NSAttributedString(string: "Read all about it!", attributes: titleAttributes)

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
        
        
        let storage = NSTextStorage(string: text, attributes: titleAttributes)
        let layoutManager = NSLayoutManager()
        storage.addLayoutManager(layoutManager)
        
        var i = 0
        while true {
            let width = CGFloat(Int(self.view.frame.size.width) * i)
            let textContainer = NSTextContainer(size: CGSizeMake(self.view.frame.size.width, self.view.frame.size.height - 20))
            layoutManager.addTextContainer(textContainer)
            
            let theTextView = UITextView(frame: CGRectMake(width, 0, self.view.frame.size.width, self.view.frame.size.height), textContainer: textContainer)
            theTextView.delegate = self
//            theTextView.editable = true
            self.theScrollView.addSubview(theTextView)
            i++
            
            let range = layoutManager.glyphRangeForTextContainer(textContainer)
            if range.length + range.location == text.characters.count {
                break
            }
            
        }
        
        self.theScrollView.contentSize = CGSizeMake(self.view.frame.size.width * CGFloat(i), self.view.frame.size.height)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // Mark: - scroll view delegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x, 0)
    }


}

