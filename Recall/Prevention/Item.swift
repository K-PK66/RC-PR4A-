//
//  Item.swift
//  Recall
//
//  Created by mac on 2021/7/17.
//

import Foundation

struct Item: Identifiable {
    let id = UUID()
    let title: String
    let children: [Item]?
}
