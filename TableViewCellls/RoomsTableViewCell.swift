//
//  RoomsTableViewCell.swift
//  VirtusaTest
//
//  Created by Preeti Dhankar on 27/10/22.
//

import UIKit

class RoomsTableViewCell: UITableViewCell {

    @IBOutlet weak var baseView: UIView! {
        didSet {
            self.baseView.layer.cornerRadius = 10
            self.baseView.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var maxOccupancy: UILabel!
    @IBOutlet weak var roomId: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(roomId: String,
                   maxOccupancy: Int,
                   isOccupied: Bool) {
        self.roomId.text = "Room Number \(roomId)"
        self.maxOccupancy.text = "Max Occupancy \(maxOccupancy)"
        if isOccupied {
            self.baseView.backgroundColor = .red
        } else {
            self.baseView.backgroundColor = .green
        }
        
    }
    
    
}
