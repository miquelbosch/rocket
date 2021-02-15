//
//  DetailCoordinator.swift
//  RocketLogic
//
//  Created by Miquel Bosch on 15/02/2021.
//

import UIKit

final public class DetailCoordinator {

    // MARK: - Propierties
    private let webServiceLocator: WebServiceLocator

    // MARK: - Initializers
    init(webServiceLocator: WebServiceLocator) {
        self.webServiceLocator = webServiceLocator
    }

    // MARK: - Public methods
    public func DetailViewController() -> UIViewController {
        return DetailViewController(viewModel: viewModel())
    }

    // MARK: - ViewModel
    private func viewModel() -> DetailViewModelProtocol {
        return DetailViewModel()
    }
}
