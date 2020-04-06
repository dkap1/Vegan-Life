//
//  GroceryViewController.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 01/04/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import UIKit

class GroceryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, GroceryHomeModelProtocol {

 var feedItems: NSArray = NSArray()
 var selectedGrocery: GroceryModel  = GroceryModel()

    @IBOutlet weak var listGroceryTableView: UITableView!
    
    override func viewDidLoad() {
              super.viewDidLoad()

              navigationController?.navigationBar.prefersLargeTitles = true
              
              self.listGroceryTableView.delegate = self
              self.listGroceryTableView.dataSource = self
              
              let groceryModel = GroceryHomeModel()
              groceryModel.delegate = self
              groceryModel.downloadItems()
          }
          func itemsDownloaded(items: NSArray) {
              feedItems = items
              self.listGroceryTableView.reloadData()
              print(items)
          }
          func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
              return feedItems.count
          }
          func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
              let cellIdentifier: String = "GroceryCell"
            
              let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
                    let item: GroceryModel = self.feedItems[indexPath.row] as! GroceryModel
                    myCell.textLabel!.text = item.name
                 
               
            
                    
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

