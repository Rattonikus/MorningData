//
//  Utilities.swift
//  MorningData
//
//  Created by Elkins, Cameron on 10/17/23.
//

import Foundation

let demoBucket : BucketListItem = BucketListItem(year: 2132, goal: "Eat the humans", creature: "Xenomorph")

func loadJSON (from file : String) -> [BucketListItem]
{
    do
    {
        if let dataSourceURL = Bundle.main.url(forResource: file, withExtension: "json")
        {
            let data = try! Data(contentsOf: dataSourceURL)
            let decoder = JSONDecoder()
            
            let results = try decoder.decode([BucketListItem].self, from: data)
            return results
        }
    }
    catch
    {
        print(error.localizedDescription)
    }
    return [] //badbadbad
    
}
