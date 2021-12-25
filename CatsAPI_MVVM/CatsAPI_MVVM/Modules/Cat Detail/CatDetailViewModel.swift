//
//  CatDetailViewModel.swift
//  CatsAPI_MVVM
//
//  Created by Roman Gorshkov on 25.12.2021.
//

import Foundation

protocol CatDetailViewModelProtocol {
    var cat: Breed {get set}
}

class CatDetailViewModel: CatDetailViewModelProtocol {
    var cat: Breed
    
    init(cat: Breed) {
        self.cat = cat
    }
}
