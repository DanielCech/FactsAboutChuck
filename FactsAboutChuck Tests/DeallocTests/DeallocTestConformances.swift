//
//  DeallocTestConformances.swift
//  FactsAboutChuck
//
//  Created by Dan Cech on 08/03/2021.
//  Copyright � 2021 STRV. All rights reserved.
//

import DeallocTests
@testable import FactsAboutChuck
import Foundation

extension JokeListCoordinator: DeallocTestable {}

extension JokeListViewModel: DeallocTestable {}

extension JokeListViewController: DeallocTestable {}
