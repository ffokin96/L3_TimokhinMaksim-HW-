//
//  main.swift
//  L3_TimokhinMaksim(HW)
//
//  Created by Максим Тимохин on 24.07.2020.
//  Copyright © 2020 Максим Тимохин. All rights reserved.
//

import Foundation


enum Manufacture: String {
    case bmw, mersedes, maz, kamaz
}

enum CarAction {
    case trunkLoad(weight: Int)
    case trunkUnLoad(weight: Int)
}

struct SportCar {
    var manufacture: Manufacture
    var releaseYear: Int
    var trunkValue: Int
    var trunkValueMax: Int
    var isEngineOn: Bool
    var isWindowOn: Bool
    var isTrunkFull: Bool
    
    mutating func turnEngine(on: Bool) {
        print("Двигатель \(manufacture.rawValue) \(on ? ("включен", isEngineOn = true) : ("выключен", isEngineOn = false))")
    }
    mutating func openWindow(on: Bool) {
        print("Окна \(manufacture.rawValue) \(on ? ("открыты", isWindowOn = true) : ("закрыты", isWindowOn = false))")
    }
    
    mutating func pushLoad(action: CarAction){
        switch action {
        case let .trunkLoad(weight):
            if trunkValueMax < trunkValue + weight {
                print("Мало места, осталось \(trunkValueMax - trunkValue)")
            } else  {
                trunkValue = trunkValue + weight
                print("Успешно погружены \(trunkValue)")
            }
            if trunkValue == trunkValueMax {
                isTrunkFull = true}
        case let .trunkUnLoad(weight):
            if trunkValue - weight < 0 {
                print("Неа, в багажнике сейчас \(trunkValue)")
            } else {
                trunkValue = trunkValue - weight
                print("Выгруженно \(trunkValue)")
            }
        }
    }
    mutating func isFull (on: Bool) {
        
    }
    init?(manufacture: Manufacture) {
        if manufacture == .bmw {
            releaseYear = 2020
            trunkValue = 0
            isEngineOn = false
            isWindowOn = false
            isTrunkFull = false
            trunkValue = 0
            trunkValueMax = 1000
        } else {
            releaseYear = 2020
            trunkValue = 0
            isEngineOn = false
            isWindowOn = false
            isTrunkFull = false
            trunkValue = 0
            trunkValueMax = 1000
        }
        self.manufacture = manufacture
    }
}

struct TrunkCar {
    var manufacture: Manufacture
    var releaseYear: Int
    var trunkValue: Int
    var trunkValueMax: Int
    var isEngineOn: Bool
    var isWindowOn: Bool
    var isTrunkFull: Bool
    
    mutating func turnEngine(on: Bool) {
        print("Двигатель \(manufacture.rawValue) \(on ? ("включен", isEngineOn = true) : ("выключен", isEngineOn = false))")
    }
    mutating func openWindow(on: Bool) {
        print("Окна \(manufacture.rawValue) \(on ? ("открыты", isWindowOn = true) : ("закрыты", isWindowOn = false))")
    }
    
    mutating func pushLoad(action: CarAction){
        switch action {
        case let .trunkLoad(weight):
            if trunkValueMax < trunkValue + weight {
                print("Мало места, осталось \(trunkValueMax - trunkValue)")
            } else  {
                trunkValue = trunkValue + weight
                print("Успешно погружены \(trunkValue)")
            }
            if trunkValue == trunkValueMax {
                isTrunkFull = true}
        case let .trunkUnLoad(weight):
            if trunkValue - weight < 0 {
                print("Неа, в багажнике сейчас \(trunkValue)")
            } else {
                trunkValue = trunkValue - weight
                print("Выгруженно \(trunkValue)")
            }
        }
    }
    mutating func isFull (on: Bool) {
        
    }
    init?(manufacture: Manufacture) {
        if manufacture == .kamaz {
            releaseYear = 2020
            trunkValue = 0
            isEngineOn = false
            isWindowOn = false
            isTrunkFull = false
            trunkValue = 0
            trunkValueMax = 10000
        } else {
            releaseYear = 2020
            trunkValue = 0
            isEngineOn = false
            isWindowOn = false
            isTrunkFull = false
            trunkValue = 0
            trunkValueMax = 5000
        }
        
        self.manufacture = manufacture
    }
}

var mersedes = SportCar(manufacture: .mersedes)
mersedes?.turnEngine(on: false)
mersedes?.openWindow(on: true)
mersedes?.pushLoad(action: .trunkLoad(weight: 1000))

var kamaz = TrunkCar(manufacture: .kamaz)
kamaz?.turnEngine(on: true)
kamaz?.openWindow(on: false)
kamaz?.pushLoad(action: .trunkLoad(weight: 2000))
kamaz?.pushLoad(action: .trunkUnLoad(weight: 1000))

print(mersedes)
print(kamaz)
