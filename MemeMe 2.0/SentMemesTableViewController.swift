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
    
    //MARK: LifeCycle Methods
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        //Set Navigation Controller & Tab Bar Controller Hidden Properties
        navigationController?.isNavigationBarHidden = false
        tabBarController?.tabBar.isHidden = false
        
        //Reload Table with memes data
        tableView!.reloadData()
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        
        super.setEditing(editing, animated: animated)

        addButton.isEnabled = !editing

    }
    
    // MARK: - Table view data source

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
        navigationController?.pushViewController(memeDetail, animated: true)
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
        
        //This Method is used to unwind MemeEditor to this View Controller.
    }
    
}
