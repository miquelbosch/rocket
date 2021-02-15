//
//  DetailViewController.swift
//  RocketLogic
//
//  Created by Miquel Bosch on 15/02/2021.
//

import UIKit

internal protocol DetailView: class {
    var title: String? { get set }
    func showImage(url: URL)
}

class DetailViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var rocketImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
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

        viewModel.view = self
        viewModel.setup()
    }
}

// MARK: - DetailView
extension DetailViewController: DetailView {

    func showImage(url: URL) {
        rocketImageView.load(url: url)
    }
}
