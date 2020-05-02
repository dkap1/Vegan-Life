//
//  FinanceViewController.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 01/04/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit

class FinanceViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FinanceHomeModelProtocol,
UISearchBarDelegate, UISearchResultsUpdating {
   
    var feedItems = [FinanceModel]()
    var selectedFinance: FinanceModel = FinanceModel()
    var filteredFinance = [FinanceModel]()
       
    let searchController = UISearchController(searchResultsController: nil)
         

    @IBOutlet weak var listFinanceTableView: UITableView!
   
   
        override func viewDidLoad() {
            super.viewDidLoad()

            navigationController?.navigationBar.prefersLargeTitles = true
            
            self.view.backgroundColor = UIColor.init(red: 255/255, green: 127/255, blue: 127/255, alpha: 1)
            self.listFinanceTableView.backgroundColor = UIColor.init(red: 255/255, green: 127/255, blue: 127/255, alpha: 1)
            
            self.listFinanceTableView.delegate = self
            self.listFinanceTableView.dataSource = self
            
            let financeModel = FinanceHomeModel()
            financeModel.delegate = self
            financeModel.downloadItems()
            
            
            filteredFinance = feedItems
                          
            searchController.searchResultsUpdater = self
            searchController.dimsBackgroundDuringPresentation = false
            definesPresentationContext = true
                          
            listFinanceTableView.tableHeaderView = searchController.searchBar
                      
            searchController.searchBar.scopeButtonTitles = ["All", "Savings", "Pensions", "ISA"]
            searchController.searchBar.delegate = self
                        
                          
                   self.listFinanceTableView.register(UITableViewCell.self, forCellReuseIdentifier: "FinanceCell")
        }
        func itemsDownloaded(items: NSArray) {
            feedItems = items as! [FinanceModel]
            self.listFinanceTableView.reloadData()
            print(items)
        }
    func applySearch(searchText: String, scope: String = "All"){
           if searchController.searchBar.text! == "" {
               filteredFinance = feedItems.filter{ feedItems in
                   let FinanceCat = (scope == "All") || (feedItems.subcategory == scope)
                   return FinanceCat
           }
           } else {
                   filteredFinance = feedItems.filter{ feedItems in
                       let FinanceCat = (scope == "All") || (feedItems.subcategory == scope)
                       return FinanceCat && feedItems.name!.lowercased().contains(searchText.lowercased())
                   }
               }
           self.listFinanceTableView.reloadData()
           
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
            return filteredFinance.count
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cellIdentifier: String = "FinanceCell"
            let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
            myCell.textLabel!.text = filteredFinance[indexPath.row].name
            myCell.backgroundColor = UIColor.init(red: 255/255, green: 127/255, blue: 127/255, alpha: 1)
            return myCell
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
            selectedFinance = feedItems[indexPath.row] as! FinanceModel
            self.performSegue(withIdentifier: "financeDetailsSegue", sender: self)
        }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?){
         let financeVC = segue.destination as! FinanceDetailsViewController
         financeVC.selectedFinance = selectedFinance
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
