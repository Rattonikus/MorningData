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
    init(cars: [CarItem] = [])
    {
        self.cars = cars
    }
}
