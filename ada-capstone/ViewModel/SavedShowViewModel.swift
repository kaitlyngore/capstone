//
//  SavedShowViewModel.swift
//  ada-capstone
//
//  Created by Kaitlyn Gore on 2/7/22.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class SavedShowViewModel: ObservableObject {
    @Published var list = [SavedShow]()
    
    func getData() {
//        get db reference
        let db = Firestore.firestore()
//        read the documents in the db at a specific path
        db.collection("shows").getDocuments { snapshot, error in
//            check for errors
            if error == nil {
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async{
                        self.list = snapshot.documents.map { d in
                            
                            return SavedShow(id: d.documentID,
                                             name: d["name"] as? String ?? "",
                                             tmdb_id: d["tmdb_id"] as? String ?? "",
                                             overview: d["overview"] as? String ?? "",
                                             poster_path: d["poster_path"] as? String ?? "",
                                             first_air_date: d["first_air_date"] as? String ?? "",
                                             createdTime: d["created_time"] as? Timestamp)
                            
                        }
                    }
//                    get all the documents and create SavedShows
                    
                }
            } else {
//                handle error
            }
            
        }
    }
}
