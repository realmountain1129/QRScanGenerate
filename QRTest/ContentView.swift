//
//  ContentView.swift
//  QRTest
//
//  Created by Jinsan Kim on 2022/06/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        QRGenerateView()
        QRScanView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
