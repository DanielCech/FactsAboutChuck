//
//  String+Localized.swift
//  STRV Project template
//
//  Created by Jan Kaltoun on 30/11/2018.
//  Copyright © 2018 STRV. All rights reserved.
//

import Foundation

public extension String {
    var localized: String {
        NSLocalizedString(self, bundle: Bundle(for: AppDelegate.self), comment: "")
    }
}
