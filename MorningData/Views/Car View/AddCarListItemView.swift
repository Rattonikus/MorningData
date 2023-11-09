//
//  AddCarListItemView.swift
//  MorningData
//
//  Created by Elkins, Cameron on 11/9/23.
//

import SwiftUI

struct AddCarListItemView: View 
{
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var storedCars : CarItemStore
    @State private var make : String = ""
    @State private var carItem : String = ""
    
    init (with make: String, having item : String)
    {
        _make = State(initialValue: make)
        _carItem = State(initialValue: item)
    }
    
    var body: some View
    {
        Form
        {
            Section("Make a new car")
            {
                InputField(title: "Who made it", hint: "Make", result: $make)
                InputField(title: "Whats the model", hint: "model", result: $carItem)
            }
            if(!make.isEmpty && !carItem.isEmpty)
            {
                Button("Add me to list", action: addCarListItemToDataStore)
            }
        }
    }
    private func addCarListItemToDataStore() -> Void
    {
        let year = Calendar.current.component(.year, from: Date())
        
        let newCarItem = CarItem(EngineType: "", MPG: 23, FuelType: "", Classification: "", Make: make, Model: carItem, Year: year)
        storedCars.cars.insert(newCarItem, at: 0)
        dismiss()
    }
    
    
    
}

#Preview ("Add a car")
{
    AddCarListItemView(with: "", having: "")
}
