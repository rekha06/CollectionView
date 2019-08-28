//
//  VideoCollectionViewCell.swift
//  CollectionViewExample
//
//  Created by rekha on 27/08/19.
//  Copyright © 2019 Mindlogicx. All rights reserved.
//

import UIKit

class VideoCollectionViewCell: UICollectionViewCell {
     @IBOutlet weak var VideoImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
      
        // Initialization code
    }

    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}

