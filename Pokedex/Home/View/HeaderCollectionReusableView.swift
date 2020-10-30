//
//  HeaderCollectionReusableView.swift
//  Pokedex
//
//  Created by Luis Gustavo Oliveira Silva on 17/10/20.
//  Copyright © 2020 Luis Gustavo Oliveira Silva. All rights reserved.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    static let reuseIdentifier = "HomePokemonHeader"
    
    private lazy var pokeballImage: UIImageView = {
        let pokeballImage = UIImageView()
        pokeballImage.image = .homePokeball
        pokeballImage.translatesAutoresizingMaskIntoConstraints = false
        return pokeballImage
    }()
    
    private lazy var filtersImage: UIImageView = {
        let filtersImage = UIImageView()
        filtersImage.image = .filters
        filtersImage.translatesAutoresizingMaskIntoConstraints = false
        return filtersImage
    }()
    
    private lazy var generationImage: UIImageView = {
        let generationImage = UIImageView()
        generationImage.image = .generation
        generationImage.translatesAutoresizingMaskIntoConstraints = false
        return generationImage
    }()
    
    private lazy var sortImage: UIImageView = {
        let sortImage = UIImageView()
        sortImage.image = .sort
        sortImage.translatesAutoresizingMaskIntoConstraints = false
        return sortImage
    }()
    
    private lazy var stackViewIcons: UIStackView = {
        let stackViewIcons = UIStackView()
        stackViewIcons.axis = NSLayoutConstraint.Axis.horizontal
        stackViewIcons.distribution = UIStackView.Distribution.equalCentering
        stackViewIcons.alignment = UIStackView.Alignment.center
        stackViewIcons.spacing = 30
        stackViewIcons.translatesAutoresizingMaskIntoConstraints = false
        return stackViewIcons
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Pokédex"
        titleLabel.textColor = .textBlack
        titleLabel.font = .applicationTitle
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Search for Pokémon by name or using the National Pokédex number."
        descriptionLabel.textColor = .textGrey
        descriptionLabel.font = .description
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLabel
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.searchBarStyle = UISearchBar.Style.minimal
        searchBar.placeholder = "What Pokémon are you looking for?"
        return searchBar
    }()
    
}

extension HeaderCollectionReusableView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("searchText \(searchText)")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("searchText \(String(describing: searchBar.text))")
    }
}

extension HeaderCollectionReusableView {
    
    private func setupContraintPokeballImage() {
        pokeballImage.anchor(
            top: self.topAnchor,
            left: self.leftAnchor,
            right: self.rightAnchor,
            widthConstant: self.frame.size.width,
            heightConstant: 207
        )
    }
    
    private func setupContraintFiltersImage() {
        filtersImage.anchor(
            widthConstant: 20,
            heightConstant: 20
        )
    }
    
    private func setupContraintGenerationImage() {
        generationImage.anchor(
            widthConstant: 20,
            heightConstant: 20
        )
    }
    
    private func setupContraintSortImage() {
        sortImage.anchor(
            widthConstant: 20,
            heightConstant: 20
        )
    }
    
    private func setupContraintStackViewIcons() {
        stackViewIcons.anchor(
            top: self.topAnchor,
            right: self.rightAnchor,
            topConstant: 15,
            rightConstant: 30
        )
    }
    
    private func setupContraintTitleLabel() {
        titleLabel.anchor(
            top: stackViewIcons.bottomAnchor,
            left: self.leftAnchor,
            topConstant: 25,
            leftConstant: 20
        )
    }
    
    private func setupContraintDescriptionLabel() {
        descriptionLabel.anchor(
            top: titleLabel.bottomAnchor,
            left: titleLabel.leftAnchor,
            right: self.rightAnchor,
            topConstant: 15,
            rightConstant: 20
        )
    }
    
    private func setupContraintSearchBar() {
        searchBar.anchor(
            top: descriptionLabel.bottomAnchor,
            left: titleLabel.leftAnchor,
            right: descriptionLabel.rightAnchor,
            topConstant: 15
        )
    }
}

extension HeaderCollectionReusableView: ViewLayoutHelper {
    func buildViewHierarchy() {
        self.addSubview(pokeballImage)
        stackViewIcons.addArrangedSubview(generationImage)
        stackViewIcons.addArrangedSubview(sortImage)
        stackViewIcons.addArrangedSubview(filtersImage)
        self.addSubview(stackViewIcons)
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(searchBar)
    }
    
    func setupContraints() {
        setupContraintPokeballImage()
        setupContraintFiltersImage()
        setupContraintGenerationImage()
        setupContraintSortImage()
        setupContraintStackViewIcons()
        setupContraintTitleLabel()
        setupContraintDescriptionLabel()
        setupContraintSearchBar()
    }
    
    func setupAdditionalConfiguration() {
        
    }

}
