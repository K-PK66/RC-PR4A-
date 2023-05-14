//
//  SideBarListD.swift
//  Recall
//
//  Created by mac on 2021/7/17.
//

import SwiftUI

struct Diagnosis: View {
    @Environment(\.managedObjectContext) var context
    
    let items: [Item]
    
    @State var isShowing: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("神经学心理学方法")) {
                    NavigationLink(destination:
                        MMSETest()
                            .navigationBarTitle(Text("MMSE测试"))
                            .navigationBarTitleDisplayMode(.inline)
                    ) {
                        Text("简短精神记忆量表(MMSE)")
                    }
//                    NavigationLink(destination: PlaceHolder()) {
//                        Text("长谷川简易智能测量表(HDS)")
//                    }
//                    NavigationLink(destination: PlaceHolder()) {
//                        Text("精神认知能力30题(CCSE)")
//                    }
                }
                Section(header: Text("生物标志物诊断")) {
                    NavigationLink(destination: BetaAmyloid()) {
                        Text("β淀粉样蛋白检测")
                    }
                    NavigationLink(destination: BloodTest()) {
                        Text("血液检测")
                    }
                }
                Section(header: Text("脑成像")) {
                    NavigationLink(destination: MedicalImaging()) {
                        Text("成像技术")
                    }
                }
                Section(header: Text("遗传风险分析")) {
                    NavigationLink(destination: GeneticView()) {
                        Text("遗传风险分析")
                    }
                }
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("病情诊断")
            .navigationBarItems(trailing:
                                        MedicineReminderSheet(isShowing: $isShowing)
                                            .environment(\.managedObjectContext, context)
                                    
            )
//            VStack{
//                ZStack {
//                    Rectangle()
//                        .foregroundColor(Color.orange)
//                    Text("        目前痴呆症的治疗方法主要有药物治疗和非药物治疗两种。目前痴呆症治疗的方法都只能缓解早期病人的认知障碍，无法阻止病情的进展，目前疾病的治疗还需全世界共同努力。合适的疗法可有效管理痴呆病人的行为问题，改善其认知和情绪状态，最终提高病人的生活质量。")
//                        .foregroundColor(.black)
//                        .font(.title)
//                        .lineLimit(10)
//
//                }
//                Image("treatment")
//            }
            
        }
//        .padding()
    }
}

struct PlaceHolder: View {
    var body: some View {
        Text("Place holder")
    }
}

struct Diagnosis_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Diagnosis(items: Item.stubs)
                .previewLayout(.device)
                .previewDevice("iPad Pro (11-inch) (5th generation)")
            Diagnosis(items: Item.stubs)
                .previewDevice("iPad Pro (11-inch) (5th generation)")
        }
    }
}
