//
//  DependencyGraphDeallocTester.swift
//  Minted Tests
//
//  Created by Dan Cech on 21.02.2019.
//  Copyright © 2019 STRV. All rights reserved.
//

import DeallocTests
@testable import FactsAboutChuck
import Foundation
import Swinject

/// Dependency graph test - every type that is not connected to a coordinator goes here
class DependencyGraphDeallocTester: DeallocTester {
    func test_dependencyGraphDealloc() {
        presentingController = showPresentingController()

        applyAssembliesToContainer()

        deallocTests = [
            // Services & Managers
            DeallocTest(
                objectCreation: { $0.forceResolve(APIManaging.self) }
            )
        ]

        let expectation = self.expectation(description: "deallocTest test_dependencyGraph")

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
