//
//  ManagerAssembly.swift
//  FactsAboutChuck
//
//  Created by Jan Kaltoun on 01/12/2018.
//  Copyright © 2018 STRV. All rights reserved.
//

import Swinject

final class ManagerAssembly: Assembly {
    func assemble(container: Container) {
        container.register(APIManaging.self) { _ in
            APIManager()
        }.inObjectScope(.container)
    }
}
