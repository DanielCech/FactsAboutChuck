//
//  JokeDetailViewEventHandling.swift
//  FactsAboutChuck
//
//  Created by Dan Cech on 09/03/2021.
//  Copyright � 2021 STRV. All rights reserved.
//

import Foundation

enum JokeDetailViewEvent {}

protocol JokeDetailViewEventHandling: AnyObject {
    func handle(event: JokeDetailViewEvent)
}
