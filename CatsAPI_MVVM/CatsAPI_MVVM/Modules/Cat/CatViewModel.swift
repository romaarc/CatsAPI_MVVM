//
//  CatViewModel.swift
//  CatsAPI_MVVM
//
//  Created by Roman Gorshkov on 23.12.2021.
//

import Foundation

protocol CatViewModelProtocol {
    var catsCount: Int { get }
    var reload: (() -> ())? { get set }
    
    func cat(at index: Int) -> Breed
    func fetchBreeds()
    func viewModelForSelectedRow(at indexPath: IndexPath) -> CatDetailViewModelProtocol
}

class CatViewModel {
    private var cats: [Breed] = []
    private let catsNetworkService: NetworkServiceProtocol
    private var params = BreedsURLParameters(attach_breed: "",
                                             page: GlobalConstants.initialPage,
                                             limit: GlobalConstants.limit)
    private var isLoading = false
    
    var reload: (() -> ())?
    
    var catsCount: Int {
        cats.count
    }
    
    func cat(at index: Int) -> Breed {
        cats[index]
    }
    
    init(catsNetworkService: NetworkServiceProtocol) {
        self.catsNetworkService = catsNetworkService
    }
}

extension CatViewModel: CatViewModelProtocol {
    func fetchBreeds() {
        guard !isLoading else {
            return
        }
        isLoading = true
        catsNetworkService.fetchBreeds(with: params) { [weak self] result in
            guard let self = self else { return }
            self.isLoading = false
            switch result {
            case .success(let breeds):
                self.cats.append(contentsOf: breeds)
                self.params.page += 1
                self.reload?()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func viewModelForSelectedRow(at indexPath: IndexPath) -> CatDetailViewModelProtocol {
        CatDetailViewModel(cat: cat(at: indexPath.row))
    }
}
