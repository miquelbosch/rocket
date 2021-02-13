//
//  RocketLogicServiceLocator.swift
//  RocketLogic
//
//  Created by Miquel Bosch on 13/02/2021.
//

import UIKit

final public class RocketLogicServiceLocator {

    // MARK: - Propierties
    private let navigationController: UINavigationController

    // MARK: - Variables
    public private(set) lazy var rocketsListCoordinator = RocketsListCoordinator()

    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
