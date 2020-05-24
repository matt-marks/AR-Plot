//
//  MainTabBarController.swift
//  ARPlot
//
//  Created by Matt Marks on 2/7/20.
//  Copyright © 2020 Matt Marks. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let plots     = PlotsCollectionViewController()
        let favorites = FavoritesCollectionViewController()
        let search    = SearchCollectionViewController()
        
        plots.tabBarItem     = UITabBarItem(title: "Plots", image: UIImage(systemName: "rectangle.grid.3x2"), selectedImage: UIImage(systemName: "rectangle.grid.3x2.fill"))
        favorites.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "bookmark"), selectedImage: UIImage(systemName: "bookmark.fill"))
        search.tabBarItem    = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
        
        viewControllers = [
            UINavigationController(rootViewController: plots),
            UINavigationController(rootViewController: favorites),
            UINavigationController(rootViewController: search),
        ]

    }
    
}
