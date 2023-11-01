//
//  BucketRowView.swift
//  MorningData
//
//  Created by Elkins, Cameron on 10/30/23.
//

import SwiftUI

struct BucketRowView: View 
{
    var rowBucket : BucketListItem
    var emoji : String
    var body: some View
    {
        HStack
        {
          
            Text(emoji)
                .font (.largeTitle)
           
            VStack
            {
                Text("Year: \(String (rowBucket .year))")
                Text(rowBucket.creature)
            }
            
        }
    }
}

#Preview ("Bucket Row")
{
    BucketRowView(rowBucket: demoBucket, emoji: generateRandomEmoji(of: ""))
}
