//
//  JokeListCoordinatorDeallocTester.swift
//  FactsAboutChuck
//
//  Created by Dan Cech on 09/03/2021.
//  Copyright � 2021 STRV. All rights reserved.
//

import DeallocTests
@testable import FactsAboutChuck
import Foundation
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

            DeallocTest(objectCreation: { [weak self] _ in
                self?.jokeListCoordinator?.makeJokeDetailViewController(joke: .defaultValue)
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
