//
//  SearchResultListView.swift
//  ada-capstone
//
//  Created by Kaitlyn Gore on 2/2/22.
//

import Foundation
import SwiftUI

struct SearchResultListView: View {
    
    let results: [TvSearchResultViewModel]
    
    var body: some View {
        List(results) {
            result in SearchResultCellView(searchResult: result)
        }
    }
}
