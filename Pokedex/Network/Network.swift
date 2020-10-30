//
//  Network.swift
//  Pokedex
//
//  Created by Luis Gustavo Oliveira Silva on 11/10/20.
//  Copyright © 2020 Luis Gustavo Oliveira Silva. All rights reserved.
//

import Foundation

protocol NetworkDispatcherProtocol {
    func request(url: String, completion: @escaping (Result<Data, Error>) -> Void)
}

class NetworkDispatcher: NetworkDispatcherProtocol {
    
    private let session = URLSession.shared
    
    func request(url: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let request = URL(string: url) else { return }
        session.dataTask(with: request) { (data, response, error) in
            if let fetchedData = data {
                completion(.success(fetchedData))
            } else {
                if let err = error {
                    completion(.failure(err))
                }
            }
        }.resume()
    }
}
