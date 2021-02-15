//
//  RocketsListCoordinator.swift
//  RocketLogic
//
//  Created by Miquel Bosch on 13/02/2021.
//

import UIKit

final public class RocketsListCoordinator {

    // MARK: - Propierties
    private let webServiceLocator: WebServiceLocator

    // MARK: - Initializers
    init(webServiceLocator: WebServiceLocator) {
        self.webServiceLocator = webServiceLocator
    }

    // MARK: - Public methods
    public func viewController() -> UIViewController {
        return RocketListViewController(viewModel: viewModel())
    }

    // MARK: - ViewModel
    private func viewModel() -> RocketListViewModelProtocol {

        return RocketListViewModel(repository: repository())
    }

    // MARK: - Repository
    private func repository() -> RocketListRepositoryProtocol {
        return RocketListRepository(webService: webServiceLocator.webService)
    }
}
