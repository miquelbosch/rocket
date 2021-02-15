//
//  DetailViewController.swift
//  RocketLogic
//
//  Created by Miquel Bosch on 15/02/2021.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: - propierties
    private let viewModel: DetailViewModelProtocol

    // MARK: - Initializers
    init(viewModel: DetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
