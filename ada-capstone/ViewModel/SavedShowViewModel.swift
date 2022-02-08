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
    
    
    let db = Firestore.firestore()
    
    
    
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
    
    
    func getData() {
        //        get db reference
        let db = Firestore.firestore()
        //        read the documents in the db at a specific path
        db.collection("shows").order(by: "name").addSnapshotListener { snapshot, error in
            //            check for errors
            if error == nil {
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async {
                        self.list = snapshot.documents.map { d in
                            
                            return SavedShow(id: d.documentID,
                                             name: d["name"] as? String ?? "",
                                             tmdb_id: d["tmdb_id"] as? Int ?? -1,
                                             overview: d["overview"] as? String ?? "",
                                             poster_path: d["poster_path"] as? String ?? "",
                                             first_air_date: d["first_air_date"] as? String ?? "",
                                             createdTime: d["created_time"] as? Timestamp)
                            
                        }
                    }
                    
                }
            } else {
                //                handle error
            }
            
        }
    }
}
