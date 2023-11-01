//
//  CarDetailView.swift
//  MorningData
//
//  Created by Elkins, Cameron on 10/30/23.
//

import SwiftUI

struct CarDetailView: View
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
                Text("Year: \(String (rowCar.Model))")
                Text(rowCar.Make)
            }
            
        }
    }
}

#Preview {
    CarDetailView(rowCar : demoCar, emoji: generateRandomEmoji(of: ""))
}
