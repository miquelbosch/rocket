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
    func showPrincipalInformation(rocket: Rocket, firstFlight: String)
}

class DetailViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var rocketImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var firstFlightTitleLabel: UILabel!
    @IBOutlet weak var firstFlightValue: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var countryValue: UILabel!

    @IBOutlet weak var heightContainerView: UIView!
    @IBOutlet weak var enginesConteinerView: UIView!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var heightValue: UILabel!
    @IBOutlet weak var enginesLabel: UILabel!
    @IBOutlet weak var enginesValue: UILabel!

    // MARK: - propierties
    private let viewModel: DetailViewModelProtocol

    // MARK: - DetailConstants
    private struct Constants {
        private init() {}
        static let duration: TimeInterval = 1.4
        static let delay: TimeInterval = 0
        static let delaySecondAnimation: TimeInterval = 0.6
        static let usingSpringWithDamping: CGFloat = 0.8
        static let initialSpringVelocity: CGFloat = 0.7
        static let options: UIView.AnimationOptions = .curveEaseInOut
        static let translationX: CGFloat = 0
        static let translationY: CGFloat = 80
        static let imageCornerRadius: CGFloat = 16
        static let cardCornerRadius: CGFloat = 16
    }

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
        roundCornerViews()
    }

    private func roundCornerViews() {
        rocketImageView.round(.bottomRight, radius: Constants.imageCornerRadius)
        heightContainerView.layer.cornerRadius = Constants.cardCornerRadius
        enginesConteinerView.layer.cornerRadius = Constants.cardCornerRadius
    }

    private func animate(to view: UIView, duration: TimeInterval = Constants.duration, delay: TimeInterval = Constants.delay,
                         usingSpringWithDamping: CGFloat = Constants.usingSpringWithDamping, initialSpringVelocity: CGFloat = Constants.initialSpringVelocity,
                         options: UIView.AnimationOptions = Constants.options, completion: ((Bool) -> Void)? = nil) {

        view.transform =  CGAffineTransform(translationX: Constants.translationX, y: Constants.translationY)
        view.alpha = 0

        UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: usingSpringWithDamping, initialSpringVelocity: initialSpringVelocity, options: options, animations: {

            view.transform =  CGAffineTransform.identity
            view.alpha = 1
            view.layoutIfNeeded()

        })
    }
}

// MARK: - DetailView
extension DetailViewController: DetailView {

    func showImage(url: URL) {
        rocketImageView.load(url: url)
    }

    func showPrincipalInformation(rocket: Rocket, firstFlight: String) {
        titleLabel.text = rocket.name
        descriptionLabel.text = rocket.description
        firstFlightTitleLabel.text = "rocket_app_info_first_flight_label".localize
        firstFlightValue.text = firstFlight
        countryLabel.text = "rocket_app_info_country_label".localize
        countryValue.text = rocket.country
        heightLabel.text = "rocket_app_header_height_label".localize
        heightValue.text = rocket.height
        enginesLabel.text = "rocket_app_header_engines_label".localize
        enginesValue.text = rocket.engines

        displayAnimation()
    }

    func displayAnimation() {

        heightContainerView.layer.cornerRadius = Constants.cardCornerRadius
        enginesConteinerView.layer.cornerRadius = Constants.cardCornerRadius

        animate(to: heightContainerView)
        animate(to: enginesConteinerView, delay: Constants.delaySecondAnimation)
    }
}
