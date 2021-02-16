//
//  DetailViewModel.swift
//  RocketLogic
//
//  Created by Miquel Bosch on 15/02/2021.
//

import Foundation

protocol DetailViewModelProtocol: class {
    var view: DetailView? { get set }
    func setup()
}

final class DetailViewModel: DetailViewModelProtocol {

    private let rocket: Rocket

    weak var view: DetailView?

    // MARK: - Initializers
    init(rocket: Rocket) {
        self.rocket = rocket
    }

    func setup() {
        setupTitle()
        setupImage()
        setInformation()
    }

    private func setupTitle() {
        view?.title = rocket.name
    }

    private func setupImage() {
        guard let url = URL(string: rocket.image) else { return }
        view?.showImage(url: url)
    }

    private func setInformation() {
        let firstFlight = getFirstFlightFormat()
        view?.showPrincipalInformation(rocket: rocket, firstFlight: firstFlight)
    }

    private func getFirstFlightFormat() -> String {
        return DateManager.date(original: rocket.firstFlight, to: .ddMMyyyy)
    }
}
