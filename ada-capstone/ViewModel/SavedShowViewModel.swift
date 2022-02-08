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
    
    func in_db(showDetails: TvSearchResultViewModel) -> Bool {
        if (item.tmdb_id in self.list && item.tmdb_id == showDetails.id) {
            var in_db: Bool = true} else {
                var in_db = false
        }
        return in_db
        }
    
        
    
    func deleteData(savedShow: SavedShow) {
        let db = Firestore.firestore()
        
        db.collection("shows").document(savedShow.id!).delete { error in
            if error == nil {
//                no errors
                DispatchQueue.main.async {
                self.list.removeAll { show in
                    return show.id == savedShow.id
                
            
            }
        }
        
        
    }
        }
    }

//        db.collection("shows").document(savedShow.id!).delete { error in
//            if error == nil {
//                self.list.removeAll {show in
//                    return show.id!
//                    == savedShow.id)
//            }
//        }
//        }
//
        
    
    func getData() {
//        get db reference
        let db = Firestore.firestore()
//        read the documents in the db at a specific path
        db.collection("shows").order(by: "name").addSnapshotListener { snapshot, error in
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
