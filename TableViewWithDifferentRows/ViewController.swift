//
//  ViewController.swift
//  TableViewWithDifferentRows
//
//  Created by Peter Bassem on 6/3/19.
//  Copyright © 2019 Peter Bassem. All rights reserved.
//

import UIKit
import SVProgressHUD

class ViewController: UIViewController {
    
    enum DataTypes: String, CaseIterable {
        case Type1
        case Type2
        case Type3
    }
    
    var dataArray = [Data]()
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Users"
        setupMyTableView()
        getMyData(URL: "http://192.168.1.64/peter")
    }
    
    func getMyData(URL: String) {
        SVProgressHUD.show()
        NetworkLayer.getData(URL: URL) { (response, error) in
            SVProgressHUD.dismiss()
            if let error = error {
                print(error)
            }
            if let response = response {
                print(response.status)
                guard let data = response.data else { return }
                self.dataArray = data
                self.myTableView.reloadData()
            }
        }
    }
}

