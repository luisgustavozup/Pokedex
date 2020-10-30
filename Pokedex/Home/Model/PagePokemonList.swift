//
//  TypesList.swift
//  Pokédex
//
//  Created by Luis Gustavo Oliveira Silva on 05/10/20.
//  Copyright © 2020 Luis Gustavo Oliveira Silva. All rights reserved.
//

import UIKit

struct PagePokemonList: Codable {
    var list: [PokemonDetail]
}

struct PokemonDetail: Codable {
    let id: Int?
    var name: String?
    let types: [SkillType]
}

struct SkillType: Codable {
    let slot: Int
    let type: Type
}

struct Type: Codable {
    var name: String
    
     func backgroundSkillTypeColor() -> UIColor {
        switch name {
        case "bug": return .backgroundTypeBug
        case "dark": return .backgroundTypeDark
        case "dragon": return .backgroundTypeDragon
        case "electric": return .backgroundTypeElectric
        case "fairy": return .backgroundTypeFairy
        case "fighting": return .backgroundTypeFighting
        case "fire": return .backgroundTypeFire
        case "flying": return .backgroundTypeFlying
        case "ghost": return .backgroundTypeGhost
        case "grass": return .backgroundTypeGrass
        case "ground": return .backgroundTypeGround
        case "ice": return .backgroundTypeIce
        case "normal": return .backgroundTypeNormal
        case "poison": return .backgroundTypePoison
        case "psychic": return .backgroundTypePsychic
        case "rock": return .backgroundTypeRock
        case "steel": return .backgroundTypeSteel
        case "water": return .backgroundTypeWater
        default: return .white
        }
    }
    
}
