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
    @ServerTimestamp var createdTime: Timestamp?
}
