//
//  LetterBox.swift
//  WordleClone
//
//  Created by Arthur Ford on 2/17/23.
//

import SwiftUI

struct LetterBox: View {
    
    @EnvironmentObject var game: Game

    var letter: Letter?
    var boxSize = 60.0
    var letterFontSize: CGFloat {
        boxSize * 0.66
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .stroke(style: .init(lineWidth: 4, lineCap: .square, lineJoin: .miter, miterLimit: .infinity))
            Rectangle()
                .fill(letter?.status == .inPosition ? .green : letter?.status == .notInPosition ? .yellow : .white)
            Text(letter?.letter ?? "")
                .font(.system(size: letterFontSize))
        }
        .frame(width: boxSize, height: boxSize)
    }
}

struct LetterBox_Previews: PreviewProvider {
    static var previews: some View {
        LetterBox()
            .environmentObject(Game())
    }
}
