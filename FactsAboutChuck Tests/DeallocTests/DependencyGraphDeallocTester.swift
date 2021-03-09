//
//  DependencyGraphDeallocTester.swift
//  FactsAboutChuck
//
//  Created by Dan Cech on 08/03/2021.
//  Copyright � 2021 STRV. All rights reserved.
//

import DeallocTests
@testable import FactsAboutChuck
import Foundation
import Swinject

/// Dependency graph test - every type that is not connected to a coordinator goes here
class DependencyGraphDeallocTester: DeallocTester {
    func test_dependencyGraphDealloc() {
        applyAssembliesToContainer()

        deallocTests = [
            // Services & Managers
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
