//
//  button.swift
//  ada-capstone
//
//  Created by Kaitlyn Gore on 2/4/22.
//

import Foundation
import SwiftUI

struct ButtonView: View {
    var body: some View {
Button(action: {}) {
    HStack {
        Image(systemName: "plus.circle")
            .font(.system(size: 18))
        Text("Add to My Shows")
            .fontWeight(.semibold)
            .font(.subheadline)
    }
}
.padding()
.foregroundColor(.white)
.background(Color.indigo)
.cornerRadius(40)
    }}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
