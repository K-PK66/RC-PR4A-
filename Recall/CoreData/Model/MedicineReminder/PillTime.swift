//
//  PillTime.swift
//  Recall
//
//  Created by jeffreyzfq on 2021/7/16.
//

import Foundation
import CoreData
import Combine
import SwiftUI

final class PillTime: NSManagedObject, Comparable, Identifiable {

    @NSManaged var complete: Bool
    @NSManaged var time: Date
    
    @NSManaged var medicine: MedicineAlarm?
    
    static func < (lhs: PillTime, rhs: PillTime) -> Bool {
        lhs.time < rhs.time
    }
}

extension  PillTime {
    
    
    // MARK: - Insertion
    @discardableResult static func createSample(time: Date, context: NSManagedObjectContext) -> PillTime {
        let pillTime = PillTime(context: context)
        pillTime.time = time
        pillTime.complete = false
        return pillTime
    }
    
}
