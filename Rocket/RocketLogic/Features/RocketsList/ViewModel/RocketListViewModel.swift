//
//  RocketListViewModel.swift
//  RocketLogic
//
//  Created by Miquel Bosch on 15/02/2021.
//

import Foundation

internal protocol RocketListViewModelProtocol: class {

    var view: RocketListView? { get set }
    func loadView()
    func fetchRockets()
}

final class RocketListViewModel {

    // MARK: - Propierties
    let repository: RocketListRepositoryProtocol

    weak var view: RocketListView?

    // MARK: - Initializers
    init(repository: RocketListRepositoryProtocol) {
        self.repository = repository
    }
}

extension RocketListViewModel: RocketListViewModelProtocol {

    func loadView() {

        view?.title = "rocket_app_name".localize
        view?.showLoading()
        fetchRockets()
    }

    func fetchRockets() {
        repository.rocketList { [weak self] result in
            debugPrint(result)

            guard let `self` = self else { return }
            switch result {
            case .success(let rockets):
                print(rockets)
                self.view?.hideLoading()
                self.view?.showError(type: .general)
            case .failure(let error):
                print(error.localizedDescription)
                self.view?.hideLoading()
                self.view?.showError(type: .general)
            }
        }
    }
}
