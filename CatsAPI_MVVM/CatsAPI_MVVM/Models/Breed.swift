//
//  Breed.swift
//  CatsAPI_MVVM
//
//  Created by Roman Gorshkov on 23.12.2021.
//

import Foundation

struct Breed: Decodable {
    let id: String?
    let name: String?
    let origin: String?
    let childFriendly: Int?
    let description: String?
    let image: Image?
    
    private enum CodingKeys: String, CodingKey {
        case id, name, origin, description, image
        case childFriendly = "child_friendly"
    }
}

struct Image: Decodable {
    let id: String?
    let width: Int?
    let height: Int?
    let url: String?
}

struct BreedsURLParameters {
    var attach_breed: String
    var page: Int
    var limit: Int
}
