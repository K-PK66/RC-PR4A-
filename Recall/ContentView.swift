//
//  ContentView.swift
//  Recall
//
//  Created by jeffreyzfq on 2021/9/21.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var context
    @StateObject var galleryViewModel = MemoryGalleryViewModel()
    @StateObject var objectCaptureModel = CameraViewModel()
    
    @State var isShowing: Bool = false

    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("预防")) {
                    NavigationLink(destination: DefinitionOfDementia()) {
                        Text("什么是痴呆症")
                    }
                    NavigationLink(destination: Distinction()) {
                        Text("病因")
                    }
                    NavigationLink(destination: Progress()) {
                        Text("痴呆症状")
                    }
//                    NavigationLink(destination: Early_symptoms()) {
//                        Text("疾病的早中晚各时期表现")
//                    }
                    NavigationLink(destination: Avoid()) {
                        Text("如何预防痴呆症")
                    }
                }
                Section(header: Text("诊断")) {
                    NavigationLink(destination:
                        MMSETest()
                            .navigationBarTitle(Text("MMSE测试"))
                            .navigationBarTitleDisplayMode(.inline)
                    ) {
                        Text("简短精神记忆量表(MMSE)")
                    }
                    NavigationLink(destination: BloodTest()) {
                        Text("居家如何识别痴呆症")
                    }
                    NavigationLink(destination: Doctor_seeing()) {
                        Text("如何正确就医")
                    }
                    
                    NavigationLink(destination: BetaAmyloid()) {
                        Text("β淀粉样蛋白检测")
                    }
                    NavigationLink(destination: MedicalImaging()) {
                        Text("成像技术")
                    }
                    NavigationLink(destination: GeneticView()) {
                        Text("遗传风险分析")
                    }
                }
                Section(header: Text("治疗")) {
                    NavigationLink(destination:
                                    MemoryGallery(objectCaptureModel: objectCaptureModel)
                                    .environmentObject(galleryViewModel)
                                    .navigationBarTitleDisplayMode(.inline)
                    ) {
                        Text("记忆宝库")
                    }
                }
            }.listStyle(SidebarListStyle())
            .navigationTitle("忆心")
            .navigationBarItems(trailing:MedicineReminderSheet(isShowing: $isShowing)
            .environment(\.managedObjectContext, context))
        }
        .ignoresSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
