//
//  SentMemesCollectionViewCell.swift
//  MemeMe 2.0
//
//  Created by Simranjot Singh on 23/10/16.
//  Copyright © 2016 SimranJot Singh. All rights reserved.
//

import UIKit

class SentMemesCollectionViewCell: UICollectionViewCell {
    
    //MARK: Outlets
    
    @IBOutlet weak var memedImage: UIImageView!
    
    //MARK: Custom Cell's Functions
    
    func updateCell(_ meme: Meme) {
        
        //update cell's view
        memedImage.image = meme.memedImage
    }
}
