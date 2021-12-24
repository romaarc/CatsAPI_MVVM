//
//  NetworkServiceProtocol.swift
//  CatsAPI_MVVM
//
//  Created by Roman Gorshkov on 23.12.2021.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchBreeds(with params: BreedsURLParameters, and completion: @escaping (Result<Response, Error>) -> Void)
}
