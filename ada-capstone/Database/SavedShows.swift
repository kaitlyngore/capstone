//
//  SavedShows.swift
//  ada-capstone
//
//  Created by Kaitlyn Gore on 2/6/22.
//

import Foundation

import FirebaseFirestore
import FirebaseFirestoreSwift

class SavedShows: ObservableObject {
    let db = Firestore.firestore()
    
    @Published var shows = [SavedShow]()
    
    init() {
        loadRecentData()
    }
    
    func loadRecentData() {
        db.collection("shows").order(by: "createdTime").addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.shows = querySnapshot.documents.compactMap { document in
                    do {
                        let x = try document.data(as: SavedShow.self)
                        return x
                    }
                catch {
                    print(error)
                }
                return nil
        }
    }
}
}
    func loadAllData() {
        db.collection("shows").order(by: "name").addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.shows = querySnapshot.documents.compactMap { document in
                    do {
                        let x = try document.data(as: SavedShow.self)
                        return x
                    }
                catch {
                    print(error)
                }
                return nil
        }
    }
}
}
}
