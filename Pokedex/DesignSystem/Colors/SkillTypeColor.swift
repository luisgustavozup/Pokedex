//
//  SkillTypeColor.swift
//  Pokédex
//
//  Created by Luis Gustavo Oliveira Silva on 07/10/20.
//  Copyright © 2020 Luis Gustavo Oliveira Silva. All rights reserved.
//

import UIKit

extension UIColor {
    
    static var typeBug = UIColor(hex: "#8CB230")
    
    static var typeDark = UIColor(hex: "#58575F")
    
    static var typeDragon = UIColor(hex: "#0F6AC0")
    
    static var typeElectric = UIColor(hex: "#EED535")
    
    static var typeFairy = UIColor(hex: "#ED6EC7")
    
    static var typeFighting = UIColor(hex: "#D04164")
    
    static var typeFire = UIColor(hex: "#FD7D24")
    
    static var typeFlying = UIColor(hex: "#748FC9")
    
    static var typeGhost = UIColor(hex: "#556AAE")
    
    static var typeGrass = UIColor(hex: "#62B957")
    
    static var typeGround = UIColor(hex: "#DD7748")
    
    static var typeIce = UIColor(hex: "#61CEC0")
    
    static var typeNormal = UIColor(hex: "#9DA0AA")
    
    static var typePoison = UIColor(hex: "#A552CC")
    
    static var typePsychic = UIColor(hex: "#EA5D60")
    
    static var typeRock = UIColor(hex: "#BAAB82")
    
    static var typeSteel = UIColor(hex: "#417D9A")
    
    static var typeWater = UIColor(hex: "#4A90DA")
    
    static func skillTypeColor(type: Type) -> UIColor {
        switch type.name {
        case "bug": return .typeBug
        case "dark": return .typeDark
        case "dragon": return .typeDragon
        case "electric": return .typeElectric
        case "fairy": return .typeFairy
        case "fighting": return .typeFighting
        case "fire": return .typeFire
        case "flying": return .typeFlying
        case "ghost": return .typeGhost
        case "grass": return .typeGrass
        case "ground": return .typeGround
        case "ice": return .typeIce
        case "normal": return .typeNormal
        case "poison": return .typePoison
        case "psychic": return .typePsychic
        case "rock": return .typeRock
        case "steel": return .typeSteel
        case "water": return .typeWater
        default: return .white
        }
    }
    
}
