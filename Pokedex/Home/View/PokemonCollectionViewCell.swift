//
//  PokemonTableViewCell.swift
//  Pokédex
//
//  Created by Luis Gustavo Oliveira Silva on 07/10/20.
//  Copyright © 2020 Luis Gustavo Oliveira Silva. All rights reserved.
//

import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "HomePokemonCell"
    lazy var card = PokemonCard()
    
    func setupCell(pokemonId: Int, pokemonName: String, skillTypes: [SkillType]) {
        card.setupCard(
            pokemonId: pokemonId,
            pokemonName: pokemonName,
            skillTypes: skillTypes
        )
    }
}

extension PokemonCollectionViewCell: ViewLayoutHelper {
    func buildViewHierarchy() {
        contentView.addSubview(card)
    }
    
    func setupContraints() {
        card.anchor(
            top: self.topAnchor,
            left: self.leftAnchor,
            bottom: self.bottomAnchor,
            right: self.rightAnchor
        )
    }
    
    func setupAdditionalConfiguration() {
        
    }
}
