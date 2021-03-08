//
//  JokeListItemType.swift
//  FactsAboutChuck
//
//  Created by Dan Cech on 08/03/2021.
//  Copyright � 2021 STRV. All rights reserved.
//

import UIKit

enum JokeListItemType: String, Codable, CaseIterable {
    case personalInformation
    case emailAddress
    case password
    case subscription
    case familyJokeList
    case notifications
    case darkMode
    case aboutHarbor
    case referFriends
    case reportBug
    case help
    case termsAndConditions
}
