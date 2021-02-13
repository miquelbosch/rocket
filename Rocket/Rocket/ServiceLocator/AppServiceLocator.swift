//
//  AppCoordinator.swift
//  Rocket
//
//  Created by Miquel Bosch on 13/02/2021.
//

import UIKit
import RocketLogic

final class AppServiceLocator {

    // MARK: - Variables
    private(set) lazy var appLogicServiceLocator = RocketLogicServiceLocator(navigationController: navigationController)
    private(set) lazy var navigationController: UINavigationController = {
        return UINavigationController()
    }()
}
