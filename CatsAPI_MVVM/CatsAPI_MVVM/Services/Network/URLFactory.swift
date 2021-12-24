//
//  URLFactory.swift
//  CatsAPI_MVVM
//
//  Created by Roman Gorshkov on 23.12.2021.
//

import Foundation

enum URLFactory {
    private static var baseURL: URL {
        return baseURLComponents.url!
    }
    private static let baseURLComponents: URLComponents = {
        let url = URL(string: API.main)!
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        urlComponents.queryItems = []
        return urlComponents
    }()
    
    static func getBreedsRequest(params: BreedsURLParameters) -> URLRequest {
        var urlComponents = URLFactory.baseURLComponents
        let paramsQueryItem = [
            URLQueryItem(name: "attach_breed", value: params.attach_breed),
            URLQueryItem(name: "page", value:  String(params.page)),
            URLQueryItem(name: "limit", value: String(params.limit))
        ]
        urlComponents.queryItems?.append(contentsOf: paramsQueryItem)
        var request = URLRequest(url: urlComponents.url!.appendingPathComponent(API.TypeOf.breeds))
        request.httpMethod = HTTPMethod.get.rawValue
        request.timeoutInterval = 30
        for header in HTTPHeader.default {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        return request
    }
}

enum HTTPHeader: Hashable {
    case apiKey
    var key: String {
        switch self {
        case .apiKey: return API.headerKey
        }
    }
    var value: String {
        switch self {
        case .apiKey: return API.key
        }
    }
    static var `default`: [HTTPHeader] {
        return [.apiKey]
    }
}

enum HTTPMethod: String {
    case get = "GET"
}
