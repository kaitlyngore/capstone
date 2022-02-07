//
//  SavedShow.swift
//  ada-capstone
//
//  Created by Kaitlyn Gore on 2/6/22.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct SavedShow: Codable, Identifiable {
    @DocumentID var id: String?
    var name: String
    var tmdb_id: String
    let overview: String?
    let poster_path: String?
    let first_air_date: String?
    @ServerTimestamp var createdTime: Timestamp?
}
