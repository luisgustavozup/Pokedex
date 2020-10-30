//
//  CollectionViewViewModel.swift
//  Pokedex
//
//  Created by Luis Gustavo Oliveira Silva on 19/10/20.
//  Copyright © 2020 Luis Gustavo Oliveira Silva. All rights reserved.
//

import Foundation

protocol PokemonCollectionViewViewModelProtocol {
    func getPokemonListCount() -> Int
    
    func getPokemonId(indexPathRow: Int) -> Int
    
    func getPokemonName(indexPathRow: Int) -> String
    
    func getPokemonTypes(indexPathRow: Int) -> [SkillType]
    
    var delegate: HomeViewModelDelegate? { get set }
}

class PokemonCollectionViewViewModel: PokemonCollectionViewViewModelProtocol {
    weak var delegate: HomeViewModelDelegate?
    
    private(set) var pokemon: PagePokemonList? {
        didSet {
            delegate?.reloadData()
        }
    }
    
    func getPokemonListCount() -> Int {
        return pokemon?.list.count ?? 2
    }
    
    func getPokemonId(indexPathRow: Int) -> Int {
        return pokemon?.list[indexPathRow].id ?? 0
    }
    
    func getPokemonName(indexPathRow: Int) -> String {
        return pokemon?.list[indexPathRow].name ?? ""
    }
        
    func getPokemonTypes(indexPathRow: Int) -> [SkillType] {
        return pokemon?.list[indexPathRow].types ?? [SkillType(slot: 0, type: Type(name: "ice"))]
    }
    
    func setList(list: PagePokemonList?) {
        self.pokemon = list
    }
}
