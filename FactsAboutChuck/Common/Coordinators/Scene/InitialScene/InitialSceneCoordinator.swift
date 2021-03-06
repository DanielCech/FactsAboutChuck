//
//  InitialSceneCoordinator.swift
//  FactsAboutChuck
//
//  Created by Jan on 01/05/2020.
//  Copyright © 2020 STRV. All rights reserved.
//

import Swinject
import UIKit

final class InitialSceneCoordinator {
    var childCoordinators = [Coordinator]()

    let assembler: Assembler
    private let window: UIWindow

    init(window: UIWindow, assembler: Assembler) {
        self.window = window
        self.assembler = assembler
    }
}

// MARK: - SceneCoordinating
extension InitialSceneCoordinator: InitialSceneCoordinating {
    func start() {
        let coordinator = makeSpecificView()
        childCoordinators.append(coordinator)
        coordinator.start()

        window.rootViewController = coordinator.rootViewController
        window.makeKeyAndVisible()
    }
}

//// MARK: - SpecificCoordinatorEventHandling
// extension InitialSceneCoordinator: SpecificCoordinatorEventHandling {
//    func handle(event _: SpecificCoordinatorEvent) {
//        // TODO: Handle event
//    }
// }
//
//// MARK: - Factories
// private extension InitialSceneCoordinator {
//    func makeSpecificView() -> SpecificCoordinator {
//        let coordinator = SpecificCoordinator(assembler: assembler, parent: self)
//
//        return coordinator
//    }
// }
