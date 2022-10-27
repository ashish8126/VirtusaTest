//
//  PeopleTableViewCell.swift
//  VirtusaTest
//
//  Created by Preeti Dhankar on 27/10/22.
//

import UIKit

class PeopleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var personAvatar: UIImageView!
    
    @IBOutlet weak var fullName: UILabel!
    
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var jobTitle: UILabel!
    
    @IBOutlet weak var favouriteColor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    let backgroundThread = DispatchQueue(label: "com.demo.thread1", qos: .background, attributes: .concurrent)
    
    func setupCell(imageURL: String,
                   fullName: String,
                   email: String,
                   jobTitle: String,
                   favouriteColor: String) {
        
        backgroundThread.async {
            do {
                if let urlImage = URL(string: imageURL) {
                    let imagedata = try Data(contentsOf: urlImage)
                    if let image = UIImage(data: imagedata) {
                        DispatchQueue.main.async {
                            self.personAvatar.contentMode = .scaleAspectFit
                            self.personAvatar.image = image
                        }
                    }
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }
        self.fullName.text = "Name \(fullName)"
        self.email.text = "Email \(email)"
        self.jobTitle.text = "Job Title \(jobTitle)"
        self.favouriteColor.text = "Favourite Color \(favouriteColor)"
        
    }

}
