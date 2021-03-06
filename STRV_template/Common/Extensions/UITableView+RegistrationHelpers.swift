//
//  UITableView.swift
//  STRV Project template
//
//  Created by Jan Kaltoun on 28/12/2018.
//  Copyright © 2018 STRV. All rights reserved.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(_: T.Type) where T: NibLoadableView {
        let nib = UINib(nibName: T.identifier, bundle: Bundle(for: T.self))

        register(nib, forCellReuseIdentifier: T.identifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: NibLoadableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Cell with identifier: \(T.identifier) could not be dequeued!")
        }

        return cell
    }
}
