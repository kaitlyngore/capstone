//
//  SearchResultCellVie.swift
//  ada-capstone
//
//  Created by Kaitlyn Gore on 2/2/22.
//

import Foundation
import SwiftUI

struct SearchResultCellView: View {

    let searchResult: TvSearchResultViewModel

    var body: some View {
        HStack(spacing: 20) {
            Text(searchResult.name)
            Spacer()
            Image(systemName: "arrow.forward.circle.fill")
        }
    }
}
