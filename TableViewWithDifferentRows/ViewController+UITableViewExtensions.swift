//
//  ViewController+UITableViewExtensions.swift
//  TableViewWithDifferentRows
//
//  Created by Peter Bassem on 6/3/19.
//  Copyright © 2019 Peter Bassem. All rights reserved.
//

import UIKit

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func setupMyTableView() {
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.registerNib(cell: Title1TableViewCell.self)
        myTableView.registerNib(cell: Title2TableViewCell.self)
        myTableView.registerNib(cell: Title3TableViewCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let singleData = dataArray[indexPath.row]
        if singleData.type == DataTypes.Type1.rawValue {
            let cell = myTableView.dequeue(at: indexPath) as Title1TableViewCell
            cell.messageLabel.text = singleData.message
            return cell
        } else if singleData.type == DataTypes.Type2.rawValue {
            let cell = myTableView.dequeue(at: indexPath) as Title2TableViewCell
            cell.messageLabel.text = singleData.message
            cell.message1Label.text = singleData.message2
            return cell
        } else if singleData.type == DataTypes.Type3.rawValue {
            let cell = myTableView.dequeue(at: indexPath) as Title3TableViewCell
            cell.messageLabel.text = singleData.message
            cell.message1Label.text = singleData.message2
            cell.message2Label.text = singleData.message3
            return cell
        } else { return UITableViewCell() }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let singleData = dataArray[indexPath.row]
        if singleData.type == DataTypes.Type1.rawValue {
            let viewController = UIViewController()
            viewController.view.backgroundColor = .red
            present(viewController, animated: true, completion: nil)
        } else if singleData.type == DataTypes.Type2.rawValue {
            let viewController = UIViewController()
            viewController.view.backgroundColor = .green
            present(viewController, animated: true, completion: nil)
        } else if singleData.type == DataTypes.Type3.rawValue {
            let viewController = UIViewController()
            viewController.view.backgroundColor = .blue
            present(viewController, animated: true, completion: nil)
        }
    }
}
