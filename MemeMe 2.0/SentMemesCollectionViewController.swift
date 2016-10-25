//
//  SentMemesCollectionViewController.swift
//  MemeMe 2.0
//
//  Created by SimranJot Singh on 22/10/16.
//  Copyright © 2016 SimranJot Singh. All rights reserved.
//

import UIKit

class SentMemesCollectionViewController: UICollectionViewController {
    
    //MARK: Properties & Outlets
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!

    override func viewDidLoad() {
        super.viewDidLoad()
                
        let space: CGFloat
        let dimension: CGFloat
        
        
        if (UIDeviceOrientationIsPortrait(UIDevice.current.orientation)) {
            space = 3.0
            dimension = (view.frame.size.width - (2 * space)) / 3 //3 per line
        } else {
            space = 1.0
            dimension = (view.frame.size.width - (1 * space)) / 5
        }
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Set Navigation Controller & Tab Bar Controller Hidden Properties
        navigationController?.isNavigationBarHidden = false
        tabBarController?.tabBar.isHidden = false
        
        collectionView?.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return Meme.count()
    }
    
    //MARK: UICollectionViews Delegates

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppModel.memesCollectionCellReuseIdentifier, for: indexPath) as! SentMemesCollectionViewCell
        
        let meme = Meme.getMemeStorage().memes[indexPath.item]
        
        cell.updateCell(meme)
        
        return cell
    
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //Get the object of MemeDetailViewController from the Storyboard
        let memeDetail = self.storyboard?.instantiateViewController(withIdentifier: AppModel.memeDetailStoryboardIdentifier) as! MemeDetailViewController
        
        //Pass the Meme Date
        memeDetail.meme = Meme.getMemeStorage().memes[indexPath.row]
        
        //Push to the scene
        navigationController?.pushViewController(memeDetail, animated: true)
    }
}
