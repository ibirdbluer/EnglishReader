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
    
    let TextLabelSidePadding: CGFloat = 8.0

    
    
    init() {
        super.init(frame: CGRect.zero)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }
    
    
//    func fittedSizeForConstrainedSize(size: CGSize) -> CGSize {
//        let textLabelConstrainedSize = CGSize(width: size.width - TextLabelSidePadding * 2.0, height: size.height - TextLabelSidePadding * 2.0)
//        let textLabelSize = contentLabel.sizeThatFits(textLabelConstrainedSize)
//        // The cell itself chooses its own size based on its content and constrains from the collection view
//        return CGSize(width: size.width, height: textLabelSize.height + TextLabelSidePadding * 2.0)
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        containerView.frame = contentView.bounds
//        let textLabelFrame = CGRectInset(containerView.bounds, TextLabelSidePadding, TextLabelSidePadding)
        
//        contentLabel.frame = CGRect(x: 0, y: 0, width: 1000, height: 30)
    }
    
}
