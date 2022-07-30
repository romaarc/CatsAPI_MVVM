//
//  AppDependency.swift
//  CatsAPI_MVVM
//
//  Created by Roman Gorshkov on 23.12.2021.
//

import Foundation

protocol HasDependencies {
    var catsNetworkService: NetworkServiceProtocol { get }
    var reachabilityService: ReachabilityProtocol { get }
    var catsViewModel: CatViewModelProtocol { get }
}

final class AppDependency {
    private let networkService: NetworkService
    private let reachability: Reachability
    private let catViewModel: CatViewModel

    init(networkService: NetworkService,
         reachability: Reachability,
         catViewModel: CatViewModel) {
        self.networkService = networkService
        self.reachability = reachability
        self.catViewModel = catViewModel
    }

    static func makeDefault() -> AppDependency {
        let reachability = Reachability()
        let networkService = NetworkService(reachability: reachability)
        let catViewModel = CatViewModel(catsNetworkService: networkService)
        return AppDependency(networkService: networkService,
                             reachability: reachability,
                             catViewModel: catViewModel)
    }
}

extension AppDependency: HasDependencies {
    var catsViewModel: CatViewModelProtocol {
        self.catViewModel
    }

    var catsNetworkService: NetworkServiceProtocol {
        return self.networkService
    }
    var reachabilityService: ReachabilityProtocol {
        return self.reachability
    }
}
