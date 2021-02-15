//
//  DetailCoordinator.swift
//  RocketLogic
//
//  Created by Miquel Bosch on 15/02/2021.
//

import UIKit

internal protocol DetailRouting {
    func displayDetail(rocket: Rocket)
}

final public class DetailCoordinator {

    // MARK: - Propierties
    private let navigationController: UINavigationController

    // MARK: - Initializers
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Public methods
    private func detailViewController(selected: Rocket) -> UIViewController {
        return DetailViewController(viewModel: viewModel(selected: selected))
    }

    // MARK: - ViewModel
    private func viewModel(selected: Rocket) -> DetailViewModelProtocol {
        return DetailViewModel(rocket: selected)
    }
}

extension DetailCoordinator: DetailRouting {

    func displayDetail(rocket: Rocket) {

        let rocketDetailViewController = detailViewController(selected: rocket)
        navigationController.pushViewController(rocketDetailViewController, animated: true)
    }
}
