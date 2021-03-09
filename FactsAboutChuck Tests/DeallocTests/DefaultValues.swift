//
//  DefaultValues.swift
//  FactsAboutChuck
//
//  Created by Dan Cech on 09/03/2021.
//  Copyright � 2021 STRV. All rights reserved.
//

import DeallocTests
@testable import FactsAboutChuck
import Foundation
import RxCocoa
import RxSwift

// TODO: Definition of default values for custom types here

// extension Country: DefaultInitializable {
//     public static var defaultValue: Country {
//         Country(code: .defaultValue, name: .defaultValue)
//     }
// }

extension Joke: DefaultInitializable {
    public static var defaultValue: Joke {
        Joke(id: .defaultValue, joke: .defaultValue, categories: [])
    }
}
