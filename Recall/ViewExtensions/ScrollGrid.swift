//
//  ScrollGrid.swift
//  Recall
//
//  Created by jeffreyzfq on 2021/6/15.
//

import SwiftUI

extension ScrollGrid where Item: Identifiable, ID == Item.ID {
    init(_ items: [Item], itemsPerRow: Int, viewForItem: @escaping (Item) -> ItemView) {
        self.init(items, id: \Item.id, itemsPerRow: itemsPerRow, viewForItem: viewForItem)
    }
}

struct ScrollGrid<Item, ID, ItemView>: View where ID: Hashable, ItemView: View {
    private var items: [Item]
    private var id: KeyPath<Item, ID>
    private var viewForItem: (Item) -> ItemView
    
    var itemsPerRow: Int
    var row: Int
    var itemInRow = [Int: [Item]]()
    
    init(_ items: [Item], id: KeyPath<Item,ID>, itemsPerRow: Int, viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.id = id
        self.viewForItem = viewForItem
        self.itemsPerRow = itemsPerRow
        
        // calculate numbers of row
        self.row = items.count / itemsPerRow
        if items.count % itemsPerRow != 0 {
            self.row = self.row + 1
        }
        
        for item in items {
            let index: Int = items.firstIndex(where: { item[keyPath: id] == $0[keyPath: id] } )! + 1
            
            if itemInRow[row(of: index)] == nil {
                itemInRow[row(of: index)] = [Item]()
            }
            itemInRow[row(of: index)]!.append(item)
            
            //print("index: \(index)   row: \(row(of: index))")
        }
        
        print(row)
        print(items.count)
    }
    
    func row(of number: Int) -> Int {
        var row = number / itemsPerRow
        if number % itemsPerRow != 0 {
            row = row + 1
        }
        return row
    }
    
    var body: some View {
        ScrollView(.vertical) {
            GeometryReader { geometry in
                VStack(alignment: .leading) {
                    Spacer(minLength: 25)
                    ForEach(1..<(row + 1)) { index in
                        RowView(itemInRow[index]!, id: id, itemsPerRow: itemsPerRow, size: geometry.size, viewForItem: viewForItem)
                    }
                }
            }
        }
        
        
//        GeometryReader { geometry in
//            ScrollView {
//
//                self.body(for: GridLayout(itemCount: self.items.count, in: geometry.size))
//            }
//        }
    }
}

struct RowView<Item, ID, ItemView>: View where ID: Hashable, ItemView: View {
    private var items: [Item]
    private var id: KeyPath<Item,ID>
    private var viewForItem: (Item) -> ItemView
    
    var itemsPerRow: Int
    var size: CGSize
    var body: some View {
        HStack() {
            ForEach(items, id: id) { item in
                viewForItem(item)
                    .frame(width: size.width / CGFloat(itemsPerRow) * 0.935)
                    .padding(4)
            }
        }
    }
    
    init(_ items: [Item], id: KeyPath<Item,ID>, itemsPerRow: Int, size: CGSize, viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.id = id
        self.viewForItem = viewForItem
        self.itemsPerRow = itemsPerRow
        self.size = size
    }
}
