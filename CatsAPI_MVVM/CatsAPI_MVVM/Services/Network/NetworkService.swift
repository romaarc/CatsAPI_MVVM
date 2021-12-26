//
//  NetworkService.swift
//  CatsAPI_MVVM
//
//  Created by Roman Gorshkov on 23.12.2021.
//

import Foundation

enum NetworkErrors: Error {
    case wrongURL
    case dataIsEmpty
    case decodeIsFail
    case noConnection
}

final class NetworkService {
    
    private let reachability: ReachabilityProtocol
    
    init(reachability: ReachabilityProtocol) {
        self.reachability = reachability
    }
    
    func baseRequest<T: Decodable>(request: URLRequest, completion: @escaping (Result<T, Error>) -> Void) {
        guard reachability.isConnectedToNetwork() else {
            completion(.failure(NetworkErrors.noConnection))
            return
        }
        
        guard let _ = request.url else {
            completion(.failure(NetworkErrors.wrongURL))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkErrors.dataIsEmpty))
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let decodedModel = try decoder.decode(T.self, from: data)
                completion(.success(decodedModel))
            } catch {
                    completion(.failure(NetworkErrors.decodeIsFail))
            }
            
        }.resume()
    }
}
