//
//  NewItemDropdown.swift
//  ARPlot
//
//  Created by Matt Marks on 3/6/20.
//  Copyright © 2020 Matt Marks. All rights reserved.
//

import UIKit

class NewItemDropdown: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    var tableView: UITableView!
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
        tableView = createTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.preferredContentSize = tableView.contentSize
    }
    
    private func createTableView() -> UITableView {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(table)
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.topAnchor),
            table.leftAnchor.constraint(equalTo: view.leftAnchor),
            table.rightAnchor.constraint(equalTo: view.rightAnchor),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Footer
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Tip: Double tap \"+\" to create a QuickPlot.\n"
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.sizeToFit()
        label.bounds.size.height = 2 * label.bounds.height
        table.tableFooterView = label
        
        
        return table
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()

                
        if indexPath.row == 0 {
            cell.imageView?.image = UIImage(systemName: "folder.badge.plus")
            cell.textLabel?.text = "New Folder"
        }
        
        if indexPath.row == 1 {
            cell.imageView?.image = UIImage(systemName: "arkit")
            cell.textLabel?.text = "New Plot"
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
                
        if indexPath.row == 1 {
            let createPlotPopover = UINavigationController(rootViewController: CreatePlotPopover())
            createPlotPopover.modalPresentationStyle = .formSheet
            present(createPlotPopover, animated: true, completion: nil)
        }
        
        
    }
}
