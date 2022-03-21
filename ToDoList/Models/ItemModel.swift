//
//  ItemModel.swift
//  ToDoList
//
//  Created by Ruslan Ishmukhametov on 27.02.2022.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    var id: String = UUID().uuidString
    let title: String
    let isComplited: Bool
    
    init(id: String = UUID().uuidString, title: String, isComplited: Bool) {
        self.id = id
        self.title = title
        self.isComplited = isComplited
    }
    
    func updateComplition() -> ItemModel {
        return ItemModel(id: id, title: title, isComplited: !isComplited)
        
    }
    
}
