//
//  ViewModelAssembly.swift
//  STRV_template
//
//  Created by Jan Kaltoun on 01/12/2018.
//  Copyright © 2018 STRV. All rights reserved.
//

import Swinject

// swiftlint:disable force_unwrapping
final class ViewModelAssembly: Assembly {
    func assemble(container: Container) {
        container.register(SpecificViewModel.self) { resolver in
            SpecificViewModel(
                service: resolver.resolve(SpecificServicing.self)!
            )
        }.inObjectScope(.graph)
    }
}
