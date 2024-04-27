//
//  Semaphore.swift
//  
//
//  Created by Joshua Davis on 4/26/24.
//

actor Semaphore {
    private(set) var value: Int = 0

    func up() {
        value += 1
    }

    func down() {
        if value == 0 {
            // TODO: can i wait?
            fatalError("SEMAPHORE DROPPED BELOW 0")
        }
        value -= 1
    }
}
