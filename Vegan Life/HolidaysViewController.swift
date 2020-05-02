//
//  HolidaysViewController.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 01/04/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit

class HolidaysViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, HolidayHomeModelProtocol,
UISearchResultsUpdating, UISearchBarDelegate {

 var feedItems = [HolidayModel]()
 var selectedHoliday: HolidayModel = HolidayModel()
 var filteredHoliday = [HolidayModel]()
    
let searchController = UISearchController(searchResultsController: nil)

    @IBOutlet weak var listHolidayTableView: UITableView!
    override func viewDidLoad() {
               super.viewDidLoad()

               navigationController?.navigationBar.prefersLargeTitles = true
        
        self.view.backgroundColor = UIColor.init(red:177/255, green: 156/255, blue: 217/255, alpha: 1)
               
        self.listHolidayTableView.backgroundColor = UIColor.init(red:177/255, green: 156/255, blue: 217/255, alpha: 1)
        
               self.listHolidayTableView.delegate = self
               self.listHolidayTableView.dataSource = self
               
               let holidayModel = HolidayHomeModel()
               holidayModel.delegate = self
               holidayModel.downloadItems()
        
        
                   
               filteredHoliday = feedItems
                                 
                searchController.searchResultsUpdater = self
                searchController.dimsBackgroundDuringPresentation = false
                definesPresentationContext = true
                                 
                listHolidayTableView.tableHeaderView = searchController.searchBar
                             
                searchController.searchBar.scopeButtonTitles = ["All", "Hotel", "Adventure", "Beach", "Culture"]
                searchController.searchBar.delegate = self
                               
                                 
              self.listHolidayTableView.register(UITableViewCell.self, forCellReuseIdentifier: "HolidayCell")
        
           }
           func itemsDownloaded(items: NSArray) {
               feedItems = items as! [HolidayModel]
               self.listHolidayTableView.reloadData()
               print(items)
           }
    func applySearch(searchText: String, scope: String = "All"){
           if searchController.searchBar.text! == "" {
               filteredHoliday = feedItems.filter{ feedItems in
                   let HolidayCat = (scope == "All") || (feedItems.subcategory == scope)
                   return HolidayCat
           }
           } else {
                   filteredHoliday = feedItems.filter{ feedItems in
                       let HolidayCat = (scope == "All") || (feedItems.subcategory == scope)
                       return HolidayCat && feedItems.name!.lowercased().contains(searchText.lowercased())
                   }
               }
           self.listHolidayTableView.reloadData()
           
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
               return filteredHoliday.count
           }
           func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               let cellIdentifier: String = "HolidayCell"
               let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
               myCell.textLabel!.text = filteredHoliday[indexPath.row].name
               myCell.backgroundColor = UIColor.init(red:177/255, green: 156/255, blue: 217/255, alpha: 1)
                    
               
            
                    
             //  let item: HolidayModel = feedItems[indexPath.row] as! HolidayModel
             //  myCell.textLabel!.text = item.name
               
               return myCell
           }
           func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
                         selectedHoliday = feedItems[indexPath.row] as! HolidayModel
                         self.performSegue(withIdentifier: "TravelDetailSegue", sender: self)
                     }
                     override func prepare(for segue: UIStoryboardSegue, sender: Any?){
                      let TravelVC = segue.destination as! TravelDetailViewController
                        TravelVC.selectedHoliday = selectedHoliday
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

    
