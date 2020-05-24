//
//  PlotsCollectionViewController.swift
//  ARPlot
//
//  Created by Matt Marks on 2/7/20.
//  Copyright © 2020 Matt Marks. All rights reserved.
//

import UIKit

class PlotsCollectionViewController: UICollectionViewController {
    
    // ********************************************************************** //
    // MARK: - Constants & Variables
    // ********************************************************************** //
    struct Constants {
        static let title: String                 = "Plots"
        static let padding: CGFloat              = 30.0
        static let minCellWidth: CGFloat         = 200.0
        static let maxCellWidth: CGFloat         = 300.0
        static let cellHeightMultiplier: CGFloat = 0.8
    }

    // ********************************************************************** //
    // MARK: - Initialization
    // ********************************************************************** //
    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // ********************************************************************** //
    // MARK: - Lifecycle
    // ********************************************************************** //
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: ItemCollectionViewCell.Constants.reuseIdentifier)
        collectionView.backgroundColor = .systemBackground
        navigationItem.title = Constants.title
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.rightBarButtonItem = createPlusButton()
        navigationItem.leftBarButtonItem = createSettingsButton()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionViewLayout.invalidateLayout()
    }

    // ********************************************************************** //
    // MARK: - UICollectionViewDataSource
    // ********************************************************************** //

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.Constants.reuseIdentifier, for: indexPath) as! ItemCollectionViewCell
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
    
    // ********************************************************************** //
    // MARK: - Navigation Buttons
    // ********************************************************************** //
    private func createPlusButton() -> UIBarButtonItem {
        
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.addTarget(self, action: #selector(plusButtonPressed), for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }
    
    private func createSettingsButton() -> UIBarButtonItem {
        let button = UIButton()
        button.setImage(UIImage(systemName: "gear"), for: .normal)
        button.addTarget(self, action: #selector(settingsButtonPressed), for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }
    
    @objc func plusButtonPressed(_ sender: UIButton) {
        let test = NewItemDropdown()
        test.modalPresentationStyle = .popover
        let presentation = test.presentationController as! UIPopoverPresentationController
        presentation.sourceView = sender
        presentation.sourceRect = sender.bounds
        presentation.permittedArrowDirections = [.up]
        present(test, animated: true)
    }
    
    @objc func settingsButtonPressed(_ sender: UIButton) {
        
    }

}

extension PlotsCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let insets = self.collectionView(collectionView, layout: collectionViewLayout, insetForSectionAt: 0)
        if UITraitCollection.current.horizontalSizeClass == .compact {
            let cellWidth = (collectionView.bounds.width - insets.left - insets.right)
            return CGSize(width: cellWidth, height: Constants.cellHeightMultiplier * cellWidth)
        } else {
            var numItemsPerRow: CGFloat = 1
            var currWidth: CGFloat = 0
            
            while currWidth < Constants.minCellWidth || currWidth > Constants.maxCellWidth {

                numItemsPerRow += 1
                                
                let emptySpace = insets.left + insets.right + ((numItemsPerRow - 1) * Constants.padding)
                
                currWidth = (collectionView.bounds.width - emptySpace)/numItemsPerRow

            }

            return CGSize(width: currWidth, height: Constants.cellHeightMultiplier * currWidth)
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: Constants.padding,
                            left: view.safeAreaInsets.left > 0 ?  view.safeAreaInsets.left : Constants.padding,
                            bottom: Constants.padding,
                            right: view.safeAreaInsets.right > 0 ? view.safeAreaInsets.left : Constants.padding)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.padding
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.padding
    }

    
    
}
