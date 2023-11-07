//
//  CarItem.swift
//  MorningData
//
//  Created by Elkins, Cameron on 10/17/23.
//

import Foundation

struct CarItem : Codable, Identifiable
{
    var id = UUID()
    var EngineType : String
    var MPG : Int
    var FuelType : String
    var Classification : String
    var Make : String
    var Model : String
    var Year : Int
}
