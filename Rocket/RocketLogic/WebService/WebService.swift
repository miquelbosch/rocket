//
//  WebService.swift
//  RocketLogic
//
//  Created by Miquel Bosch on 14/02/2021.
//

import Foundation

internal final class WebService {

    // MARK: - Propierties
    private let session: URLSession
    private let decoder = JSONDecoder()
    private let base = URL(string: Constants.urlString)!

    // MARK: - Variables
    private var dataTask: URLSessionDataTask?

    private struct Constants {
        private init() {}
        static let urlString = "https://api.spacexdata.com/v4"
    }

    // MARK: - Initializers
    init(session: URLSession) {
        self.session = session
    }

    func fetch<T>(_ type: T.Type,
                  from endpoint: Endpoint,
                  completion completed: @escaping(Result<T, ResponseError>) -> Void) where T: Decodable {

        let decoder = self.decoder
        let request = endpoint.request(with: base)

        dataTask = session.dataTask(with: request, completionHandler: { data, response, error in

            guard let httpResponse = response as? HTTPURLResponse else {
                completed(.failure(.server))
                return
            }

            if httpResponse.statusCode == 200 {

                if let data = data {
                    if let result = try? decoder.decode(T.self, from: data) {
                        completed(.success(result))
                    } else {
                        completed(.failure(.mapping))
                    }
                } else {
                    completed(.failure(.server))
                }
            } else {
                let error = NSError(domain: "", code: httpResponse.statusCode, userInfo: nil)
                completed(.failure(ResponseError.unknow(error: error)))
            }
        })

        dataTask?.resume()
    }
}
