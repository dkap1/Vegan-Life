//
//  ServicesViewController.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 29/03/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit


class ServicesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, HomeModelProtocol,
UISearchResultsUpdating, UISearchBarDelegate {
    
    var feedItems = [ServicesModel]()
    var filteredService = [ServicesModel]()
    var selectedService: ServicesModel = ServicesModel()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    @IBOutlet weak var listTableView: UITableView!
   

  

    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
        
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        
        let homeModel = HomeModel()
        homeModel.delegate = self
        homeModel.downloadItems()
        
        filteredService = feedItems
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        
        listTableView.tableHeaderView = searchController.searchBar
    
        searchController.searchBar.scopeButtonTitles = ["All", "Finance", "Clothing", "Travel", "Shopping"]
        searchController.searchBar.placeholder = "Search for a Service"
        searchController.searchBar.delegate = self
      
        
          self.listTableView.register(UITableViewCell.self, forCellReuseIdentifier: "BasicCell")
        
    }
    func itemsDownloaded(items: NSArray) {
        feedItems = items as!  [ServicesModel]
        self.listTableView.reloadData()
        print(items)
    }
    func applySearch(searchText: String, scope: String = "All"){
        if searchController.searchBar.text! == "" {
            filteredService = feedItems.filter{ feedItems in
                let serviceCat = (scope == "All") || (feedItems.category == scope)
                return serviceCat
        }
        } else {
                filteredService = feedItems.filter{ feedItems in
                    let serviceCat = (scope == "All") || (feedItems.category == scope)
                    return serviceCat && feedItems.name!.lowercased().contains(searchText.lowercased())
                }
            }
        self.listTableView.reloadData()
        
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
        return  filteredService.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      
        let cellIdentifier: String = "BasicCell"
        let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        
           
        myCell.textLabel!.text = filteredService[indexPath.row].name
        
            
       
    
            
        
        
       return myCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        selectedService = feedItems[indexPath.row] as! ServicesModel
        self.performSegue(withIdentifier: "allSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let allVC = segue.destination as! allServicesViewController
        allVC.selectedService = selectedService
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

