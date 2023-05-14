//
//  ItemList.swift
//  Recall
//
//  Created by mac on 2021/7/17.
//

import SwiftUI

struct ItemList: View {
    
    let items: [Item]
    
    var body: some View {
        List(items, children: \.children) {
            Text($0.title)
        }
    }
}

struct ItemList_Previews: PreviewProvider {
    static var previews: some View {
        ItemList(items: Item.stubs)
    }
}

extension Item {
    static var stubs: [Item] = [
        Item(title: "", children: [
            Item(title: "", children: [
                Item(title: "", children: nil),
                Item(title: " ", children: nil)
            ]),
            Item(title: " ", children: [
                Item(title: " ", children: nil),
                Item(title: " ", children: nil)
            ])
        ])
    ]
}
