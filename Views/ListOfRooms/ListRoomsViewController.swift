//
//  ListRoomsViewController.swift
//  VirtusaTest
//
//  Created by Preeti Dhankar on 26/10/22.
//

import UIKit

class ListRoomsViewController: UITableViewController {

    @IBOutlet var roomsTableView: UITableView!
    
    let viewModel = ListRoomsViewModel()
    let cellId = "cell"
    
    var tableViewData = [RoomsData]() {
        didSet {
            DispatchQueue.main.async {
                self.roomsTableView.reloadData()
            }
        }
    }
    
    var activityIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActivityIndicator()
        roomsTableView.separatorStyle = .none
        viewModel.getRoomsData()
        viewModel.tableViewData.bind { (roomsData) in
            self.tableViewData = roomsData
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
            }
            
        }
        
    }
    
    private func setupActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .gray
        activityIndicator.frame = CGRect(x: self.view.center.x - 23,
                                         y: self.view.center.y - 23,
                                         width: 46,
                                         height: 46)
        activityIndicator.startAnimating()
        self.view.addSubview(activityIndicator)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.tableViewData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId, for: indexPath) as! RoomsTableViewCell
        
        cell.setupCell(roomId: self.tableViewData[indexPath.row].id ?? "", maxOccupancy: self.tableViewData[indexPath.row].maxOccupancy ?? 0, isOccupied: self.tableViewData[indexPath.row].isOccupied ?? false)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
