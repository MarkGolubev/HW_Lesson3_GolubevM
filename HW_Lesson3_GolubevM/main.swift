//
//  main.swift
//  HW_Lesson3_GolubevM
//
//  Created by Марк Голубев on 13.03.2021.
//

import Foundation

enum BrandCar: String {
    case honda = "Хонда", lada = "Лада", tesla = "Тесла"
}
enum ModelSportCar: String {
    case cicic = "Civic", granta = "Granta", modelS = "S1"
}
enum EngineState: String {
    case turnOn = "Двигатель запущен", turnOff = "Двигатель не запущен"
}

enum CarWindows: String {
    case up = "Закрыты", down = "Открыты"
}

enum BootSportCarCapacity: Double {
    case small = 50.0, medium = 90.0, large = 100.0
}

enum CarLuggageAction {
    case unload, load
}

struct SportCar {
    let brand: BrandCar
    let model: ModelSportCar
    let yearOfMade: Int
    let bootCapacity: BootSportCarCapacity
    var engineState: EngineState{
        willSet {
            if newValue == .turnOn {
                print("!Двигатель будет запущен!")
            } else {
                print("!Двигатель будет остановлен!")
                    }
                }
            }
    var carWindows: CarWindows {
        willSet {
            if newValue == .down {
                print("!Окна будут открыты!")
            } else {
                print("!Окна будут закрыты!")
                    }
                }
            }
    var luggageVolume: Double {
        didSet {
            let newValue = oldValue + luggageVolume
            if newValue > 0 && luggageVolume >= 0 {
            print("!Было загружено \(luggageVolume) л. Теперь в багажнике \(newValue) л!")
            } else if newValue >= 0 && luggageVolume <= 0 {
                print("!Было отгружено \(abs(luggageVolume)) л. Теперь в багажнике \(newValue)!")
            } else if newValue < 0 {
                print("!Было отгружено около \(abs(luggageVolume)) л. Больше выгрузить нечего!")
            }
        }
    }
    
    func showPropertyCar() {
        print("-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|")
        print("Марка машины: \(self.brand.rawValue)")
        print("Модель машины: \(self.model.rawValue)")
        print("Год выпуска: \(self.yearOfMade)")
        print("Вместимость багажника: \(self.bootCapacity.rawValue) л.")
        print("Начальная заполненость багажника: \(self.luggageVolume) л.")
        print("Окна: \( self.carWindows.rawValue)")
        print("-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|")
        }
    
    mutating func turnOnEngine() {
        self.engineState = .turnOn
    }
    
    mutating func turnOfEngine() {
        self.engineState = .turnOff
    }
    
    mutating func closeWindows() {
        self.carWindows = .up
    }
    
    mutating func openWindows() {
        self.carWindows = .down
    }
    mutating func carLuggageAction(action: CarLuggageAction, kg: Double) {
        switch action {
        case CarLuggageAction.load:
            luggageVolume = kg
        default:
            if kg <= bootCapacity.rawValue && kg != 0 {
                luggageVolume =  (-kg)
            } else if kg == 0 {
                print("_______________________________________________")
                print("Это какая-то шутка? Вы не можете отгрузить 0 л!")
                print("_______________________________________________")
            } else {
                print("_______________________________________________")
                print("Вы не можете отгрузить больше чем загружено!")
                print("_______________________________________________")
            }

        }
    }
}

var sportCar1 = SportCar(brand: .tesla, model: .modelS,  yearOfMade: 2019 , bootCapacity:.small, engineState:.turnOff, carWindows:.down, luggageVolume: 0.0)

sportCar1.showPropertyCar()
sportCar1.closeWindows()
sportCar1.turnOnEngine()
sportCar1.carLuggageAction(action: .load, kg: 35)
sportCar1.carLuggageAction(action: .unload, kg: 0)
sportCar1.carLuggageAction(action: .unload, kg: 20)
sportCar1.carLuggageAction(action: .unload, kg: 100)

enum ModelTrunkCar: String {
    case cyberTruck = "Кибер Трак", travel = "Тревел"
}
enum BootTrunkCarCapacity: Double {
    case small = 100.0, midle = 150.0, large = 200.0
}

struct TrunkCar {
    let brand: BrandCar
    let model: ModelTrunkCar
    let yearOfMade: Int
    let bootCapacity: BootTrunkCarCapacity
    var engineState: EngineState{
        willSet {
            if newValue == .turnOn {
                print("!Двигатель будет запущен!")
            } else {
                print("!Двигатель будет остановлен!")
                    }
                }
            }
    var carWindows: CarWindows {
        willSet {
            if newValue == .down {
                print("!Окна будут открыты!")
            } else {
                print("!Окна будут закрыты!")
                    }
                }
            }
    var luggageVolume: Double {
        didSet {
            let newValue = oldValue + luggageVolume
            if newValue > 0 && luggageVolume >= 0 {
            print("!Было загружено \(luggageVolume) л. Теперь в багажнике \(newValue) л!")
            } else if newValue >= 0 && luggageVolume <= 0 {
                print("!Было отгружено \(abs(luggageVolume)) л. Теперь в багажнике \(newValue)!")
            } else if newValue < 0 {
                print("!Было отгружено около \(abs(luggageVolume)) л. Больше выгрузить нечего!")
            }
        }
    }
    
    func showPropertyCar() {
        print("-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|")
        print("Марка машины: \(self.brand.rawValue)")
        print("Модель машины: \(self.model.rawValue)")
        print("Год выпуска: \(self.yearOfMade)")
        print("Вместимость багажника: \(self.bootCapacity.rawValue) л.")
        print("Начальная заполненость багажника: \(self.luggageVolume) л.")
        print("Окна: \( self.carWindows.rawValue)")
        print("-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|")
        }
    
    mutating func turnOnEngine() {
        self.engineState = .turnOn
    }
    
    mutating func turnOfEngine() {
        self.engineState = .turnOff
    }
    
    mutating func closeWindows() {
        self.carWindows = .up
    }
    
    mutating func openWindows() {
        self.carWindows = .down
    }
    mutating func carLuggageAction(action: CarLuggageAction, kg: Double) {
        switch action {
        case CarLuggageAction.load:
            if bootCapacity.rawValue - luggageVolume < kg {
                print("!Вы не можете загрузить больше чем влезает в багажник!")
            } else {
                luggageVolume = kg
            }
        default:
            if kg <= bootCapacity.rawValue && kg != 0 {
                luggageVolume =  (-kg)
            } else if kg == 0 {
                print("_______________________________________________")
                print("Это какая-то шутка? Вы не можете отгрузить 0 л!")
                print("_______________________________________________")
            } else {
                print("_______________________________________________")
                print("Вы не можете отгрузить больше чем загружено!")
                print("_______________________________________________")
            }

        }
    }
}

var trunkCar1 = TrunkCar(brand: .tesla, model: .cyberTruck, yearOfMade: 2020, bootCapacity: .large, engineState: .turnOff, carWindows: .down, luggageVolume: 50.0)

trunkCar1.showPropertyCar()
trunkCar1.closeWindows()
trunkCar1.turnOnEngine()
trunkCar1.carLuggageAction(action: .load, kg: 151)
trunkCar1.carLuggageAction(action: .unload, kg: 1)

