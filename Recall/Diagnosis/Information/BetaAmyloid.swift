//
//  BetaAmyloid.swift
//  Recall
//
//  Created by mac on 2021/7/17.
//
var betaAmyloidTitle = """
    ​​     目前研究认为，神经元胞外β-淀粉样蛋白（Aβ）沉积和胞内过磷酸化tau蛋白形成的神经原纤维缠结（NFTs）是阿尔茨海默病的主要病理学特征，其中，Aβ级联学说是主要的机制学说，也是重要的治疗靶点。

        然而，在轻度认知损害（MCI）、阿尔茨海默病临床前期或临床期的机制研究中可能会混杂其他病因，因此美国国家老龄化研究所-阿尔茨海默病学会（NIA-AA）2011年公布的诊断标准指出，在所有的阿尔茨海默病生物学标志物中Aβ相关生物学标志物居重要地位，而在2018年颁布的新的研究框架中，不仅确立了由Aβ定义的阿尔茨海默病连续体，而且进一步强调Aβ作为必需的生物学标志物在明确诊断中的重要性。

        Aβ是神经元β-淀粉样前体蛋白（APP）经β-和γ-分泌酶水解所产生的包含39~43个氨基酸的多肽，人体内最为常见的Aβ类型是Aβ40和Aβ42，以Aβ42神经毒性最强，易聚集，是阿尔茨海默病的核心致病物质；Aβ42单体可自发聚集形成可溶性寡聚体，然后进一步聚集形成Aβ纤维沉积于神经元胞外，引起神经元突触功能障碍、tau蛋白过磷酸化并继发炎症反应，导致神经元死亡，最终引起痴呆。由于可溶性Aβ寡聚体是Aβ代谢过程中产生的最具神经毒性的代谢产物，因此，降低脑组织Aβ表达水平业已成为目前预防和治疗阿尔茨海默病的重要策略，尤其是下调可溶性Aβ寡聚体的表达是取得治疗效果的关键环节。
"""
var betaAmyloid = """
            日本名古屋市立大学教授道川诚（神经生物化学）的研究团队11月5日宣布，找到了一种有可能通过微量血液早期诊断阿尔茨海默症（老年痴呆症）的检查方法。
    
    　　据研究团队介绍，阿尔茨海默症的病因之一被认为是在发病前20年脑部就开始蓄积一种叫做β-淀粉样蛋白（Aβ）的蛋白质。如果这种蛋白质不断蓄积，治疗效果就很难显现出来，因此最为理想的是实现发病前早期诊断。β-淀粉样蛋白是否蓄积，目前主要依靠正电子发射断层扫描（PET）以及提取脑脊髓液来检查。
    
    　　研究团队发现在脑内细胞投入β-淀粉样蛋白之后，细胞产生的“Flotillin”蛋白质的量会减少，也就是说引起老年痴呆症的β-淀粉样蛋白与“Flotillin”蛋白质的数量存在关联性。研究人员调查了72人的血液Flotillin浓度，包括正常人、阿尔茨海默症患者、患有轻度痴呆症等三类人群。调查结果发现，通过正电子发射断层扫描检查确认阿尔茨海默症患者有β-淀粉样蛋白蓄积，这些患者的Flotillin浓度比正常人平均约低40％；有少量β-淀粉样蛋白蓄积，存在发病可能的轻度阿尔茨海默症患者的Flotillin浓度比正常人约低25％。患有轻度阿尔茨海默症而没有β-淀粉样蛋白蓄积的人并未发现Flotillin浓度降低。
    
    　　因此研究团队表示，由于Flotillin可通过微量血液检测出来，就能开发出快速检查的技术。
    """
import SwiftUI

struct BetaAmyloid: View {
    var body: some View {
        ScrollView {
            
            VStack {
                Text("β-淀粉样蛋白诊断原理")
                    .font(.title)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.leading)
                    .frame(height: 100.0)

                Text(betaAmyloidTitle)
                    .font(.title3)
                
                Image("bataamyloid")
                    .resizable(resizingMode: .stretch)
                Text("采用β-淀粉样蛋白诊断的方法")
                    .font(.title)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.leading)
                    .frame(height: 100.0)

                Text(betaAmyloid)
                    .font(.title3)
            }
            .padding([.leading, .bottom, .trailing], 50.0)
            .navigationTitle("阿尔兹海默症中的 β 淀粉样蛋白")
        }
    }
}

struct BetaAmyloid_Previews: PreviewProvider {
    static var previews: some View {
        BetaAmyloid()
    }
}
