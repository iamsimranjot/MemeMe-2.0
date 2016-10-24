//
//  MemeDetailViewController.swift
//  MemeMe 2.0
//
//  Created by Simranjot Singh on 23/10/16.
//  Copyright © 2016 SimranJot Singh. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {

    //MARK: Outlets & Properties
    
    @IBOutlet weak var memedImage: UIImageView!
    var meme: Meme! = nil
    
    //MARK: LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Hide Tab Bar Controller Here
        self.tabBarController?.tabBar.isHidden = true
        
        //Set the memed Image to show
        memedImage.image = meme.memedImage
    }

}
