//
//  UITableView+Extensions.swift
//  TableViewWithDifferentRows
//
//  Created by Peter Bassem on 6/3/19.
//  Copyright © 2019 Peter Bassem. All rights reserved.
//

import UIKit

extension UITableView {
    
    func registerNib<Cell: UITableViewCell>(cell: Cell.Type) {
        let nibName = String(describing: Cell.self)
        self.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
    }
    
    func dequeue<Cell: UITableViewCell>(at indexPath: IndexPath) -> Cell {
        let nibName = String(describing: Cell.self)
        guard let cell = self.dequeueReusableCell(withIdentifier: nibName, for: indexPath) as? Cell else {
            fatalError("Cannot Dequeue cell")
        }
        return cell
    }
}
