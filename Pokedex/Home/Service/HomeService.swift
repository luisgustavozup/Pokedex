//
//  HomeScreenService.swift
//  Pokédex
//
//  Created by Luis Gustavo Oliveira Silva on 05/10/20.
//  Copyright © 2020 Luis Gustavo Oliveira Silva. All rights reserved.
//

import Foundation

enum CustomError: Error {
    case parseError(String)
    case networkError(String)
}

protocol HomeServiceProtocol {
    func fetchPokemonList(url: String?, completion: @escaping (Result< PokemonList, Error >) -> Void)
    func fetchPokemonDetail(with url: String?, completion: @escaping (Result< PokemonDetail, Error >) -> Void)
}

class HomeScreenService: HomeServiceProtocol {
    
    // MARK: - Dependencies
    var networkDispatcher: NetworkDispatcherProtocol
    
    // MARK: - Init
    init(networkDispatcher: NetworkDispatcherProtocol = NetworkDispatcher()) {
        self.networkDispatcher = networkDispatcher
    }
    
    // MARK: - Methods
    func fetchPokemonList(url: String?, completion: @escaping (Result<PokemonList, Error>) -> Void) {
        networkDispatcher.request(url: url ?? "") { result in
            switch result {
            case .success(let data):
                do {
                    let pokemonList = try JSONDecoder().decode(PokemonList.self, from: data)
                    completion(.success(pokemonList))
                } catch {
                    completion(.failure(CustomError.parseError("❌ Parse Error!")))
                }
            case .failure(let error):
                completion(.failure(CustomError.networkError(error.localizedDescription)))
            }
        }
    }
    
    func fetchPokemonDetail(with url: String?, completion: @escaping (Result<PokemonDetail, Error>) -> Void) {
        guard let url = url else { return }
        networkDispatcher.request(url: url) { result in
            switch result {
            case .success(let data):
                do {
                    let pokemon = try JSONDecoder().decode(PokemonDetail.self, from: data)
                    completion(.success(pokemon))
                } catch {
                    completion(.failure(CustomError.parseError("❌ Parse Error!")))
                }
            case .failure(let error):
                completion(.failure(CustomError.networkError(error.localizedDescription)))
            }
        }
    }

}
