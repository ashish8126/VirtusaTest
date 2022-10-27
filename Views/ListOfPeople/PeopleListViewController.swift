//
//  PeopleListViewController.swift
//  VirtusaTest
//
//  Created by Preeti Dhankar on 26/10/22.
//

import UIKit

class PeopleListViewController: UITableViewController {

    let viewModel = PeopleListViewModel()
    let cellId = "cell"
    
    var tableViewData: [PeopleData] = [PeopleData]() {
        didSet {
            DispatchQueue.main.async {
                self.peopleListTableView.reloadData()
            }
        }
    }
    
    @IBOutlet var peopleListTableView: UITableView!
    var activityIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupActivityIndicator()
        peopleListTableView.separatorStyle = .none
        viewModel.getPeopleList()
        viewModel.tableViewData.bind { (peopleData) in
            self.tableViewData = peopleData
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
        
        return self.tableViewData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId, for: indexPath) as! PeopleTableViewCell
        let fullName = (self.tableViewData[indexPath.row].firstName ?? "") + (self.tableViewData[indexPath.row].lastName ?? "")
        cell.setupCell(imageURL: self.tableViewData[indexPath.row].avatar ?? "",
                       fullName: fullName,
                       email: self.tableViewData[indexPath.row].email ?? "",
                       jobTitle: self.tableViewData[indexPath.row].jobtitle ?? "",
                       favouriteColor: self.tableViewData[indexPath.row].favouriteColor ?? "")
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
