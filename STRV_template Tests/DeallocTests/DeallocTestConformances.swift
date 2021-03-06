//
//  DeallocTestConformances.swift
//  DeallocTestsAppTests
//
//  Created by Daniel Cech on 01/05/2020.
//  Copyright © 2020 STRV. All rights reserved.
//

import DeallocTests
import Foundation
@testable import STRV_template

// MARK: - View Controllers

// SpecificCoordinator
extension SpecificCoordinator: DeallocTestable {}
extension SpecificViewController: DeallocTestable {}
extension SpecificViewModel: DeallocTestable {}

// MARK: - Services & Managers
extension APIManager: DeallocTestable {}
