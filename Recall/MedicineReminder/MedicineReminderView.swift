//
//  MedicineReminder.swift
//  Recall
//
//  Created by jeffreyzfq on 2021/7/11.
//

import SwiftUI

// show as a Sheet
struct MedicineReminderSheet: View {
    @Environment(\.managedObjectContext) var context
    
    @Binding var isShowing: Bool
    
    var body: some View {
        Button(action: {
            isShowing = true
        }, label: {
            HStack {
                Text("服药提醒")
                    .foregroundColor(Color.black)
                Image(systemName: "bell")
                    .foregroundColor(Color.blue)
                    .imageScale(.large)
            }
        })
        .sheet(isPresented: $isShowing) {
            MedicineReminder(isShowing: $isShowing)
                .environment(\.managedObjectContext, context)
                
        }
    }
}

// MARK: - Reminder main view
struct MedicineReminder: View {
    @Environment(\.managedObjectContext) var context
    
    @FetchRequest(fetchRequest: MedicineAlarm.fetchRequest(.all)) var medicineAlarms: FetchedResults<MedicineAlarm>
    
    @Binding var isShowing: Bool
    
    var body: some View {
        NavigationView {
            ScrollView {
                GeometryReader { geometry in
                    LazyVStack() {
                        Spacer(minLength: 10)
                        
                        ForEach(medicineAlarms) { medicine in
                            MedicineCell(medicine: medicine, geometry: geometry)
                            Spacer(minLength: 10)
                        }
                        // New medicine
                        NewMedicine(geometry: geometry)
                            .environment(\.managedObjectContext, context)
                        
                            
                    }.navigationBarTitle(Text("Medicine Reminder"))
                    .navigationBarItems(
                        leading: Button(action: {
                            // edit mode
                        }, label: {
                            Text("Edit")
                        }),
                        trailing: Button(action: {
                            isShowing = false
                        }, label: {
                            Text("Done")
                        })
                    )
                    .navigationBarTitleDisplayMode(.inline)
                }
            }.padding(.horizontal, 5)
            .background(Color(#colorLiteral(red: 0.9331704974, green: 0.9330220222, blue: 0.9536234736, alpha: 1)))
            
        }
        
    }
    
}

// Cell for a single medicine
struct MedicineCell: View {
    var medicine: MedicineAlarm
    var geometry: GeometryProxy
    @State var fullVersion: Bool = false
    
    var body: some View {
        if fullVersion {
            // Full vision
            VStack {
                MedicineFullVision(medicine: medicine, geometry: geometry)
                Button(action: {
                    fullVersion = false
                }, label: {
                    ZStack {
                        Rectangle()
                        Image(systemName: "chevron.compact.up")
                    }
                })
            }
        } else {
            // Folded vision
            VStack(alignment: .center) {
                MedicineFoldedVision(medicine: medicine, geometry: geometry)

            }
        }
    }
    
    private var width: CGFloat {
        return geometry.size.width
    }
}

//MARK: - Full vision
struct MedicineFullVision: View {
    var medicine: MedicineAlarm
    var geometry: GeometryProxy
    
    var body: some View {
        Text("full vision")
    }
}

//MARK: - Folded vision
struct MedicineFoldedVision: View {
    var medicine: MedicineAlarm
    var geometry: GeometryProxy
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: width - 10, height: width * 0.2, alignment: .center)
                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                .shadow(radius: 2)
            HStack(alignment: .top) {
                Spacer(minLength: 40)
                medicine.pillImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: width * 0.3 - 10, height: width * 0.2 - 20, alignment: .center)
                    .mask(RoundedRectangle(cornerRadius: 10))
                Spacer(minLength: 20)
                VStack(alignment: .leading) {
                    Text(medicine.name)
                        .font(.system(size: 30))
                        .foregroundColor(Color(#colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)))
                    TimeLayer(pillTime: medicine.alarm, item: 2)
                        .font(.system(size: 50, weight: .light))
                        .foregroundColor(Color(#colorLiteral(red: 0.4592256797, green: 0.4051991291, blue: 0.4051991291, alpha: 1)))
                    NotesLayer(medicine)
                        .font(.system(size: 20))
                }.frame(width: width * 0.7, height: width * 0.2 - 20, alignment: .leading)
            }
        }
    }
    
    var width: CGFloat {
        return geometry.size.width
    }
}

struct TimeLayer: View {
    var content: String
    
    init(pillTime: Set<PillTime>, item: Int) {
        let times = pillTime.sorted()
        let dateFormatter = DateFormatter()
        print(pillTime)
        dateFormatter.dateFormat = "HH:mm"
        content = ""
        let cnt = min(item, times.count)
        for index in 0..<cnt {
            if (index > 0) {
                content += ", "
            }
            content += dateFormatter.string(from: times[index].time)
        }
        if (item < times.count) {
            content += " ..."
        }
    }
    
    var body: some View {
        Text(content)
    }
}

struct NotesLayer: View {
    var content: String
    
    init(_ medicine: MedicineAlarm) {
        content = "一日\(medicine.alarm.count)次"
        switch medicine.pillType {
        case .beforeMeals:
            content += ", 餐前服用"
        case .duringMeals:
            content += ", 随餐服用"
        case .afterMeals:
            content += ", 餐后服用"
        }
        if medicine.notes != "" {
            content += (", " + medicine.notes)
        }
    }
    
    var body: some View {
        Text(content)
    }
}

// MARK: - New medicine
struct NewMedicine: View {
    @Environment(\.managedObjectContext) var context
    
    var geometry: GeometryProxy
    
    @State var isSetting: Bool = false
    
    var body: some View {
        NavigationLink(destination:
            MedicineSetting(isSetting: $isSetting)
                .environment(\.managedObjectContext, context)
                .navigationTitle("新药品")
                .navigationBarTitleDisplayMode(.inline)
        , isActive: $isSetting) {
            ZStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: width - 10, height: width * 0.08, alignment: .center)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .shadow(radius: 2)
                Text("新建提醒")
                    .foregroundColor(Color(#colorLiteral(red: 0.8336931961, green: 0.3842914686, blue: 0.2742437051, alpha: 1)))
                    .font(.system(size: 20, weight: .light))
            }
        }
    }
    
    private var width: CGFloat {
        return geometry.size.width
    }
}


//struct MedicineReminder_Previews: PreviewProvider {
//    static var previews: some View {
//        MedicineReminder()
//    }
//}
