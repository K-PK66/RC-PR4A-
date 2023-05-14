//
//  MedicalImaging.swift
//  Recall
//
//  Created by mac on 2021/7/17.
//

import SwiftUI

var imaging1 = """
        结构成像研究表明，随着病情的发展，阿尔茨海默氏症患者的大脑会显著收缩，但结构成像研究还表明，海马体等特定大脑区域的收缩可能是阿尔茨海默氏症的早期迹象。然而，科学家尚未就大脑体积的标准化值达成一致，该值将确定特定数量的缩小在单个时间点对任何人的重要性。
"""
var imaging11 = """
        今天，阿尔茨海默氏症的标准研究通常包括结构成像，这些测试目前用于排除可能导致类似阿尔茨海默氏症但需要不同治疗的其他症状。结构成像可以揭示肿瘤、中小卒中或大的证据、严重头部创伤造成的损伤或大脑积液。
"""
var imaging2 = """
        功能成像研究表明，阿尔茨海默氏症患者在某些地区的脑细胞活动通常会下降。例如，氟氧葡萄糖（FDG）-PET的研究表明，阿尔茨海默氏症通常与大脑中对记忆、学习和解决问题很重要的区域使用葡萄糖（糖）减少有关。然而，与结构成像检测到的收缩一样，还没有足够的信息将这些活动减少的一般模式转化为关于个人的诊断信息。
"""
var imaging3 = """

        这些技术是最活跃的研究领域之一，旨在找到诊断阿尔茨海默氏症早期阶段的新方法。分子策略可能会检测到表明阿尔茨海默氏症在疾病改变大脑结构或功能之前正在发生，或对记忆、思维和推理造成不可逆转的损害。分子成像还可以提供一种新的策略来监测疾病进展并评估下一代疾病改变治疗的有效性。几种分子成像化合物正在研究中，其中四种已被批准用于临床用途：
    
        Florbetaben（Neuraceq®）、Florbetapir（Amyvid®）和长笛美他莫（Vizamyl®）已被批准检测大脑中的β淀粉样蛋白。
    
        Flortaucipir F18（Tauvid®）已被批准用于检测大脑中的tau。
"""
var imaging33 = """
            尽管大脑中的淀粉样斑块是阿尔茨海默氏症的特征，但它们的存在不能用于诊断该疾病。许多人的大脑中有淀粉样斑块，但没有认知能力下降或阿尔茨海默氏症的症状。由于淀粉样蛋白斑块不能用于诊断阿尔茨海默氏症，因此不建议在疑似患有该疾病的患者中常规使用淀粉样蛋白成像。
    """
struct MedicalImaging: View {
    var body: some View {
        ScrollView {
            VStack {
                Group {
                    Text("结构成像")
                        .font(.title)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading)
                        .frame(height: 100.0)
                
                Text(imaging1)
                    .font(.title3)
                Text(imaging11)
                    .font(.title3)
                }
                
                Group {
                
                Text("功能成像")
                        .font(.title)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading)
                        .frame(height: 100.0)
                    
                    
                Text("功能成像通过显示细胞如何积极使用糖或氧气，揭示了不同大脑区域的细胞工作情况。功能技术包括正电子发射断层扫描（PET）和功能MRI（fMRI）。")
                    .font(.title3)
                HStack {
                    Image("pet")
                        .resizable(resizingMode: .stretch)
                    Image("pet1")
                        .resizable(resizingMode: .stretch)
                }
                Text(imaging2)
                    .font(.title3)
                }
                
                Group {
                
                Text("分子成像")
                        .font(.title)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading)
                        .frame(height: 100.0)
                Text("分子成像使用高靶向放射示踪剂来检测与特定疾病相关的细胞或化学变化。分子成像技术包括PET、fMRI和单光子发射计算机断层扫描（SPECT）。")
                    .font(.title3)
                
                Text(imaging3)
                }
                Text(imaging33)
            }
            .padding([.leading, .bottom, .trailing], 50.0)
            .navigationTitle("痴呆症诊断中的成像技术")
        }
    }
}

struct MedicalImaging_Previews: PreviewProvider {
    static var previews: some View {
        MedicalImaging()
    }
}
