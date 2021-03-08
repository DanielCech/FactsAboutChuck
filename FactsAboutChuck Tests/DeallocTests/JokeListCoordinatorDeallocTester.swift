//
//  JokeListCoordinatorDeallocTester.swift
//  Minted Tests
//
//  Created by Daniel Cech on 12/10/2020.
//  Copyright © 2020 STRV. All rights reserved.
//

import DeallocTests
import Foundation
@testable import Minted
import Swinject

class JokeListCoordinatorDeallocTester: DeallocTester {
    var jokeListCoordinator: JokeListCoordinator? {
        applyAssembliesToContainer()

        return JokeListCoordinator(assembler: assembler, parent: nil)
    }

    func test_jokeListCoordinatorDealloc() {
        presentingController = showPresentingController()

        deallocTests = [
            DeallocTest(objectCreation: { [weak self] _ in
                self?.jokeListCoordinator?.makeJokeListViewController()
            }
            ),

            DeallocTest(
                // swiftlint:disable:next unowned_variable_capture
                objectCreation: { [unowned self] _ in
                    JokeListCoordinator(assembler: self.assembler, parent: nil)
                }
            )
        ]

        let expectation = self.expectation(description: "test_jokeListCoordinatorDealloc")

        performDeallocTest(
            deallocTests: deallocTests,
            expectation: expectation
        )

        waitForExpectations(timeout: 200, handler: nil)
    }

    override func applyAssembliesToContainer() {
        assembler.apply(
            assemblies: [
                ManagerAssembly(),
                ServiceAssembly(),
                ViewModelAssembly()
            ]
        )
    }
}
