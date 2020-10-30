//
//  Urls.swift
//  Pokedex
//
//  Created by Luis Gustavo Oliveira Silva on 10/10/20.
//  Copyright © 2020 Luis Gustavo Oliveira Silva. All rights reserved.
//

import Foundation
func urlImagePokemon(numberPokemon: Int) -> URL {
    let url = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(numberPokemon).png"
    return URL(string: url) ?? URL.init(string: "")!
}

let pokemonListUrl = "https://pokeapi.co/api/v2/pokemon"
