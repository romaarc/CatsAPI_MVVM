//
//  API.swift
//  CatsAPI_MVVM
//
//  Created by Roman Gorshkov on 23.12.2021.
//

import Foundation
enum API {
    static let main = "https://api.thecatapi.com/v1"
    static let key = "9301ae5b-3305-4ded-a1d2-408ecc7a3f42"
    static let headerKey = "x-api-key"
    
    enum TypeOf {
        static let breeds = "/breeds"
    }
}
