//
//  BucketListData.swift
//  MorningData
//
//  Created by Elkins, Cameron on 10/17/23.
//

import Foundation

struct BucketListItem : Codable, Identifiable
{
    var id = UUID()
    var year : Int
    var goal : String
    var creature : String
}
