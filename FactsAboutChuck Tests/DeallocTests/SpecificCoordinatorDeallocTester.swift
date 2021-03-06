//
//  SpecificCoordinatorDeallocTester.swift
//  FactsAboutChuck
//
//  Created by Daniel Cech on 12/10/2020.
//  Copyright © 2020 STRV. All rights reserved.
//

import DeallocTests
@testable import FactsAboutChuck
import Foundation
import Swinject

/// Testing ViewControllers and ViewModels related to SpecificCoordinator
class SpecificCoordinatorDeallocTester: DeallocTester {
    var authenticationCoordinator: SpecificCoordinator? {
        applyAssembliesToContainer()

        return SpecificCoordinator(assembler: assembler, parent: nil)
    }

    func test_specificCoordinatorDealloc() {
        presentingController = showPresentingController()

        deallocTests = [
            // Test ViewControllers
            DeallocTest(
                objectCreation: { [weak self] _ in
                    self?.authenticationCoordinator?.makeSpecificViewController()
                }
            ),

            // Test ViewCoordinator
            DeallocTest(
                // swiftlint:disable:next unowned_variable_capture
                objectCreation: { [unowned self] _ in
                    SpecificCoordinator(assembler: self.assembler, parent: nil)
                }
            )
        ]

        let expectation = self.expectation(description: "deallocTest test_specificCoordinatorDealloc")

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
