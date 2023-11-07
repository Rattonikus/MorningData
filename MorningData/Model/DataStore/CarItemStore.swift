//
//  CarItemStore.swift
//  MorningData
//
//  Created by Elkins, Cameron on 11/1/23.
//

import Foundation
import Combine
class CarItemStore: ObservableObject
{
    @Published var cars: [CarItem]
    {
        didSet
        {
            let encoder = JSONEncoder()
            if let encodedCars = try? encoder.encode(cars)
            {
                UserDefaults.standard.set(encodedCars, forKey: "Saved Cars")
            }
        }
    }
    init(cars: [CarItem] = [])
    {
        if let storedOnDevice = UserDefaults.standard.data(forKey: "Saved Cars")
        {
            let decoder = JSONDecoder()
            if let savedCars = try? decoder.decode([CarItem].self, from: storedOnDevice)
            {
                if (cars.count < 20)
                {
                    self.cars = savedCars
                    return
                }
            }
        }
  
        self.cars = cars
    }
}
