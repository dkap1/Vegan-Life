//
//  FinanceViewController.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 01/04/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit

class FinanceViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FinanceHomeModelProtocol {
   
    var feedItems: NSArray = NSArray()
    var selectedFinance: FinanceModel = FinanceModel()

    @IBOutlet weak var listFinanceTableView: UITableView!
   
   
        override func viewDidLoad() {
            super.viewDidLoad()

            navigationController?.navigationBar.prefersLargeTitles = true
            
            self.listFinanceTableView.delegate = self
            self.listFinanceTableView.dataSource = self
            
            let financeModel = FinanceHomeModel()
            financeModel.delegate = self
            financeModel.downloadItems()
        }
        func itemsDownloaded(items: NSArray) {
            feedItems = items
            self.listFinanceTableView.reloadData()
            print(items)
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return feedItems.count
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cellIdentifier: String = "FinanceCell"
            let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
           let item: FinanceModel = feedItems[indexPath.row] as! FinanceModel
          myCell.textLabel!.text = item.name
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
