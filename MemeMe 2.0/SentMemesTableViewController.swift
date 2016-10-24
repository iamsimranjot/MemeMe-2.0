//
//  SentMemesTableViewController.swift
//  MemeMe 2.0
//
//  Created by SimranJot Singh on 22/10/16.
//  Copyright © 2016 SimranJot Singh. All rights reserved.
//

import UIKit

class SentMemesTableViewController: UITableViewController {
    
    //MARK: Properties & Outlets
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    var memeData: [Meme]!
    
    //MARK: LifeCycle Methods
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        //Get memes array from AppDelegate
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        memeData = appDelegate.memes
        
        //Set Navigation Controller & Tab Bar Controller Hidden Properties
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        
        //Reload Table with memes data
        tableView!.reloadData()
    }
    
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        
        super.setEditing(editing, animated: animated)
        
        if editing {
            
            addButton.isEnabled = false
            
        } else {
            
            addButton.isEnabled = true
        }
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Meme.count()
    }
    
    
    //MARK: Table View Delegates
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: AppModel.memesTableCellReuseIdentifier, for: indexPath) as! SentMemesTableViewCell
        
        let meme = Meme.getMemeStorage().memes[indexPath.row]
        
        cell.updateCell(meme)
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Get the object of MemeDetailViewController from the Storyboard
        let memeDetail = self.storyboard?.instantiateViewController(withIdentifier: AppModel.memeDetailStoryboardIdentifier) as! MemeDetailViewController
        
        //Pass the Meme Date
        memeDetail.meme = Meme.getMemeStorage().memes[indexPath.row]
        
        //Push to the scene
        self.navigationController?.pushViewController(memeDetail, animated: true)
        
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        switch editingStyle {
        case .delete:
        
            Meme.getMemeStorage().memes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
                    
        default:
            
            return
        }
    }
    
    @IBAction func unwindToSentMemeTable(unwindSegue: UIStoryboardSegue) {
    
    }
    
}
