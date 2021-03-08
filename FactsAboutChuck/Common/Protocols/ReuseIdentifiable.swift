//
//  ReuseIdentifiable.swift
//  FactsAboutChuck
//
//  Created by Daniel Cech on 08/03/2021.
//  Copyright © 2021 STRV. All rights reserved.
//

import UIKit

protocol ReuseIdentifiable {
    static func reuseIdentifier() -> String
}

extension ReuseIdentifiable {
    static func reuseIdentifier() -> String {
        String(describing: self)
    }
}

extension UITableViewCell: ReuseIdentifiable {}
extension UICollectionViewCell: ReuseIdentifiable {}
