//
//  DefinitionOfDementia.swift
//  Recall
//
//  Created by mac on 2021/7/17.
//

import SwiftUI

var show = """
    •典型的临床表现有记忆力减退、语言和运动能力减退、性格改变、定向障碍和断续的不恰当的行为。

    •症状逐渐加重，导致患者生活不能自理，需要依赖他人。

    •根据患者的症状、体检结果和精神状态测试来作出诊断。

    •血液检查和影像学检查能进一步明确病因。

    •治疗的重点是尽可能长时间地保持患者的精神功能，并在患者功能减退时提供支持。
"""

var definition = """
        最常见的痴呆症类型是阿兹海默症，阿兹海默症患者占所有痴呆症患者人数的50%到70%，其他常见的种类还包括血管型痴呆症（占25%）、路易氏体痴呆症（占15%）、以及额颞叶型痴呆症。相对少见的失智成因则有常压型水脑症、帕金森氏症、梅毒、以及库贾氏症等。同一个人可以同时得到超过一种痴呆症。有少部分的痴呆症起因于家族遗传。在精神疾病诊断与统计手册第五版中痴呆症被视为一种认知障碍，并再依其严重程度分类。痴呆症的诊断通常根据患者的病史，以及经过一系列心理衡鉴与医学影像检查，并搭配抽血检查，来找出可能的病因。简短智能测验是其中一种常用于初步评估的工具。预防痴呆症的方式，主要是减少常见的风险因子，比如说高血压、吸烟、糖尿病、以及肥胖症等。目前并不建议全面进行一般民众的痴呆症筛检。

        痴呆症目前无法治愈。多奈派齐等乙酰胆碱酯酶抑制剂类药物经常用于治疗轻至中度痴呆症，但这些治疗的帮助终归有限。对于痴呆症患者与照护者而言，有些方法可以改善他们的生活品质，例如认知行为疗法可能有所助益；另外，对于照护者的卫教与情感支持亦相当重要。运动对于病患的日常生活活动功能有帮助，并可能改善预后。痴呆症引起的行为问题或思觉失调症状经常以抗精神病药治疗，但一般而言不建议这么做，因为这样的治疗帮助有限，并可能增加病人的死亡风险。

        痴呆症影响全球三千六百万人口。大约10%的人口，会在有生之年中发病。痴呆症与年龄（老化）息息相关，约3%的人口在65到74岁之间得到痴呆症，另外19%的人口则在75到84岁之间，而将近一半的人口超过85岁得到痴呆症。
"""

struct DefinitionOfDementia: View {
    var body: some View {
        ScrollView {
            VStack {
                Spacer(minLength: 50)
                Group{
                    ZStack {
//                        Rectangle()
//                            .frame( height: 100.0)
//                            .foregroundColor(Color.orange)
                        Text("‬痴呆症‭是一种包括记忆、思维、判断和学习能力在内的精神功能缓慢而渐进的衰退")
                            .font(.title
                            .weight(.heavy))
                            .multilineTextAlignment(.center)
                            .frame(height: 100.0)
                    }
                    .padding(.bottom)
                    
                    
                    Group {
                        Text("         痴呆症是一种发生于老年和老年前期，以进行性认知功能障碍和行为损害为特征的中枢神经系统退行性病变，主要发生于年龄在65岁以上的患者。其病理学特征为脑内细胞外老年斑沉积、胞内神经原纤維缠结和神经元突触功能异常及神经元的大量丟失。临床上表现为记忆障碍、失语、失认、视空间技能损害、执行功能障碍及人格和行为改变。但痴呆症是一种疾病，不属于正常衰老过程。许多100岁以上的人可无痴呆症表现。")
                        GroupBox {
                            Text(show)
                                .font(.subheadline)
                        }
                        
                        Text("‬痴呆症‭与年龄有直接关系")
                            .font(.title
                            .weight(.heavy))
                            .multilineTextAlignment(.center)
                            .frame(height: 100.0)
                        
                        
                        Text("         脑部中与年龄相关的变化(也称为与年龄相关的记忆障碍)会导致短期记忆下降和学习能力下降。与痴呆症不同，这些变化通常随着人们年龄的增长而发生，不会影响他们的功能和日常工作能力。老年人的这种记忆力丧失不一定是痴呆症或早期阿尔茨海默病的征兆。然而，痴呆症的早期症状非常相似。")
                            .padding(.vertical)
                    }
                .font(.title3)
                    
                    HStack{
                        Image("Image")
                            .resizable(resizingMode: .stretch)
//                        Image("Image6")
//                            .resizable(resizingMode: .stretch)
                    }
            Text(definition)
                .font(.title3)
                    
                }
            }
            
        }
        .padding([.leading, .trailing], 50.0)
        .navigationBarTitle("什么是痴呆症")
    }
}

struct DefinitionOfDementia_Previews: PreviewProvider {
    static var previews: some View {
        DefinitionOfDementia()
    }
}
