//
//  GroceryViewController.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 01/04/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit

class GroceryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, GroceryHomeModelProtocol,
UISearchBarDelegate, UISearchResultsUpdating {

 var feedItems = [GroceryModel]()
 var selectedGrocery: GroceryModel  = GroceryModel()
 var filteredGrocery = [GroceryModel]()

 let searchController = UISearchController(searchResultsController: nil)
    
    @IBOutlet weak var listGroceryTableView: UITableView!
    
    override func viewDidLoad() {
              super.viewDidLoad()

              navigationController?.navigationBar.prefersLargeTitles = true
              
              self.listGroceryTableView.delegate = self
              self.listGroceryTableView.dataSource = self
              
              let groceryModel = GroceryHomeModel()
              groceryModel.delegate = self
              groceryModel.downloadItems()
        
        
              filteredGrocery = feedItems
                                      
              searchController.searchResultsUpdater = self
              searchController.dimsBackgroundDuringPresentation = false
              definesPresentationContext = true
                                      
              listGroceryTableView.tableHeaderView = searchController.searchBar
                                  
              searchController.searchBar.scopeButtonTitles = ["All", "Food"]
              searchController.searchBar.delegate = self
                                    
                                      
              self.listGroceryTableView.register(UITableViewCell.self, forCellReuseIdentifier: "HolidayCell")
        
        
          }
          func itemsDownloaded(items: NSArray) {
              feedItems = items as! [GroceryModel]
              self.listGroceryTableView.reloadData()
              print(items)
          }
    func applySearch(searchText: String, scope: String = "All"){
              if searchController.searchBar.text! == "" {
                  filteredGrocery = feedItems.filter{ feedItems in
                      let GroceryCat = (scope == "All") || (feedItems.subcategory == scope)
                      return GroceryCat
              }
              } else {
                      filteredGrocery = feedItems.filter{ feedItems in
                          let GroceryCat = (scope == "All") || (feedItems.subcategory == scope)
                          return GroceryCat && feedItems.name!.lowercased().contains(searchText.lowercased())
                      }
                  }
              self.listGroceryTableView.reloadData()
              
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
              return filteredGrocery.count
          }
          func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
              let cellIdentifier: String = "GroceryCell"
              let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
            myCell.textLabel!.text = filteredGrocery[indexPath.row].name
                 
               
            
                    
           //  let item: GroceryModel = feedItems[indexPath.row] as! GroceryModel
            //  myCell.textLabel!.text = item.name
              
              return myCell
          }
          func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
                                  selectedGrocery = feedItems[indexPath.row] as! GroceryModel
                                  self.performSegue(withIdentifier: "shoppingDetailsSegue", sender: self)
                              }
                              override func prepare(for segue: UIStoryboardSegue, sender: Any?){
                               let ShoppingVC = segue.destination as! ShoppingDetailsViewController
                                 ShoppingVC.selectedGrocery = selectedGrocery
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

