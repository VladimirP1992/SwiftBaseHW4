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

//TrunkCar and SportCar actions
enum SpecificActions {
    case liftBodyUp, liftBodyDown
    case accelerateEngineOn, accelerateEngineOff
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
    
    func specificAction(action: SpecificActions) {
        //Do nothing
    }
    
    func getStatus() {
        print("Car  specification:\n model = \(model), year = \(year)")
        print("Car status:\n engine is running = \(isEngineRunning)")
    }
}

class TrunkCar: Car {
    
    let numberOfAxles: Int
    var isBodyLiftedUp: Bool = false
    
    init(model: String, year: Int, numberOfAxles: Int) {
        self.numberOfAxles = numberOfAxles
        super.init(model: model, year: year)
    }
    
    override func specificAction(action: SpecificActions) {
        switch  action {
        case .liftBodyUp:
            isBodyLiftedUp = true
            print("TrunkCars body was lifted up")
        case .liftBodyDown:
            isBodyLiftedUp = false
            print("TrunkCars body was lifted down")
        case .accelerateEngineOn:
            print("TrunkCar has no such option!")
        case .accelerateEngineOff:
            print("TrunkCar has no such option!")
        }
    }
    
    override func getStatus() {
        super.getStatus()
        print("Body is lifted up = \(isBodyLiftedUp)")
        print("Number of axles = \(numberOfAxles)")
    }
}

class SportCar: Car {
    
    let numberOfSeats: Int
    var isEngineAccelerationOn: Bool = false
    
    init(model: String, year: Int, numberOfSeats: Int) {
        self.numberOfSeats = numberOfSeats
        super.init(model: model, year: year)
    }
    
    override func specificAction(action: SpecificActions) {
        switch  action {
        case .liftBodyUp:
            print("SportCar has no such option!")
        case .liftBodyDown:
            print("SportCar has no such option!")
        case .accelerateEngineOn:
            isEngineAccelerationOn = true
            print("SportCars engine acceleration turned on")
        case .accelerateEngineOff:
            isEngineAccelerationOn = false
            print("SportCars engine acceleration turned off")
        }
    }
    
    override func getStatus() {
        super.getStatus()
        print("Engine acceleration turned on = \(isEngineAccelerationOn)")
        print("Number of seats = \(numberOfSeats)")
    }
}

let car = Car(model: "base", year: 2000)
car.getStatus()
print()

let trunkCar = TrunkCar(model: "Ford", year: 2005, numberOfAxles: 4)
trunkCar.specificAction(action: .liftBodyUp)
trunkCar.getStatus()
print()

let sportCar = SportCar(model: "Ferrari", year: 2020, numberOfSeats: 1)
sportCar.actionToEngine(action: .start)
sportCar.specificAction(action: .accelerateEngineOn)
sportCar.getStatus()

