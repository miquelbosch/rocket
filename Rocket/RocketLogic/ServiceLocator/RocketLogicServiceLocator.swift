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
    public private(set) lazy var rocketsListCoordinator = RocketsListCoordinator(webServiceLocator: webService)
    private(set) lazy var webService = WebServiceLocator()

    // MARK: - Initializers
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
