//
//  ClothingViewController.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 01/04/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit

class ClothingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelHomeClothingProtocol {
   
    var feedItems: NSArray = NSArray()
    var selectedClothing: ModelClothing = ModelClothing()
    @IBOutlet weak var listClothingTableView: UITableView!
    
   
        override func viewDidLoad() {
            super.viewDidLoad()

            navigationController?.navigationBar.prefersLargeTitles = true
            
            self.listClothingTableView.delegate = self
            self.listClothingTableView.dataSource = self
            
            let clothingModel = ModelHomeClothing()
            clothingModel.delegate = self
            clothingModel.downloadItems()
        }
        func itemsDownloaded(items: NSArray) {
            feedItems = items
            self.listClothingTableView.reloadData()
            print(items)
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return feedItems.count
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cellIdentifier: String = "ClothingCell"
            let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
            let item: ModelClothing = feedItems[indexPath.row] as! ModelClothing
            myCell.textLabel!.text = item.name
            
            return myCell
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
               selectedClothing = feedItems[indexPath.row] as! ModelClothing
               self.performSegue(withIdentifier: "clothingdetailSegue", sender: self)
           }
           override func prepare(for segue: UIStoryboardSegue, sender: Any?){
            let ClothingVC = segue.destination as! ClothingDetailsViewController
            ClothingVC.selectedClothing = selectedClothing
           }

        /*
        // MARK: - Navigation

        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }
        */

    }
