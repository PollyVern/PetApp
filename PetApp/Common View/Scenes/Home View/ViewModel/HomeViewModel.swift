//
//  HomeViewModel.swift
//  PetApp
//
//  Created by Polina Belovodskaya on 27.01.2025.
//

import Combine

protocol HomeViewModelDelegate: AnyObject {

}

protocol HomeViewModelProtocol {
    var delegate: HomeViewModelDelegate? { get set }
}

class HomeViewModel: ObservableObject {

    // delegate
    weak var delegate: HomeViewModelDelegate?

    init() {

    }

}

// MARK: - Self protocol
extension HomeViewModel: HomeViewModelProtocol {

}

// MARK: - Private extension
private extension HomeViewModel {

}
