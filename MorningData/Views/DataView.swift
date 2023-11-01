//
//  ContentView.swift
//  MorningData
//
//  Created by Elkins, Cameron on 10/17/23.
//

import SwiftUI

struct DataView: View
{
    @EnvironmentObject var bucketData : BucketDataStore
    @ObservedObject var carData = CarItemStore(cars: loadJSON(from: "carsClean") as! [CarItem])
    
    @State private var searchedText : String = ""
    @State private var showAddBucketListItems : Bool = false
    @State private var canShowBuckets : Bool = false
    @State private var canShowCar : Bool = false
    
    @State private var sec1 : Int = 0
    @State private var sec2 : Bool = false
    
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
            List
            {
                Section("Settings")
                {
                    Button("Show buckts", action: showBucket)
                    Button("Show cars", action: showCar)
                }
                Section("Buckets", isExpanded: $canShowBuckets)
                {
                    ForEach(filteredBucketListResult)
                    {
                        bucket in
                        
                        BucketRowView(rowBucket: bucket, emoji: generateRandomEmoji(of: "Face"))
                    }
                    .onDelete(perform: removeBucketItems)
                }
                Section("Cars", isExpanded: $canShowCar)
                {
                    ForEach(carData.cars.indices, id: \.self)
                    {
                        index in
                        
                        CarRowView(rowCar: carData.cars[index], emoji: generateRandomEmoji(of: "Face"))
                    }

                    
                }
                Section("Unfinished")
                {
                    Button("Testt", action: sec3)
                }
                
            }
            .searchable(text: $searchedText)
            .navigationTitle("Data and Information")
            .toolbar
            {
                
                ToolbarItem(placement: .topBarLeading)
                {
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing)
                {
                    Button (action: {self.showAddBucketListItems.toggle()})
                    {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $showAddBucketListItems)
        {
            AddBucketListItemView(with: "Your name", having: "your goal")
        }
        .sheet(isPresented: $sec2)
        {
            colorChangeView()
        }
    }
    
    private func removeBucketItems(at offsets : IndexSet) -> Void
    {
        bucketData.buckets.remove(atOffsets: offsets)
    }
    
    private func sec3()
    {
        sec1 += 1
        if sec1 == 10
        {
            sec2 = true
        }
        else
        {
            sec2 = false
        }
    }
    private func showCar()
    {
        canShowCar.toggle()
    }
    private func showBucket()
    {
        canShowBuckets.toggle()
    }
    
}



#Preview ("Data View")
{
    DataView()
        .environmentObject(BucketDataStore(buckets: loadJSON(from: "buckets2023") as! [BucketListItem]))
}
