//
//  CarRowView.swift
//  MorningData
//
//  Created by Elkins, Cameron on 10/30/23.
//

import SwiftUI

struct CarRowView: View 
{
    var rowCar : CarItem
    var emoji : String
    var body: some View
    {
        HStack
        {
          
            Text(emoji)
                .font (.largeTitle)
           
            VStack
            {
                Text("Year: \(String (rowCar.Year))")
                Text(rowCar.Make)
            }
            
        }
    }
}

#Preview ("Car row")
{
    CarRowView(rowCar: demoCar, emoji: generateRandomEmoji(of: ""))
}
