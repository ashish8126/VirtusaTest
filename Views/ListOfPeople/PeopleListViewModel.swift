//
//  PeopleListViewModel.swift
//  VirtusaTest
//
//  Created by Preeti Dhankar on 27/10/22.
//

import Foundation

class PeopleListViewModel {
    
    var tableViewData = Dynamic([PeopleData]())
    
    func getPeopleList() {
        NetworkLayer.getPeopleList { result in
            switch result {
            case .failure(let error):
                print("Error \(error.localizedDescription)")
            case .success(let data):
                if data.count == 0 {
                    print("Error")
                } else {
                    self.tableViewData.value = data
                }
            }
        }
    }
    
}
