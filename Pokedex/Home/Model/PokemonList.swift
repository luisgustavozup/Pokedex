//
//  PokemonList.swift
//  Pokédex
//
//  Created by Luis Gustavo Oliveira Silva on 05/10/20.
//  Copyright © 2020 Luis Gustavo Oliveira Silva. All rights reserved.
//

import Foundation

struct PokemonList: Codable {
    let next: String
    let previous: String?
    let results: [Pokemon]
}

struct Pokemon: Codable {
    var name: String
    let url: String
}
