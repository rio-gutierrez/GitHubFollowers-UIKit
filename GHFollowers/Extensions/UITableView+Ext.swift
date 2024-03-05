//
//  UITableView+Ext.swift
//  GHFollowers
//
//  Created by Mario Luis on 2/11/24
//

import UIKit

extension UITableView {
    
    func reloadDataOnMainThread() {
        DispatchQueue.main.async { self.reloadData() }
    }
    

    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
