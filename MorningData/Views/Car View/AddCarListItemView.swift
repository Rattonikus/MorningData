//
//  AddCarListItemView.swift
//  MorningData
//
//  Created by Elkins, Cameron on 11/9/23.
//

import SwiftUI

struct AddCarListItemView: View 
{
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var storedCars : CarItemStore
    @State private var make : String = ""
    @State private var CarItem : String = ""
    
    
    
    var body: some View
    {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    AddCarListItemView()
}
