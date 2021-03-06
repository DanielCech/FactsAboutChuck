//
//  FactsAboutChuck_Tests.swift
//  FactsAboutChuck Tests
//
//  Created by Jan on 25/05/2020.
//  Copyright © 2020 STRV. All rights reserved.
//

import UIKit
import XCTest

class EnvironmentSetupTests: XCTestCase {
    func testNumberOfScenes() {
        let scenes = UIApplication.shared.connectedScenes

        XCTAssertEqual(scenes.count, 1, "There should be just one scene")
    }

    func testSceneDelegateType() {
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate else {
            XCTFail("No scene delegate")
            return
        }

        XCTAssertEqual(String(describing: TestSceneDelegate.self), String(describing: type(of: sceneDelegate).self), "Testing environment is not set up with 'TestSceneDelegate'")
    }
}
