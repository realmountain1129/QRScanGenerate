//
//  QRGenerateView.swift
//  QRTest
//
//  Created by Jinsan Kim on 2022/06/12.
//

import SwiftUI

struct QRGenerateView: View {
    
    @State var txt = ""
    
    var body: some View {
        VStack {
            TextField("Enter Data ", text: $txt).textFieldStyle(RoundedBorderTextFieldStyle())
            
            if txt != "" {
                Image(uiImage: UIImage(data: returnData(str: self.txt))!)
                    .resizable()
                    .frame(width: 150, height: 150)
            }
        }
        .padding()
    }
    func returnData(str: String) -> Data {
        let filter = CIFilter(name: "CIQRCodeGenerator")
        let data = str.data(using: .ascii, allowLossyConversion: false)
        filter?.setValue(data, forKey: "inputMessage")
        let image = filter?.outputImage
        let uiimage = UIImage(ciImage: image!)
        return uiimage.pngData()!
    }
}
