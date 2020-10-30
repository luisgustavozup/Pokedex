//
//  HomeViewController.swift
//  Pokédex
//
//  Created by Luis Gustavo Oliveira Silva on 05/10/20.
//  Copyright © 2020 Luis Gustavo Oliveira Silva. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let flowLayout = UICollectionViewFlowLayout()
    private var viewModel: HomeViewModelType
    private var collectionViewModel: PokemonCollectionViewViewModel? = PokemonCollectionViewViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.insetsLayoutMarginsFromSafeArea = true
        self.navigationController?.isNavigationBarHidden = true
        setupView()
        viewModel.fetchPokemonList(url: pokemonListUrl)
        viewModel.collectionViewModel = collectionViewModel
    }
    
    // MARK: - Init
    init(viewModel: HomeViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(PokemonCollectionViewCell.self, forCellWithReuseIdentifier: PokemonCollectionViewCell.reuseIdentifier)
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.reuseIdentifier)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset = .init(top: 0, left: 0, bottom: 40, right: 0)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
}

// MARK: - Contraints
extension HomeViewController {
    
    private func setupContraintCollectionView() {
        collectionView.anchor(
            top: view.topAnchor,
            left: view.leftAnchor,
            bottom: view.bottomAnchor,
            right: view.rightAnchor
        )
    }
}

// MARK: - TableView
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewModel?.getPokemonListCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCollectionViewCell.reuseIdentifier, for: indexPath as IndexPath) as? PokemonCollectionViewCell else { return UICollectionViewCell() }
        
        cell.setupView()
        cell.setupCell(
            pokemonId: collectionViewModel?.getPokemonId(indexPathRow: indexPath.row) ?? 0,
            pokemonName: collectionViewModel?.getPokemonName(indexPathRow: indexPath.row) ?? "",
            skillTypes: collectionViewModel?.getPokemonTypes(indexPathRow: indexPath.row) ?? []
        )

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 360, height: 135)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.reuseIdentifier, for: indexPath) as? HeaderCollectionReusableView else { return  UICollectionReusableView() }
        
        header.setupView()
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let size = CGSize(width: view.frame.size.width, height: 230)
        
        return size
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY / contentHeight >= 0.3 {
            viewModel.fetchPokemonList(url: viewModel.getNextPageUrl())
        }
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func reloadData() {
        self.collectionView.reloadData()
    }
}

// MARK: - Setup View Code
extension HomeViewController: ViewLayoutHelper {
    func buildViewHierarchy() {
        view.addSubview(collectionView)
    }
    
    func setupContraints() {
        setupContraintCollectionView()
    }
    
    func setupAdditionalConfiguration() {
        viewModel.delegate = self
        collectionViewModel?.delegate = self
        view.backgroundColor = .white
    }
    
}
