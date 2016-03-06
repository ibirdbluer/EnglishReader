//
//  CollectionViewController.swift
//  EnglishReader
//
//  Created by Gregory Qian on 3/3/16.
//  Copyright © 2016 Gregory Qian. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    // MARK: - Life Circle
    var wordArray = [TextObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textModel = TextModel()
        wordArray = textModel.separateContentToWordArray()
        
//        print("\(wordArray)")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private let reuseIdentifier = "WordCell"
    
    // MARK: - UICollectionViewDataSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return wordArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! WordCell
        
        var wordObject = wordArray[indexPath.row]
        cell.contentLabel.attributedText = wordObject.content
        cell.textObject = wordObject
        
        
        if let translateString = wordObject.dictionary where (wordObject.didAdd != true){
            wordObject.didAdd = true
            wordArray[indexPath.row] = wordObject

//            let image = TranslateImage()
//            image.imageFromString(translateString, attributes: nil, rect: cell.translateImage.frame)
            let imageModel = TextModel()
            let image = imageModel.imageFromString(translateString, attributes: nil, rect: cell.frame)
            let imageView = UIImageView(frame: cell.frame)
            imageView.image  = image
            imageView.contentMode = .Center
            collectionView.addSubview(imageView)
            
//            cell.translateImage.image = self.imageFromString(translateString, attributes: nil, rect: cell.translateImage.frame)
//            cell.translateImage.contentMode = .Center

//            let rect = cell.frame
//            
//            let translateLabel = UILabel(frame: rect)
//            translateLabel.backgroundColor = UIColor.redColor()
//            translateLabel.text = translateString
//            collectionView.addSubview(translateLabel)
//            print("------------------\(rect)")
        }
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {

        let caculaterLabel = UILabel()
        caculaterLabel.attributedText = wordArray[indexPath.row].content
        
        caculaterLabel.sizeToFit()
        
        let size = CGSize(width: caculaterLabel.frame.size.width + 20, height: caculaterLabel.frame.size.height + 20)
        
        return size
    }
    
    
    
    // MARK: - UICollectionViewDelegate

    
    // MARK: - Helper

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
