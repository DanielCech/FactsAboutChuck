//
//  SpecificCoordinator.swift
//  FactsAboutChuck
//
//  Created by Jan on 07/08/2020.
//  Copyright © 2020 STRV. All rights reserved.
//

import Foundation
import Swinject

final class SpecificCoordinator {
    var parent: SpecificCoordinatorEventHandling?
    var childCoordinators = [Coordinator]()

    let assembler: Assembler

    lazy var rootViewController: UIViewController = makeSpecificViewController()

    init(assembler: Assembler, parent: SpecificCoordinatorEventHandling?) {
        self.assembler = assembler
        self.parent = parent
    }
}

// MARK: - View Controller Factory
extension SpecificCoordinator {
    func makeSpecificViewController() -> SpecificViewController {
        // DO NOT FORGET TO ADD VIEW MODEL TO `ViewModelAssembly.swift`
        let viewController = R.storyboard.specificViewController.instantiateInitialViewController(
            viewModel: resolve(SpecificViewModel.self)
        )

        viewController.coordinator = self

        return viewController
    }
}

// MARK: - ViewControllerCoordinator
extension SpecificCoordinator: ViewControllerCoordinator {
    func start() {}
}

// MARK: - SpecificViewEventHandling
extension SpecificCoordinator: SpecificViewEventHandling {
    func handle(event _: SpecificViewEvent) {
        // TODO: Handle event
    }
}
