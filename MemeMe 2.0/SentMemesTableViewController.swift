//
//  SentMemesTableViewController.swift
//  MemeMe 2.0
//
//  Created by SimranJot Singh on 22/10/16.
//  Copyright © 2016 SimranJot Singh. All rights reserved.
//

import UIKit

class SentMemesTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var memeData = (UIApplication.shared.delegate as!
        AppDelegate).memes
    
    //MARK: LifeCycle Methods
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return memeData.count
    }
    
    
    //MARK: Table View Delegates
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: AppModel.memesTableCellReuseIdentifier, for: indexPath) as! SentMemesTableViewCell
        
        let meme = memeData[indexPath.row]
        
        cell.updateCell(meme)
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
