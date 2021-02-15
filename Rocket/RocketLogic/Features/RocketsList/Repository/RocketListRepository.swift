//
//  RocketListRepository.swift
//  RocketLogic
//
//  Created by Miquel Bosch on 14/02/2021.
//

import Foundation

internal protocol RocketListRepositoryProtocol: class {
    func rocketList(completion completed: @escaping (Result<Rocket, ResponseError>) -> Void)
}

internal final class RocketListRepository {

    // MARK: - Propierties
    private let webService: WebService

    // MARK: - Initializers
    init(webService: WebService) {
        self.webService = webService
    }
}

// MARK: - RocketListRepositoryProtocol
extension RocketListRepository: RocketListRepositoryProtocol {

    func rocketList(completion completed: @escaping (Result<Rocket, ResponseError>) -> Void) {
        webService.fetch(RocketListServiceResponse.self, from: .rockets) { response in
            print(response)
            DispatchQueue.main.async {
                switch response {
                case .success(let rockets):
                    break
                    //completed(.success(rockets))
                case .failure(let error):
                    completed(.failure(error))
                }
            }
        }
    }
}
