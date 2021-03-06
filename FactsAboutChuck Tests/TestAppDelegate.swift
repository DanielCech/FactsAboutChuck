//
//  TestAppDelegate.swift
//  iWeather MVVM
//
//  Created by Jiri Ostatnicky on 13/02/2019.
//  Copyright © 2019 STRV. All rights reserved.
//

@testable import FactsAboutChuck
import UIKit

@objc(TestAppDelegate)
class TestAppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        discardSceneSessions(for: application)

        return true
    }

    private func discardSceneSessions(for application: UIApplication) {
        application.openSessions.forEach {
            application.perform(Selector(("_removeSessionFromSessionSet:")), with: $0)
        }
    }
}

extension TestAppDelegate {
    func application(_: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options _: UIScene.ConnectionOptions) -> UISceneConfiguration {
        guard let name = Configuration.default.sceneManifest?.configurations.applicationScenes.first?.name else {
            fatalError("No scene configuration")
        }

        let configuration = UISceneConfiguration(name: name, sessionRole: connectingSceneSession.role)
        configuration.delegateClass = TestSceneDelegate.self

        return configuration
    }
}
