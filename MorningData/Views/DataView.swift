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
    @EnvironmentObject var carData : CarItemStore
    
    @State private var searchedText : String = ""
    @State private var showAddBucketListItems : Bool = false
    @State private var showAddCarListItems : Bool = false
    @State private var canShowBuckets : Bool = false
    @State private var canShowCar : Bool = false
    
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
    
    
    private var filteredCarResult : [CarItem]
    {
        if(searchedText.isEmpty)
        {
             return carData.cars
        }
        else
        {
            return carData.cars.filter
            {
                $0.Model.lowercased().contains(searchedText.lowercased())
                ||
                $0.Make.lowercased().contains(searchedText.lowercased())
                ||
                String($0.Year) == searchedText
            }
        }
        
    }
    
    
    
    var body: some View
    {
        NavigationStack
        {
            List
            {
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
                    ForEach(filteredCarResult.indices, id: \.self)
                    {
                        index in
                        
                        CarRowView(rowCar: filteredCarResult[index], emoji: generateRandomEmoji(of: "Face"))
                    }

                    
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
        .sheet(isPresented: $showAddCarListItems)
        {
            AddCarListItemView(with: "Your make", having: "Your model")
    
        }
        
        .listStyle(SidebarListStyle())

    
    }
    
    private func removeBucketItems(at offsets : IndexSet) -> Void
    {
        bucketData.buckets.remove(atOffsets: offsets)
    }
}



#Preview ("Data View")
{
    DataView()
        .environmentObject(BucketDataStore(buckets: loadBucketJSON(from: "buckets2023") as! [BucketListItem]))
        .environmentObject(CarItemStore(cars: loadJSON(from: "carsClean") as! [CarItem]))
}
