//
//  JokeListCoordinatorEventHandling.swift
//  FactsAboutChuck
//
//  Created by Dan Cech on 07/03/2021.
//  Copyright � 2021 STRV. All rights reserved.
//

import Foundation

enum JokeListCoordinatorEvent {}

protocol JokeListCoordinatorEventHandling {
    func handle(event: JokeListCoordinatorEvent)
}
