//
//  HorizontalLine.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 5/2/23.
//

import SwiftUI

struct HorizontalLine: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .frame(height: 0.5)
            .foregroundColor(Color.theme.text.opacity(0.2))
    }
}

struct HorizontalLine_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalLine()
    }
}
