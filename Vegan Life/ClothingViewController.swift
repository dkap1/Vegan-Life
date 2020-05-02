//
//  ClothingViewController.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 01/04/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit

class ClothingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelHomeClothingProtocol,
    UISearchBarDelegate, UISearchResultsUpdating{
   
    var feedItems = [ModelClothing]()
    var selectedClothing: ModelClothing = ModelClothing()
    var filteredClothing = [ModelClothing]()
    
    let searchController = UISearchController(searchResultsController: nil)
      

    
    @IBOutlet weak var listClothingTableView: UITableView!
    
   
        override func viewDidLoad() {
            super.viewDidLoad()

            navigationController?.navigationBar.prefersLargeTitles = true
            
            self.view.backgroundColor = UIColor.init(red: 254/255, green: 216/255, blue: 177/255, alpha: 1)
            self.listClothingTableView.backgroundColor = UIColor.init(red: 254/255, green: 216/255, blue: 177/255, alpha: 1)
            
            self.listClothingTableView.delegate = self
            self.listClothingTableView.dataSource = self
            
            let clothingModel = ModelHomeClothing()
            clothingModel.delegate = self
            clothingModel.downloadItems()
            
            
            filteredClothing = feedItems
                   
            searchController.searchResultsUpdater = self
            searchController.dimsBackgroundDuringPresentation = false
            definesPresentationContext = true
                   
            listClothingTableView.tableHeaderView = searchController.searchBar
               
            searchController.searchBar.scopeButtonTitles = ["All", "Mens", "Womens", "Accessories"]
            searchController.searchBar.delegate = self
            
                 
                   
            self.listClothingTableView.register(UITableViewCell.self, forCellReuseIdentifier: "ClothingCell")
            
            
            
        }
        func itemsDownloaded(items: NSArray) {
             feedItems = items as!  [ModelClothing]
            self.listClothingTableView.reloadData()
            print(items)
        }
    func applySearch(searchText: String, scope: String = "All"){
           if searchController.searchBar.text! == "" {
               filteredClothing = feedItems.filter{ feedItems in
                   let ClothingCat = (scope == "All") || (feedItems.subcategory == scope)
                   return ClothingCat
           }
           } else {
                   filteredClothing = feedItems.filter{ feedItems in
                       let ClothingCat = (scope == "All") || (feedItems.subcategory == scope)
                       return ClothingCat && feedItems.name!.lowercased().contains(searchText.lowercased())
                   }
               }
           self.listClothingTableView.reloadData()
           
       }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let selectedScope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        applySearch(searchText: searchController.searchBar.text!,scope: selectedScope)
    }
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        applySearch(searchText: searchController.searchBar.text!,scope: searchBar.scopeButtonTitles![selectedScope])
        
    }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return filteredClothing.count
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cellIdentifier: String = "ClothingCell"
            let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
            myCell.textLabel!.text = filteredClothing[indexPath.row].name
            myCell.backgroundColor = UIColor.init(red: 254/255, green: 216/255, blue: 177/255, alpha: 1)
            
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
