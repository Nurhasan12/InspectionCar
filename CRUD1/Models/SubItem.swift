//
//  SubItem.swift
//  CRUD1
//
//  Created by Mac on 07/09/25.
//

import Foundation

struct SubItem: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let imageName: String
}

