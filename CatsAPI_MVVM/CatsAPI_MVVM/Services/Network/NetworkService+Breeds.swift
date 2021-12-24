//
//  NetworkService+Breeds.swift
//  CatsAPI_MVVM
//
//  Created by Roman Gorshkov on 23.12.2021.
//

import Foundation
extension NetworkService: NetworkServiceProtocol {
    func fetchBreeds(with params: BreedsURLParameters, and completion: @escaping (Result<Response, Error>) -> Void) {
        let request = URLFactory.getBreedsRequest(params: params)
        self.baseRequest(request: request, completion: completion)
    }
}
