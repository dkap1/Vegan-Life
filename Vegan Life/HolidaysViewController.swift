//
//  HolidaysViewController.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 01/04/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit

class HolidaysViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, HolidayHomeModelProtocol {

 var feedItems: NSArray = NSArray()
 var selectedHoliday: HolidayModel = HolidayModel()

    @IBOutlet weak var listHolidayTableView: UITableView!
    override func viewDidLoad() {
               super.viewDidLoad()

               navigationController?.navigationBar.prefersLargeTitles = true
               
               self.listHolidayTableView.delegate = self
               self.listHolidayTableView.dataSource = self
               
               let holidayModel = HolidayHomeModel()
               holidayModel.delegate = self
               holidayModel.downloadItems()
           }
           func itemsDownloaded(items: NSArray) {
               feedItems = items
               self.listHolidayTableView.reloadData()
               print(items)
           }
           func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
               return feedItems.count
           }
           func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               let cellIdentifier: String = "HolidayCell"
               let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
               let item: HolidayModel = feedItems[indexPath.row] as! HolidayModel
               myCell.textLabel!.text = item.name
               
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

    
