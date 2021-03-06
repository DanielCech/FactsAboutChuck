//
//  Set+Convenience.swift
//  STRV Project template
//
//  Created by Jakub Kaspar on 05/02/2019.
//  Copyright © 2019 STRV. All rights reserved.
//

extension Set {
    /// Use this for checks instead of !.isEmpty that is triggered as warning by Swiftlint
    var isNotEmpty: Bool {
        !isEmpty
    }
}
