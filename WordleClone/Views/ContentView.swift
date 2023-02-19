//
//  ContentView.swift
//  WordleClone
//
//  Created by Arthur Ford on 2/17/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var game = Game()
    
    var body: some View {
        VStack(alignment: .center) {
           GameBoard()
                .environmentObject(game)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
