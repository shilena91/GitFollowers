//
//  UITableView+Ext.swift
//  GitFollowers
//
//  Created by Hoang on 26.5.2020.
//  Copyright © 2020 Hoang. All rights reserved.
//

import UIKit

extension UITableView {
    
    func reloadTableViewOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
    
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
