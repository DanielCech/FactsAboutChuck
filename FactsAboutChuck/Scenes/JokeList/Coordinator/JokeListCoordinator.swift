//
//  JokeListCoordinator.swift
//  FactsAboutChuck
//
//  Created by Dan Cech on 07/03/2021.
//  Copyright � 2021 STRV. All rights reserved.
//

import Foundation
import Swinject

final class JokeListCoordinator: NavigationControllerCoordinator {
    var parent: JokeListCoordinatorEventHandling?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    let assembler: Assembler

    init(assembler: Assembler, parent: JokeListCoordinatorEventHandling?) {
        self.assembler = assembler
        self.parent = parent
        navigationController = UINavigationController()
    }
}

// MARK: - ViewControllerCoordinator
extension JokeListCoordinator: ViewControllerCoordinator {
    func start() {
        navigationController = UINavigationController(
            rootViewController: makeJokeListViewController()
        )
    }
}
