//
//  Joke.swift
//  FactsAboutChuck
//
//  Created by Daniel Cech on 08/03/2021.
//  Copyright © 2021 STRV. All rights reserved.
//

import Foundation

struct Joke: Codable {
    var id: Int
    var joke: String
    var categories: [String]
}
