//
//  DetailViewModel.swift
//  RocketLogic
//
//  Created by Miquel Bosch on 15/02/2021.
//

import Foundation

protocol DetailViewModelProtocol: class {

}

final class DetailViewModel: DetailViewModelProtocol {

    private let rocket: Rocket

    // MARK: - Initializers
    init(rocket: Rocket) {
        self.rocket = rocket
    }
}
