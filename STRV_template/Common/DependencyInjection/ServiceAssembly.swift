//
//  ServicesAssembly.swift
//  STRV_template
//
//  Created by Jan Kaltoun on 29/11/2018.
//  Copyright © 2018 STRV. All rights reserved.
//

import Swinject

// swiftlint:disable force_unwrapping
final class ServiceAssembly: Assembly {
    func assemble(container: Container) {
        container.register(SpecificServicing.self) { resolver in
            SpecificService(
                apiManager: resolver.resolve(APIManaging.self)!
            )
        }.inObjectScope(.container)
    }
}
