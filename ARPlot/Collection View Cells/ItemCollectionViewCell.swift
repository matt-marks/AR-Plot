
//
//  ItemCollectionViewCell.swift
//  ARPlot
//
//  Created by Matt Marks on 2/28/20.
//  Copyright © 2020 Matt Marks. All rights reserved.
//

import UIKit


enum ItemCollectionViewCellState {
    case Folder, Plot
}

class ItemCollectionViewCell: UICollectionViewCell {
    
    
    // ********************************************************************** //
    // MARK: - Constants & Variables
    // ********************************************************************** //
    struct Constants {
        static let reuseIdentifier: String = "ItemCollectionViewCell"
    }
    
    private var iconView: UIView!
    private var titleLabel: UILabel!
    private var subtitleLabel: UILabel!
    
    
    // ********************************************************************** //
    // MARK: - Initialization
    // ********************************************************************** //
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemGray
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // ********************************************************************** //
    // MARK: - Labels
    // ********************************************************************** //
    private func createTitleLabel() -> UILabel {
        let label = UILabel()
        return label
    }
    
    private func createSubtitleLabel() -> UILabel {
        let label = UILabel()
        return label
    }
    
    
}
