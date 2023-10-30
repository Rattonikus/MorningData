//
//  ContentView.swift
//  MorningData
//
//  Created by Elkins, Cameron on 10/17/23.
//

import SwiftUI

struct DataView: View 
{
    @ObservedObject var bucketData = BucketDataStore(buckets: loadJSON(from: "buckets2023") as! [BucketListItem])
    
    @State private var searchedText : String = ""
    
    private var filteredBucketListResult : [BucketListItem]
    {
        if(searchedText.isEmpty)
        {
            return bucketData.buckets
        }
        else
        {
            return bucketData.buckets.filter
            {
                $0.goal.lowercased().contains(searchedText.lowercased())
                ||
                $0.creature.lowercased().contains(searchedText.lowercased())
                ||
                String($0.year) == searchedText
            }
        }
        
    }
    
    
    var body: some View
    {
        NavigationStack
        {
            
            VStack 
            {
                List
                {
                    Section("Buckets")
                    {
                        ForEach(bucketData.buckets)
                        {
                            bucket in
                            
                            BucketRowView(rowBucket: bucket, emoji: generateRandomEmoji(of: "Face"))
                        }
                        .onDelete(perform: removeBucketItems)
                    }
                }
                .searchable(text: $searchedText)
            }

          
        }
        .padding()
    }
    
    private func removeBucketItems(at offsets : IndexSet) -> Void
    {
        bucketData.buckets.remove(atOffsets: offsets)
    }
}

#Preview ("Data View")
{
    DataView()
}
