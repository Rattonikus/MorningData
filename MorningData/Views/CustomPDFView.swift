//
//  CustomPDFView.swift
//  MorningData
//
//  Created by Elkins, Cameron on 10/30/23.
//

import SwiftUI
import PDFKit

struct CustomPDFView: View
{
    var body: some View
    {
        PDFKitRepresentedView(documentURL: definitionBrochure)
            .accessibilityLabel("PDF Viewer")
            .accessibilityValue("Brochure about Computing Definitions, mostly malware related.")
    }
}

struct PDFKitRepresentedView : UIViewRepresentable
{
    let documentURL : URL
        
    init(documentURL : URL)
    {
        self.documentURL = documentURL
    }
    
    func makeUIView(context : Context) -> some UIView
    {
        let pdfView : PDFView = PDFView()
        
        pdfView.document = PDFDocument(url: self.documentURL)
        pdfView.autoScales = true
        pdfView.displayDirection = .vertical
        pdfView.minScaleFactor = 0.5
        pdfView.maxScaleFactor = 5.0
        
        return pdfView
    }
    
    func updateUIView(_ uiView : UIViewType, context : Context) -> Void
    {
        
    }

}


#Preview ("Custom PDF Viewer")
{
    CustomPDFView()
}
