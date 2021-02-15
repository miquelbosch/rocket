//
//  RocketsNavigationController.swift
//  RocketLogic
//
//  Created by Miquel Bosch on 13/02/2021.
//

import UIKit

public class RocketsNavigationController: UINavigationController {

    // MARK: - Status Bar Style
    public override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }

    // MARK: - LifeCycle
    public override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    // MARK: - Setup
    private func setup() {
        navigationBar.isTranslucent = true
        navigationBar.tintColor = .white
        navigationBar.barStyle = .default
        navigationBar.barTintColor = Colors.primaryColor.get
        navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }

}
