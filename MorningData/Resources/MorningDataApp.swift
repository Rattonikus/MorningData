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
        @State var storedBuckets = BucketDataStore(buckets: loadBucketJSON(from: "buckets2023") as! [BucketListItem])
        @State var storedCars = CarItemStore(cars: loadJSON(from: "carsClean") as! [CarItem])
        WindowGroup
        {
            DataView()
                .environmentObject(storedBuckets)
        }
    }
}
