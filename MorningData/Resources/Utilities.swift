//
//  Utilities.swift
//  MorningData
//
//  Created by Elkins, Cameron on 10/17/23.
//

import Foundation

let demoBucket : BucketListItem = BucketListItem(year: 2132, goal: "Eat the humans", creature: "Xenomorph")
let demoCar : CarItem = CarItem(EngineType: "Manual", MPG: 2, FuelType: "Normal", Classification: "Epic", Make: "Mord Fustang", Model: "Yes", Year: 2)



func loadBucketJSON (from file : String) -> [BucketListItem]
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

func loadJSON (from file : String) -> [CarItem]
{
    do
    {
        if let dataSourceURL = Bundle.main.url(forResource: file, withExtension: "json")
        {
            let data = try! Data(contentsOf: dataSourceURL)
            let decoder = JSONDecoder()
            
            let results = try decoder.decode([CarItem].self, from: data)
            return results
        }
    }
    catch
    {
        print(error.localizedDescription)
    }
    return [] //badbadbad
    
}

func generateRandomEmoji(of emo : String) -> String
{
    var cd = "🐁"
    let start : Int
    let range : Int
    
    if (emo == "face")
    {
        start = 0x1f601
        range = 79
    }
    else if (emo == "symbol")
    {
        start = 0x1f601
        range = 70
    }
    else if (emo == "heart")
    {
        start = 0x1f400
        range = 20
    }
    else
    {
        start = 0x1f498
        range = 52
    }
    
    let unicodeval = start + Int(arc4random_uniform(UInt32(range)))
    let ce = UnicodeScalar(unicodeval)?.description ?? cd
    
    return ce
}
