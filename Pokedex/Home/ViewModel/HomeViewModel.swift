//
//  HomeScreenViewModel.swift
//  Pokédex
//
//  Created by Luis Gustavo Oliveira Silva on 05/10/20.
//  Copyright © 2020 Luis Gustavo Oliveira Silva. All rights reserved.
//

import Foundation

protocol HomeViewModelType {
    func fetchPokemonList(url: String)
    
    func getNextPageUrl() -> String
    
    var delegate: HomeViewModelDelegate? { get set }
    
    var collectionViewModel: PokemonCollectionViewViewModel? { get set }
}

protocol HomeViewModelDelegate: AnyObject {
    func reloadData()
}

class HomeViewModel: HomeViewModelType {
    // MARK: - Model
    private var pagePokemonList: PagePokemonList? {
        didSet {
            dispatchGroup.notify(queue: .main) {
                self.sortPokemonList()
                self.setupCollection()
            }
        }
    }
    
    // MARK: - Dependencies
    private var pokemonList: PokemonList?
    private var service: HomeServiceProtocol
    weak var delegate: HomeViewModelDelegate?
    var collectionViewModel: PokemonCollectionViewViewModel?
    let dispatchGroup = DispatchGroup()
    
    // MARK: - Init
    init(service: HomeServiceProtocol = HomeScreenService()) {
        self.service = service
    }
    
    // MARK: - Private Methods
    private func fetchPokemon(with url: String, completion: @escaping (Result<PokemonDetail, Error>) -> Void) {
        service.fetchPokemonDetail(with: url) { result in
            switch result {
            case .success(let pokemon):
                completion(.success(pokemon))
            case .failure(let err):
                print(err.localizedDescription)
                completion(.failure(err))
                
            }
        }
    }
    
    private func fillPokemonList(pokemonUrlList: PokemonList?) {
        guard let resultList = pokemonUrlList?.results.count else { return }
        pagePokemonList = pagePokemonList == nil ? PagePokemonList(list: []) : pagePokemonList
        for i in 0..<resultList {
            dispatchGroup.enter()
            guard let url = pokemonUrlList?.results[i].url else { return }
            fetchPokemon(with: url) { result in
                switch result {
                case .success(let pokemon):
                    var pokemonNameCapitalized = pokemon
                    pokemonNameCapitalized.name?.capitalizeFirstLetter()
                    self.pagePokemonList?.list.append(pokemonNameCapitalized)
                    self.dispatchGroup.leave()
                case .failure(let err):
                    print(err.localizedDescription)
                    self.dispatchGroup.leave()
                }
                
            }
        }
    }
    
    private func sortPokemonList() {
        pagePokemonList?.list.sort {
            guard let id1 = $0.id, let id2 = $1.id else { return false }
            return id1 < id2
        }
    }
    
    // MARK: - Public Methods
    func fetchPokemonList(url: String) {
        dispatchGroup.enter()
        service.fetchPokemonList(url: url) { result in
            switch result {
            case .success(let pokemonList):
                self.pokemonList = pokemonList
                self.dispatchGroup.leave()
            case .failure(let err):
                print(err.localizedDescription)
                self.dispatchGroup.leave()
            }
        }
        dispatchGroup.notify(queue: .main) {
            self.dispatchGroup.enter()
            self.fillPokemonList(pokemonUrlList: self.pokemonList)
            self.dispatchGroup.leave()
        }
    }
    
    func getNextPageUrl() -> String {
        return pokemonList?.next ?? ""
    }
    
    private func setupCollection() {
        self.collectionViewModel?.setList(list: pagePokemonList)
    }
    
}
