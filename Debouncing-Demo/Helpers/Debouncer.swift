//
//  Debouncer.swift
//  Debouncing-Demo
//
//  Created by Adolfo Garza on 9/24/18.
//  Copyright © 2018 Adolfo Garza. All rights reserved.
//

import Foundation

class Debouncer {
    private var callback: (() -> ())
    private var delay: Double
    private weak var timer: Timer?

    init(delay: Double, callback: @escaping (() -> ())) {
        self.delay = delay
        self.callback = callback
    }

    func call() {
        timer?.invalidate()
        let upcomingTimer = Timer.scheduledTimer(timeInterval: delay, target: self, selector: #selector(Debouncer.fire), userInfo: nil, repeats: false)
        timer = upcomingTimer
    }

    @objc private func fire() {
        self.callback()
    }
}
