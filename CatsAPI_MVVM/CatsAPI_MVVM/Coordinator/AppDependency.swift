//
//  AppDependency.swift
//  CatsAPI_MVVM
//
//  Created by Roman Gorshkov on 23.12.2021.
//

import Foundation

protocol HasDependencies {
    //var rickAndMortyNetworkService: NetworkServiceProtocol { get }
    //var reachabilityService: ReachabilityProtocol { get }
    //var persistentProvider: PersistentProviderProtocol { get }
}

class AppDependency {
//    let networkService: NetworkService
//    let reachability: Reachability
//    let persistent: PersistentProvider
//
//    init(networkService: NetworkService,
//         reachability: Reachability,
//         persistent: PersistentProvider) {
//        self.networkService = networkService
//        self.reachability = reachability
//        self.persistent = persistent
//    }

    static func makeDefault() -> AppDependency {
//        let reachability = Reachability()
//        let networkService = NetworkService(customDecoder: JSONDecoderCustom(),
//                                            reachability: reachability)
//        let persistent = PersistentProvider()
//        return AppDependency(networkService: networkService,
//                             reachability: reachability,
//                             persistent: persistent)
        AppDependency()
    }
}

extension AppDependency: HasDependencies {
//    var persistentProvider: PersistentProviderProtocol {
//        return self.persistent
//    }
//
//    var rickAndMortyNetworkService: NetworkServiceProtocol {
//        return self.networkService
//    }
//    var reachabilityService: ReachabilityProtocol {
//        return self.reachability
//    }
}
