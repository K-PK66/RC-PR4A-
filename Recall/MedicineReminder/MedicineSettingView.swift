//
//  MedicineSettingView.swift
//  Recall
//
//  Created by jeffreyzfq on 2021/7/17.
//

import Foundation
import CoreData
import SwiftUI

struct MedicineSetting: View {
    @Environment(\.managedObjectContext) var context
    
    @Binding var isSetting: Bool
    
    @State private var name: String = ""
    @State private var notes: String = ""
    @State private var count: Int = 1
    @State private var times: [Int : Date] = [Int : Date]()
    @State private var type: MedicineAlarm.PillType = MedicineAlarm.PillType.beforeMeals
    
    var body: some View {
        Form {
            Section(header: Text("药品信息").font(.system(size: 20, weight: .light))) {
                TextField("药品名称", text: $name)
                TextField("备注", text: $notes)
            }
            
            Section {
                Picker("每日服用次数: ", selection: $count) {
                    ForEach(1..<8, id: \.self) { number in
                        Text("\(number)").tag(number)
                    }
                }
                Picker("服用方式: ", selection: $type) {
                    Text("餐前服用").tag(MedicineAlarm.PillType.beforeMeals)
                    Text("随餐服用").tag(MedicineAlarm.PillType.duringMeals)
                    Text("餐后服用").tag(MedicineAlarm.PillType.afterMeals)
                }
            }
            
            DateSelectList(count: $count, times: $times)
            
        }
        .toolbar {
            Button(action: {
                isSetting = false
                MedicineAlarm.newMedicine(named: name, notes: notes, type: type, times: times.values.sorted(), context: context)
                
                print("set complete")
            }, label: {
                Text("完成")
            })
        }
    }
    
}

struct DateSelectList: View {
    @Binding var count: Int
    @Binding var times: [Int : Date]
    
    var body: some View {
        Section(header: Text("提醒时间").font(.system(size: 20, weight: .light))) {
            ForEach(1..<(count+1), id: \.self) { index in
                HStack {
                    Text("第\(index)次: ")
                    Spacer()
                    DateSelector { date in
                        times[index] = date
                    }
                }
            }
        }.onAppear {
            print("count = \(count)")
            times = [Int: Date]()
            for index in 1...count {
                times[index] = Date()
            }
        }
    }
}

struct DateSelector: View {
    var dateUpdater: (Date) -> Void
    
    @State var date: Date = Date()
    
    init(dateUpdater: @escaping (Date) -> Void) {
        self.dateUpdater = dateUpdater
    }
    
    var body: some View {
        DatePicker("", selection: $date, displayedComponents: [.hourAndMinute])
            .onChange(of: date) { date in
                dateUpdater(date)
                print("*now set date: \(date)")
            }
    }
}

struct MedicineInfoSetting: View {
    @Binding var newMedicine: MedicineAlarm
    
    var width: CGFloat
    
    var body: some View {
        HStack {
            ZStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 3)
                    .frame(width: width * 0.2, height: width * 0.2, alignment: .center)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                Image(systemName: "camera.on.rectangle")
                    .imageScale(.large)
            }.padding(5)
        }
    }
}
