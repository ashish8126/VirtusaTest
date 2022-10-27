//
//  NetworkLayer.swift
//  VirtusaTest
//
//  Created by Preeti Dhankar on 27/10/22.
//

import Foundation

public final class NetworkLayer: NSObject {
    
    enum HTTPMethod: String {
        case post = "POST"
        case get = "GET"
    }
    
    enum Endpoints: String {
        case people = "people"
        case rooms = "rooms"
    }
    
    static let shared = NetworkLayer()
    static let baseURL = "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/"
    
    typealias peopleResult = (_ peopleResult: Result<[PeopleData], Error>) ->Void
    
    typealias roomsResult = (_ roomsResult: Result<[RoomsData], Error>) ->Void
    
}
