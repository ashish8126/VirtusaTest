//
//  MainViewController.swift
//  VirtusaTest
//
//  Created by Preeti Dhankar on 26/10/22.
//

import UIKit

class MainViewController: UIViewController {

    let viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func peopleAction(_ sender: UIButton) {
        let viewController = PeopleListViewController.instantiate(fromAppStoryboard: .Main)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    

    @IBAction func roomsAction(_ sender: UIButton) {
        let viewController = ListRoomsViewController.instantiate(fromAppStoryboard: .Main)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

