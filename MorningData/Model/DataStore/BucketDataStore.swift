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
        if let storedOnDevice = UserDefaults.standard.data(forKey: "Saved Buckets")
        {
            let decoder = JSONDecoder()
            if let savedBuckets = try? decoder.decode([BucketListItem].self, from: storedOnDevice)
            {
                if (buckets.count < 20)
                {
                    self.buckets = savedBuckets
                    return
                }
            }
        }
  
        self.buckets = buckets
    }
}

let definitionBrochure = Bundle.main.url(forResource: "whatisrandom", withExtension: "pdf")!
