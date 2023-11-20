//
//  MorningDataApp.swift
//  MorningData
//
//  Created by Elkins, Cameron on 10/17/23.
//

import SwiftUI

@main
struct MorningDataApp: App 
{
    var body: some Scene 
    {
        @StateObject var storedBuckets = BucketDataStore(buckets: loadBucketJSON(from: "buckets2023") )
        @StateObject var storedCars = CarItemStore(cars: loadJSON(from: "carsClean") )
        WindowGroup
        {
            DataView()
                .environmentObject(storedBuckets)
                .environmentObject(storedCars)
        }
    }
}

