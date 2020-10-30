//
//  Badges.swift
//  Pokédex
//
//  Created by Luis Gustavo Oliveira Silva on 08/10/20.
//  Copyright © 2020 Luis Gustavo Oliveira Silva. All rights reserved.
//

import UIKit
extension UIImage {
    
    static var badgesBug = UIImage(named: "Bug")
    
    static var badgesDark = UIImage(named: "Dark")
    
    static var badgesDragon = UIImage(named: "Dragon")
    
    static var badgesElectric = UIImage(named: "Electric")
    
    static var badgesFairy = UIImage(named: "Fairy")
    
    static var badgesFighting = UIImage(named: "Fighting")
    
    static var badgesFire = UIImage(named: "Fire")
    
    static var badgesFlying = UIImage(named: "Flying")
    
    static var badgesGhost = UIImage(named: "Ghost")
    
    static var badgesGrass = UIImage(named: "Grass")
    
    static var badgesGround = UIImage(named: "Ground")
    
    static var badgesIce = UIImage(named: "Ice")
    
    static var badgesNormal = UIImage(named: "Normal")
    
    static var badgesPoison = UIImage(named: "Poison")
    
    static var badgesPsychic = UIImage(named: "Psychic")
    
    static var badgesRock = UIImage(named: "Rock")
    
    static var badgesSteel = UIImage(named: "Steel")
    
    static var badgesWater = UIImage(named: "Water")
    
    static func skillTypeBadgeImage(type: Type) -> UIImage {
        switch type.name {
        case "bug": return UIImage.badgesBug ?? UIImage()
        case "dark": return UIImage.badgesDark ?? UIImage()
        case "dragon": return UIImage.badgesDragon ?? UIImage()
        case "electric": return UIImage.badgesElectric ?? UIImage()
        case "fairy": return UIImage.badgesFairy ?? UIImage()
        case "fighting": return UIImage.badgesFighting ?? UIImage()
        case "fire": return UIImage.badgesFire ?? UIImage()
        case "flying": return UIImage.badgesFlying ?? UIImage()
        case "ghost": return UIImage.badgesGhost ?? UIImage()
        case "grass": return UIImage.badgesGrass ?? UIImage()
        case "ground": return UIImage.badgesGround ?? UIImage()
        case "ice": return UIImage.badgesIce ?? UIImage()
        case "normal": return UIImage.badgesNormal ?? UIImage()
        case "poison": return UIImage.badgesPoison ?? UIImage()
        case "psychic": return UIImage.badgesPsychic ?? UIImage()
        case "rock": return UIImage.badgesRock ?? UIImage()
        case "steel": return UIImage.badgesSteel ?? UIImage()
        case "water": return UIImage.badgesWater ?? UIImage()
        default: return UIImage()
        }
    }
}
