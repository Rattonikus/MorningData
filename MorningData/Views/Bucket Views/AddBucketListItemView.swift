//
//  AddBucketListItemView.swift
//  MorningData
//
//  Created by Elkins, Cameron on 10/30/23.
//

import SwiftUI

struct AddBucketListItemView: View 
{
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var storedBuckets : BucketDataStore
    @State private var author : String = ""
    @State private var bucketListItem : String = ""
    
    
    init (with author : String, having item : String)
    {
        _author = State(initialValue: author)
        _bucketListItem = State(initialValue: item)
    }
    
    var body: some View
    {
        Form
        {
            Section("Make a new bucket list item")
            {
                InputField(title: "Who made it", hint: "Creature", result: $author)
                InputField(title: "Goal", hint: "What do you wanna do?", result: $bucketListItem)
            }
            if (!author.isEmpty && !bucketListItem.isEmpty)
            {
                Button("add me to list", action: addBucketListItemToDataStore)
            }
        }
    }
    
    private func addBucketListItemToDataStore() -> Void
    {
        let year = Calendar.current.component(.year, from: Date())
        let newBucketListItem = BucketListItem(year: year, goal: bucketListItem, creature: author)
        storedBuckets.buckets.insert(newBucketListItem, at: 0)
        dismiss()
    }
}

#Preview ("Add a bucket list item")
{
    AddBucketListItemView(with : "", having: "")
}
