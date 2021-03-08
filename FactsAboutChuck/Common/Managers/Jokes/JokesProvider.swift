//
//  JokesProvider.swift
//  FactsAboutChuck
//
//  Created by Daniel Cech on 08/03/2021.
//  Copyright © 2021 STRV. All rights reserved.
//

import Foundation

enum JokesProvider {
    static let jokes: [Joke] = {
        if
            let jokesFileURL = Bundle.main.url(forResource: "jokes", withExtension: "json"),
            let jsonData = try? Data(contentsOf: jokesFileURL)
        {
            let decoder = JSONDecoder()

            do {
                let jokes = try decoder.decode([Joke].self, from: jsonData)
                return jokes
            } catch {
                print(error.localizedDescription)
            }
        }

        return []
    }()
}
