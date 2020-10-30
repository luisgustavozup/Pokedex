//
//  ViewLayoutHelper.swift
//  Pokédex
//
//  Created by Luis Gustavo Oliveira Silva on 07/10/20.
//  Copyright © 2020 Luis Gustavo Oliveira Silva. All rights reserved.
//

import Foundation
protocol ViewLayoutHelper {
    func buildViewHierarchy()
    func setupContraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension ViewLayoutHelper {
    func setupView() {
        buildViewHierarchy()
        setupContraints()
        setupAdditionalConfiguration()
    }
}
