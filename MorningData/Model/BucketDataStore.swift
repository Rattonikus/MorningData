//
//  BucketDataStore.swift
//  MorningData
//
//  Created by Elkins, Cameron on 10/30/23.
//

import Foundation
import Combine
class BucketDataStore: ObservableObject
{
    @Published var buckets: [BucketListItem]
    {
        didSet
        {
            let encoder = JSONEncoder()
            if let encodedBuckets = try? encoder.encode(buckets)
            {
                UserDefaults.standard.set(encodedBuckets, forKey: "Saved Buckets")
            }
        }
    }
    init(buckets: [BucketListItem] = [])
    {
        self.buckets = buckets
    }
}

let definitionBrochure = Bundle.main.url(forResource: "whatisrandom", withExtension: "pdf")!
