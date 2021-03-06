//
//  Thread+Main.swift
//  STRV Project template
//
//  Created by Jakub Kaspar on 05/02/2019.
//  Copyright © 2019 STRV. All rights reserved.
//

import Foundation

extension Thread {
    typealias Block = @convention(block) () -> Void

    private func runOnMain(execute block: Block?) {
        guard let safeBlock = block else {
            return
        }

        if isMainThread {
            safeBlock()
        } else {
            DispatchQueue.main.async {
                safeBlock()
            }
        }
    }

    /// Instead of doing DispatchQueue.main.async { block?() } that would jump at the end of the main queue even if you are on main thread,
    /// use this func to make sure it continues on main thread or jumps to the end of main thread if not called on main thread already.
    ///
    /// - Parameter block: Optional block to be processed on main thread
    static func runOnMain(execute block: Block?) {
        Thread.current.runOnMain(execute: block)
    }
}
