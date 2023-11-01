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
        @State var storedBuckets = BucketDataStore(buckets: loadJSON(from: "buckets2023") as! [BucketListItem])
        WindowGroup
        {
            DataView()
                .environmentObject(storedBuckets)
        }
    }
}
