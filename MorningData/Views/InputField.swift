//
//  InputField.swift
//  MorningData
//
//  Created by Elkins, Cameron on 10/30/23.
//

import SwiftUI

struct InputField: View 
{
    let title : String
    let hint : String
    
    @Binding var result : String
    
    var body: some View
    {
        Text(title)
            .font(.headline)
            .multilineTextAlignment(.leading)
        TextField(hint, text: $result)
            .autocorrectionDisabled()
    }
}

#Preview ("Input Field Demo")
{
    InputField(title: "the title", hint: "the hint", result: .constant("The bound value"))
}
