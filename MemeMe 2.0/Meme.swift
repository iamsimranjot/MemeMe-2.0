//
//  Meme.swift
//  MemeMe 2.0
//
//  Created by SimranJot Singh on 22/10/16.
//  Copyright © 2016 SimranJot Singh. All rights reserved.
//

import Foundation
import UIKit

struct Meme {
    
    var topText: NSString!
    var bottomText: NSString!
    let image: UIImage!
    var memedImage: UIImage!
    
    
    //Get a count of all Memes
    static func count() -> Int {
        return getMemeStorage().memes.count
    }
    
    //Locate the Meme storage location
    static func getMemeStorage() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
}



