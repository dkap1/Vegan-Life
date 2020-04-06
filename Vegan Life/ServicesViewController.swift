//
//  ServicesViewController.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 29/03/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit
import SwiftUI

class ServicesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, HomeModelProtocol {
    
    var feedItems: NSArray = NSArray()
    var selectedService: ServicesModel = ServicesModel()
    @IBOutlet weak var listTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
        
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        
        let homeModel = HomeModel()
        homeModel.delegate = self
        homeModel.downloadItems()
    }
    func itemsDownloaded(items: NSArray) {
        feedItems = items
        self.listTableView.reloadData()
        print(items)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedItems.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      
        let cellIdentifier: String = "BasicCell"
        let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        
            let item: ServicesModel = self.feedItems[indexPath.row] as! ServicesModel
            myCell.textLabel!.text = item.name
            
       
    
            
        
        
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

