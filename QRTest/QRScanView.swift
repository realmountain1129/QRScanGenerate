//
//  QRScanView.swift
//  QRTest
//
//  Created by Jinsan Kim on 2022/06/12.
//

import SwiftUI
import CodeScanner

struct QRScanView: View {
    
    @State private var isPresentingScanner = false
    @State private var scannedCode: String?
    
    var scannerSheet: some View {
        CodeScannerView(codeTypes: [.qr],
                        completion: { response in
            if case let .success(code) = response {
                self.scannedCode = code.string
                self.isPresentingScanner = false
            }
        })
    }
    
    var body: some View {
        VStack(spacing: 10) {
            if let scannedCode = scannedCode {
                Text(scannedCode)
            }
            
            Button("Scan QR Code") {
                self.isPresentingScanner = true
            }
            
            .sheet(isPresented: $isPresentingScanner) {
                self.scannerSheet
            }
        }
    }
    
}
