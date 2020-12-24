//
//  main.swift
//  SwiftBaseHW4
//
//  Created by Владимир Поливников on 24.12.2020.
//

import Foundation

//Every car action
enum EngineActions {
    case start, stop
}

//TrunkCar action
enum BodyLift {
    case up, down
}

//SportCar action
enum EngineAcceleration {
    case on, off
}

//Super class
class Car {
    let model: String
    let year: Int
    var isEngineRunning: Bool = false
    
    init(model: String, year: Int) {
        self.model = model
        self.year = year
    }
    
    func actionToEngine(action: EngineActions) {
        switch action {
        case .start:
            isEngineRunning = true
        case .stop:
            isEngineRunning = false
        }
    }
    
    func specificAction() {
        //Do nothing
    }
    
    func getStatus() {
        print("Car  specification:\n model = \(model), year = \(year)")
        print("Car status:\n engine is running = \(isEngineRunning)")
    }
}



let car = Car(model: "base", year: 2000)
car.getStatus()


