//
//  AppModel.swift
//  MemeMe 2.0
//
//  Created by SimranJot Singh on 22/10/16.
//  Copyright © 2016 SimranJot Singh. All rights reserved.
//

import UIKit

struct AppModel {
    
    static let defaultTopTextFieldText = "TOP"
    static let defaultBottomTextFieldText = "BOTTOM"
    static let fontsTableViewSegueIdentifier = "fontsTableView"
    static let fontsCellReuseIdentifier = "fontsCell"
    static let memesTableCellReuseIdentifier = "memesTableCell"
    static let memesCollectionCellReuseIdentifier = "memesCollectionCell"
    static let memeEditorStoryboardIdentifier = "MemeEditorViewController"
    static let memeDetailStoryboardIdentifier = "MemeDetailViewControler"
    static let memeDetailTableSegueIdentifier = "sentMemesTableShowDetail"
    static let memeDetailCollectionSegueIdentifier = "sentMemesCollectionShowDetail"
    static let memeEditorSegueIdentifier = "showMemeEditor"
    
    struct alert {
        
        static let alertTitle = "Options"
        static let alertMessage = ""
    }
    
    static let memeTextAttributes = [
        NSStrokeColorAttributeName : UIColor.black,
        NSForegroundColorAttributeName : UIColor.white,
        NSFontAttributeName: UIFont(name: "impact", size: 40)!,
        NSStrokeWidthAttributeName : -1.0
        ] as [String : Any]
    
    
    static let fontsAvailable = UIFont.familyNames
    static var currentFontIndex: Int = -1
    static var selectedFont: String = ""
    
}
