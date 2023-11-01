//
//  ContentView.swift
//  color
//
//  Created by Elkins, Cameron on 8/30/23.
//

import SwiftUI

struct colorChangeView: View
{
    @State private var backgroundColor : Color = .mint
    @State private var theText : String = "Click"
    
    var body: some View
    {
        ZStack
        {
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            VStack
            {
                Button("Click this", action: chanageBackground)
                    .alert(isPresented: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is Presented@*/.constant(false)/*@END_MENU_TOKEN@*/) {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Alert(title: Text("Alert"))/*@END_MENU_TOKEN@*/
                    }
                Text(theText)
            }
        .padding()
        }
    }

    func changeTheText() -> Void
    {
        theText = "Good job"
    }
    
    func makeRandomColor() -> Color
    {
        let redPercent   : Double = Double (arc4random() % UInt32 (256)) / 255.0
        let greenPercent : Double = Double (arc4random() % UInt32 (256)) / 255.0
        let bluePercent  : Double = Double (arc4random() % UInt32 (256)) / 255.0
        
        return Color(red : redPercent, green : greenPercent, blue : bluePercent)
    }
    
    func chanageBackground() -> Void
    {
        self.backgroundColor = makeRandomColor()
        changeTheText()
    }
    
    
    
    

}

struct ColorChangeView_Previews: PreviewProvider
{
    static var previews: some View
    {
        colorChangeView()
    }
}
