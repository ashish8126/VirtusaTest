//
//  RoomsResponseModel.swift
//  VirtusaTest
//
//  Created by Preeti Dhankar on 27/10/22.
//

import Foundation

struct RoomsData: Codable {
    var createdAt: String?
    var isOccupied: Bool?
    var maxOccupancy: Int?
    var id: String?
}
