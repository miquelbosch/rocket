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
    @IBOutlet weak var heightCnt: NSLayoutConstraint!
    @IBOutlet weak var enginesConteinerView: UIView!
    @IBOutlet weak var enginesCnt: NSLayoutConstraint!
    @IBOutlet weak var topInformationStackView: NSLayoutConstraint!
    @IBOutlet weak var topStackView: UIStackView!

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
        rocketImageView.round(.bottomRight, radius: CGFloat(76))
    }

    func showPrincipalInformation(rocket: Rocket, firstFlight: String) {
        titleLabel.text = rocket.name
        descriptionLabel.text = rocket.description
        firstFlightValue.text = firstFlight
        countryValue.text = rocket.country

        animateViewsTwo()
    }

    private func animation() {

        topInformationStackView.constant = 0
        heightContainerView.alpha = 0
        topInformationStackView.constant = 80
        enginesConteinerView.alpha = 0

        UIView.animate(withDuration: 1.6, delay: 0.7, animations: {
            self.heightContainerView.alpha = 1
            self.heightContainerView.layoutIfNeeded()
        })

        UIView.animate(withDuration: 1.6, delay: 0.9, animations: {

            self.enginesConteinerView.alpha = 1
            self.enginesConteinerView.layoutIfNeeded()
        })

        heightContainerView.layer.cornerRadius = 12
        enginesConteinerView.layer.cornerRadius = 12
    }

    func animateViews() {

        heightContainerView.layer.cornerRadius = 12
        enginesConteinerView.layer.cornerRadius = 12

        let containers = [heightContainerView, enginesConteinerView]
        topStackView.axis = .vertical

        let animations = {
            self.topStackView.axis = .horizontal
            self.topStackView.transform =  CGAffineTransform.identity
            self.topStackView.alpha = 1

            containers.forEach { label in
                label?.alpha = 1
            }
            //self.view.layoutIfNeeded()
            self.topStackView.layoutIfNeeded()
        }

        self.topStackView.transform =  CGAffineTransform(translationX: 0, y: 4000)
        self.topStackView.alpha = 0

        containers.forEach { label in
            label?.alpha = 0
        }

        UIView.animate(withDuration: 1.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.7, options: .curveEaseInOut, animations: animations, completion: nil)
    }

    func animateViewsTwo() {

        heightContainerView.layer.cornerRadius = 12
        enginesConteinerView.layer.cornerRadius = 12

        let animationHeight = {
            self.heightContainerView.transform =  CGAffineTransform.identity
            self.heightContainerView.alpha = 1
            self.heightContainerView.layoutIfNeeded()
        }

        let animationEngine = {
            self.enginesConteinerView.transform =  CGAffineTransform.identity
            self.enginesConteinerView.alpha = 1
            self.enginesConteinerView.layoutIfNeeded()
        }

        self.heightContainerView.transform =  CGAffineTransform(translationX: 0, y: 60)
        self.heightContainerView.alpha = 0
        self.enginesConteinerView.transform =  CGAffineTransform(translationX: 0, y: 80)
        self.enginesConteinerView.alpha = 0

        UIView.animate(withDuration: 1.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.7, options: .curveEaseInOut, animations: animationHeight, completion: nil)
        UIView.animate(withDuration: 1.4, delay: 0.5, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.7, options: .curveEaseInOut, animations: animationEngine, completion: nil)
    }
}
