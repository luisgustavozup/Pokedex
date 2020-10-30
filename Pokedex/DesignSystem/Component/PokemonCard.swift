//
//  PokemonCard.swift
//  Pokédex
//
//  Created by Luis Gustavo Oliveira Silva on 10/10/20.
//  Copyright © 2020 Luis Gustavo Oliveira Silva. All rights reserved.
//

import UIKit
import SDWebImage

class PokemonCard: UIView {
    
    private(set) var pokemonId: Int? {
        didSet {
           setupPokemonId()
        }
    }
    private(set) var pokemonName: String? {
        didSet {
            pokemonNameLabel.text = pokemonName
        }
    }
    private(set) var skillTypes: [SkillType]? {
        didSet {
            setupSkillTypes()
        }
    }
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var viewCard: UIView = {
           let viewCard = UIView()
           viewCard.translatesAutoresizingMaskIntoConstraints = false
           return viewCard
       }()
    
    private lazy var pokemonNumberLabel: UILabel = {
        let pokemonNumber = UILabel()
        pokemonNumber.textColor = .textNumber
        pokemonNumber.font = .pokemonNumber
        pokemonNumber.numberOfLines = 0
        pokemonNumber.translatesAutoresizingMaskIntoConstraints = false
        return pokemonNumber
    }()
    
    private lazy var pokemonNameLabel: UILabel = {
        let pokemonName = UILabel()
        pokemonName.textColor = .textWhite
        pokemonName.font = .pokemonName
        pokemonName.numberOfLines = 0
        pokemonName.translatesAutoresizingMaskIntoConstraints = false
        return pokemonName
    }()
    
    private lazy var iconSkillType1: UIImageView = {
        let iconSkillType1 = UIImageView()
        iconSkillType1.contentMode = .scaleAspectFill
        iconSkillType1.translatesAutoresizingMaskIntoConstraints = false
        return iconSkillType1
    }()
    
    private lazy var iconSkillType2: UIImageView = {
        let iconSkillType2 = UIImageView()
        iconSkillType2.contentMode = .scaleAspectFill
        iconSkillType2.translatesAutoresizingMaskIntoConstraints = false
        return iconSkillType2
    }()
    
    private lazy var pokemonImage: UIImageView = {
        let pokemonImage = UIImageView()
        pokemonImage.translatesAutoresizingMaskIntoConstraints = false
        return pokemonImage
    }()
    
    private lazy var pokeballImage: UIImageView = {
        let pokeballImage = UIImageView()
        pokeballImage.image = .pokeball
        pokeballImage.translatesAutoresizingMaskIntoConstraints = false
        return pokeballImage
    }()
    
    private lazy var patternImage: UIImageView = {
        let patternImage = UIImageView()
        patternImage.image = .pattern
        patternImage.translatesAutoresizingMaskIntoConstraints = false
        return patternImage
    }()
    
    private func viewConfiguration() {
        viewCard.clipsToBounds = true
        viewCard.layer.cornerRadius = 10
        viewCard.layer.shadowRadius = 10
        viewCard.layer.shadowOpacity = 0.5
    }
    
    private func setNumberMask(pokemonNumber: Int) -> String {
        let number = String(pokemonNumber)
        let numberOfCharacters = number.count
        
        switch numberOfCharacters {
        case 1: return "#00\(number)"
        case 2: return "#0\(number)"
        default: return "#\(number)"
        }
    }
    
    private func checkSkillType2IsNull() {
        let skill = skillTypes?.count
        if skill == 1 {
            iconSkillType2.isHidden = true
        } else {
            iconSkillType2.isHidden = false
            iconSkillType2.image = .skillTypeBadgeImage(type: skillTypes?[1].type ?? Type(name: ""))
        }
    }
    
    public func setupCard(pokemonId: Int, pokemonName: String, skillTypes: [SkillType]) {
        self.pokemonId = pokemonId
        self.pokemonName = pokemonName
        self.skillTypes = skillTypes
    }
    
    private func setupPokemonId() {
        pokemonNumberLabel.text = setNumberMask(pokemonNumber: pokemonId ?? 0)
        pokemonImage.sd_setImage(with: urlImagePokemon(numberPokemon: pokemonId ?? 0))
    }
    
    private func setupSkillTypes() {
        iconSkillType1.image = .skillTypeBadgeImage(type: skillTypes?[0].type ?? Type(name: ""))
        checkSkillType2IsNull()
        viewCard.backgroundColor = skillTypes?[0].type.backgroundSkillTypeColor()
    }
}

// MARK: - Contraints
extension PokemonCard {
    
    private func setupContraintViewCard() {
        viewCard.anchor(
            top: self.topAnchor,
            left: self.leftAnchor,
            bottom: self.bottomAnchor,
            right: self.rightAnchor,
            topConstant: 20
        )
       }
    
    private func setupContraintPokemonNumber() {
        pokemonNumberLabel.anchor(
            top: viewCard.topAnchor,
            left: viewCard.leftAnchor,
            topConstant: 20,
            leftConstant: 20
        )
    }
    
    private func setupContraintPokemonName() {
        pokemonNameLabel.anchor(
            top: pokemonNumberLabel.bottomAnchor,
            left: viewCard.leftAnchor,
            leftConstant: 20
        )
    }
    
    private func setupContraintSkillType1() {
        iconSkillType1.anchor(
            top: pokemonNameLabel.bottomAnchor,
            left: viewCard.leftAnchor,
            topConstant: 5,
            leftConstant: 20,
            widthConstant: 60,
            heightConstant: 25
        )
    }
    
    private func setupContraintSkillType2() {
        iconSkillType2.anchor(
            top: pokemonNameLabel.bottomAnchor,
            left: iconSkillType1.rightAnchor,
            topConstant: 5,
            leftConstant: 10,
            widthConstant: 60,
            heightConstant: 25
        )
    }
    
    private func setupContraintPokemonImage() {
        pokemonImage.anchor(
            bottom: self.bottomAnchor,
            right: self.rightAnchor,
            bottomConstant: 10,
            rightConstant: 10,
            widthConstant: 130,
            heightConstant: 130
        )
    }
    
    private func setupContraintPokeballImage() {
        pokeballImage.anchor(
            top: viewCard.topAnchor,
            right: viewCard.rightAnchor,
            widthConstant: 130,
            heightConstant: viewCard.frame.size.height
        )
    }
    
    private func setupContraintPatternImage() {
        patternImage.anchor(
            top: viewCard.topAnchor,
            left: pokemonNumberLabel.rightAnchor,
            topConstant: 5,
            leftConstant: 40,
            widthConstant: 74,
            heightConstant: 32)
    }
    
}

// MARK: - Setup View Code
extension PokemonCard: ViewLayoutHelper {
    func buildViewHierarchy() {
        addSubview(viewCard)
        viewCard.addSubview(pokemonNumberLabel)
        viewCard.addSubview(pokemonNameLabel)
        viewCard.addSubview(iconSkillType1)
        viewCard.addSubview(iconSkillType2)
        viewCard.addSubview(patternImage)
        viewCard.insertSubview(pokeballImage, at: 0)
        addSubview(pokemonImage)
    }
    
    func setupContraints() {
        setupContraintViewCard()
        setupContraintPokemonNumber()
        setupContraintPokemonName()
        setupContraintSkillType1()
        setupContraintSkillType2()
        setupContraintPatternImage()
        setupContraintPokeballImage()
        setupContraintPokemonImage()
    }
    
    func setupAdditionalConfiguration() {
        viewConfiguration()
        backgroundColor = .clear
    }
    
}
