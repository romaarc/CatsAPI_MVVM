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
    let temperament: String?
    let image: Image?
    let dogFriendly: Int?
    let energyLevel: Int?
    let healthIssues: Int?
    let adaptability: Int?
    let affectionLevel: Int?
    let grooming: Int?
    let intelligence: Int?
    let sheddingLevel: Int?
    let socialNeeds: Int?
    let strangerFriendly: Int?
    let vocalisation: Int?
    
    private enum CodingKeys: String, CodingKey {
        case id, name, origin, description, temperament,
             image, adaptability, grooming, intelligence, vocalisation
        case childFriendly = "child_friendly",
             dogFriendly = "dog_friendly",
             energyLevel = "energy_level",
             healthIssues = "health_issues",
             affectionLevel = "affection_level",
             sheddingLevel = "shedding_level",
             socialNeeds = "social_needs",
             strangerFriendly = "stranger_friendly"
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
