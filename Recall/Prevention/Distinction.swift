//
//  Distinction.swift
//  Recall
//
//  Created by mac on 2021/7/18.
//

import SwiftUI

var reason = """
    •阿尔茨海默症:一种主要的脑部疾病，约占痴呆症患者的60%-80%,阿尔茨海默病是指精神功能进行性丧失，其特征为脑组织退化，包括神经细胞丢失、称为β-淀粉样蛋白的异常蛋白积聚、及出现神经原纤维缠结。
    
    •血管性痴呆症:血管性痴呆症是指由脑供血减少或阻断导致脑组织破坏，从而引起的认知功能障碍。其病因通常为脑中风引起，即可以是由大面积梗死引起，也可以由多发性小中风引起。
    
    •路易斯痴呆症:路易体痴呆症是以神经细胞内路易小体的形成为特征的进行性认知功能缺失。帕金森病痴呆症是以帕金森病患者路易体发育为特征的精神功能丧失。
    
    •额颞叶痴呆症:额颞痴呆症是指一组由遗传性或原发性（不明原因的）疾病引起的痴呆症，这些疾病导致大脑的额叶甚至颞叶退化。
    
    •人类免疫缺陷病毒:(HIV)相关痴呆症:HIV相关性痴呆症是由于人类免疫缺陷病毒（HIV）感染脑部而导致的精神功能逐渐恶化。
    
    除此之外，帕金森病、头部受伤、肿瘤、亨廷顿病、阮病毒疾病、进行性核上性麻痹，神经梅毒等病也可能引起痴呆。
    """

var otherreason = """
    导致可逆性痴呆症的疾病包括:

    •正常压力脑积水
    •硬膜下血肿
    •硫胺素 、烟酸 或维生素B12 缺乏
    •甲状腺活动不足（‬甲状腺功能减退 ）
    •可以切除的脑肿瘤
    •过量或过长时间服用药物或摄入酒精
    •中毒（如铅、汞等重金属）
    •神经梅毒 ，如果及早治疗
    •其他感染（例如莱姆病 、病毒性脑炎 和真菌感染隐球菌病 ）
    
    除此之外，许多疾病可使痴呆症的症状加重，包括糖尿病 、慢性支气管炎 、肺气肿、感染、慢性肾病 、肝病 和心力衰竭 。
    """
var reasonn = """
    •遗传：有家族病史者，患“老年痴呆”的可能性要比无家族史者高出4倍。

    •心脑血管疾病：给血管添堵的食物，一律别碰，高油高脂，油炸食品都躲开，青菜，水果，维生素，多多益善。

    •脑部外伤：脑细胞大量受损加速脑部老化。

    •情绪：长期的焦虑抑郁，会抑制大脑里神经营养因子的分泌。

    •烟酒：香烟中的尼古丁和酒中的乙醇等有毒物质，都能够兴奋和麻痹大脑神经。大脑长期处在兴奋或麻痹状态，会造成一些脑组织损伤，严重时，甚至会出现大脑萎缩。
"""
    

struct Distinction: View {
    var body: some View {
        ScrollView {
            VStack {
                Group{
                    Text("‬        痴呆症是一种没有其它原因的脑部疾病,可以由许多疾病引起")
                        .font(.title
                        .weight(.heavy))
                        .multilineTextAlignment(.center)
                        .frame(height: 100.0)
                    
                    HStack {
                        Text("痴呆症可由下列原因引起:")
                        Spacer()
                    }
                    GroupBox {
                        HStack {
                            Text(reasonn)
                                .font(.headline)
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }
                    }
                    Image("reason-1")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        
                    Text("痴呆症种类及常见致病原因")
                        .font(.title)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading)
                        .frame(height: 100.0)
                    GroupBox {
                        Text(reason)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                    }
                }
                Group {
                    Text("可逆转性痴呆的病因")
                        .font(.title)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading)
                        .frame(height: 100.0)
                    Text("        多数病因在导致痴呆症后，症状不能逆转，但少数经治疗后，痴呆症改善，如果没有引起脑部严重损伤，痴呆症可以完全治愈。(一些专家将痴呆症一词仅用于病情进展且无法逆转的情况，而当痴呆症可能部分逆转时，则使用脑病或认知丧失等术语。)如果脑部没有受到太多损伤，治疗通常可以治愈这些痴呆症。如脑部损伤非常严重，治疗虽然不能改善痴呆症的症状，但可以预防出现新的损伤。").font(.title3)
                    GroupBox {
                        HStack {
                            Text(otherreason)
                                .font(.headline)
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }
                    }
                }
                
//                Group {
//                    Text("药物因素")
//                        .font(.title)
//                        .fontWeight(.heavy)
//                        .multilineTextAlignment(.leading)
//                        .frame(height: 100.0)
//                    Text("　　许多药物可使痴呆症的症状暂时加重。其中一些药物不用处方就能购买（非处方药物）。睡眠辅助药物（它们属于镇静药）、感冒药、抗焦虑药物以及一些抗抑郁药物 都是常见例子。")
////                    Image("reason_smoke")
////                        .renderingMode(.original)
////                        .resizable()
////                        .aspectRatio(contentMode: .fit)
//                }
            }
            .font(.title3)
        }
        .padding([.leading, .trailing], 50.0)
        .navigationBarTitle("病因")
    }
}

struct Distinction_Previews: PreviewProvider {
    static var previews: some View {
        Distinction()
        
    }
}
