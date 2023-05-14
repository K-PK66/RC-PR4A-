//
//  MedicineAlarm.swift
//  Recall
//
//  Created by jeffreyzfq on 2021/7/15.
//

import Foundation
import CoreData
import Combine
import SwiftUI

final class MedicineAlarm: NSManagedObject, Identifiable, Comparable {
    
    @NSManaged var name: String
    @NSManaged var image: UIImage?
    @NSManaged var notes: String
    @NSManaged var pillType: PillType
    
    @NSManaged var alarm: Set<PillTime>!
    
    @objc enum PillType: Int64 {
        case beforeMeals
        case duringMeals
        case afterMeals
    }
    
    public static func < (lhs: MedicineAlarm, rhs: MedicineAlarm) -> Bool {
        lhs.name < rhs.name
    }
    
}

extension MedicineAlarm {
    
    static func withName(_ name: String, context: NSManagedObjectContext) -> MedicineAlarm? {
        let request = fetchRequest(NSPredicate(format: "name = %@", name))
        let medicineAlarms = (try? context.fetch(request)) ?? []
        if let medicineAlarm = medicineAlarms.first {
            return medicineAlarm
        } else {
            return nil
        }
    }
    
    static func fetchRequest(_ predicate: NSPredicate) -> NSFetchRequest<MedicineAlarm> {
        let request = NSFetchRequest<MedicineAlarm>(entityName: "MedicineAlarm")
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        request.predicate = predicate
        return request
    }
    
    var pillTypeNotes: String {
        switch pillType {
        case .beforeMeals:
            return "餐前服用"
        case .duringMeals:
            return "随餐服用"
        case .afterMeals:
            return "餐后服用"
        }
    }
    
    // MARK: - Insertion
    
    // without image
    class func newMedicine(named name: String = "untitled pill", notes: String = "", type: PillType, times: [Date], context: NSManagedObjectContext) {
        context.perform {
            let medicine = MedicineAlarm(context: context)
            medicine.name = nameUniqued(name: name, context: context)
            medicine.image = nil
            medicine.notes = notes
            medicine.pillType = type
            for time in times {
                let pillTime = PillTime.createSample(time: time, context: context)
                medicine.alarm.insert(pillTime)
            }
            try? context.save()
        }
    }
    
    // with image
    class func newMedicine(named name: String = "untitled pill", notes: String = "", image: UIImage, times: [PillTime], context: NSManagedObjectContext) {
        context.perform {
            let medicine = MedicineAlarm(context: context)
            medicine.name = nameUniqued(name: name, context: context)
            medicine.image = image
            medicine.notes = notes
            for time in times {
                medicine.alarm.insert(time)
            }
            try? context.save()
        }
    }
    
    // with Medicine model
    class func newMedicine(model: MedicineAlarm, context: NSManagedObjectContext) {
        context.perform {
            let medicine = MedicineAlarm(context: context)
            medicine.name = model.name
            medicine.image = model.image
            medicine.notes = model.notes
            medicine.pillType = model.pillType
            medicine.alarm = model.alarm
            try? context.save()
        }
    }
    
    
    // MARK: - Pill image
    var pillImage: Image {
        if image != nil {
            return Image(uiImage: image!)
        } else {
            return Image("pill")
        }
    }
    
    // MARK: - Deletion
    class func delete(_ name: String, context: NSManagedObjectContext) {
        if let medicine = MedicineAlarm.withName(name, context: context) {
            context.delete(medicine)
            try? context.save()
        }
    }
    
    // MARK: - String uniqued
    static func nameUniqued(name: String, context: NSManagedObjectContext) -> String {
        var unique = name
        while MedicineAlarm.withName(unique, context: context) != nil {
            unique = unique.incremented
        }
        return unique
    }
}
