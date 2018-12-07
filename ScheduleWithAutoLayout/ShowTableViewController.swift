//
//  ShowTableViewController.swift
//  Schedule
//
//  Created by Tuong Pham on 5/12/18.
//  Copyright © 2018 Tuong Pham. All rights reserved.
//

import UIKit
import os.log

class ShowTableViewController: UITableViewController, NSURLConnectionDelegate {
    //Mark: Properties
    var shows = [Show]()
    var currentLimit = 7
    
    var loading = false
    let URL_SHOWS = "https://www.whatsbeef.net/wabz/guide.php?start=1"
    let DETAILS_IDENTIFIER = "showDetail"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load the sample data
        getJsonFromUrl()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return min(currentLimit, shows.count)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIndentifier = "ShowTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIndentifier, for: indexPath) as? ShowTableViewCell else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        if indexPath.row == currentLimit - 1 || indexPath.row == shows.count - 1 {
            self.loading = false
        }
        
        let show = shows[indexPath.row]
        
        
        cell.showDuration.text = show.startTime + " - " + show.endTime
        cell.showPic.image = UIImage(named: show.imageChannel)
        cell.showTitle.text = show.title
        cell.showRating.text = show.rating
        
        
        //Configure the cell...
        
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        switch (segue.identifier ?? "") {
        case DETAILS_IDENTIFIER:
            guard let showDetailViewController = segue.destination as? ShowViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            guard let selectedShowCell = sender as? ShowTableViewCell else {
                fatalError("Unexpected sender: \(sender ?? "")")
            }
            guard let indexPath = tableView.indexPath(for: selectedShowCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedShow = shows[indexPath.row]
            showDetailViewController.show = selectedShow
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
    }
    
    
    //MARK: Private Methods
    
    
    
    
    func getJsonFromUrl(){
        //creating a NSURL
        let url = NSURL(string: URL_SHOWS)
        
        //fetching the data from the url
        URLSession.shared.dataTask(with: (url as? URL)!, completionHandler: {(data, response, error) -> Void in
            
            
            do {
                let jsonres = try JSONDecoder().decode(JSONRead.self, from: data ?? "".data(using: .utf8)!)
                self.shows = jsonres.result
                
                
                OperationQueue.main.addOperation({
                    //calling another function after fetching the json
                    //it will show the names to label
                    self.loading = false
                    self.tableView.reloadData()
                    
                })
            } catch {
                print(error)
            }
            
        }).resume()
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let  height = scrollView.frame.size.height
        let contentYoffset = scrollView.contentOffset.y
        let distanceFromBottom = scrollView.contentSize.height - contentYoffset
        if distanceFromBottom < height {
            if loading == false {
                loading = true
                if (currentLimit < shows.count) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self.currentLimit *= 2
                        self.tableView.reloadData()
                    
                    }
                    
                }
                
            }
        }
    }
    
    func toggleHidden(_ label: UILabel) {
        var labelFrame = label.frame
        let curHeight = labelFrame.size.height
        labelFrame.size.height = (curHeight > 0) ? 0 : 20
        label.frame = labelFrame
    }
    
}
