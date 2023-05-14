//
//  GeneticView.swift
//  Recall
//
//  Created by mac on 2021/7/17.
//


import SwiftUI

var gene = """
        影响一个人是否患病的基因分为两类：（1）风险基因和（2）确定性基因。研究人员在这两个类别中都确定了遗传性阿尔茨海默氏症基因。

        风险基因增加了患病的可能性，但不能保证会发生。研究人员发现了几种增加阿尔茨海默氏症风险的基因。APOE-e4是第一个被识别的风险基因，仍然是对风险影响最大的基因。研究人员估计，在被诊断出患有阿尔茨海默氏症的人中，有40-65%的人有APOE-e4基因。
        APOE-e4是APOE基因的三种常见形式之一；其他形式是APOE-e2和APOE-e3。我们都从每个父级继承某种形式的APOE副本。那些从母亲或父亲那里继承一份APOE-e4的人患阿尔茨海默氏症的风险更高。那些从父母那里继承两份副本的人风险更高，但不确定。除了增加风险外，APOE-e4还可能使症状比平时更年轻。据估计，美国有20-30%的人有一两份APOE-e4副本；大约2%的美国人口有两份APOE-e4副本。

        确定性基因直接导致疾病，保证任何遗传疾病的人都会患上疾病。科学家在全球只有数百个大家庭中发现了导致阿尔茨海默氏症的罕见基因。据估计，这些基因占阿尔茨海默氏症病例的1%或更少，它们会导致家族早期发病形式，症状通常发生在一个人40岁出头到50多岁之间。绝大多数阿尔茨海默氏症患者患有晚期疾病，发生在65岁或65岁以上。
"""
var danbai = """
    
    淀粉样前体蛋白（APP),1987年发现的第一个突变基因被发现会导致阿尔茨海默氏症的遗传形式。
    
    Presenilin-1（PS-1），1992年发现的第二个突变基因被发现会导致阿尔茨海默氏症遗传。该基因的变化是阿尔茨海默氏症遗传的最常见原因。
    
    Presenilin-2（PS-2），1993年发现的第三个突变基因被发现会导致遗传性阿尔茨海默氏症。
    
    载脂蛋白E-e4（APOE4），1993年发现的是第一个发现增加阿尔茨海默氏症风险的基因变异，仍然是已知影响最大的风险基因。然而，这种突变并不意味着一个人会患上这种疾病。
    """
struct GeneticView: View {
    var body: some View {
        ScrollView {
            VStack {
                Group {
                    Text("痴呆症是否遗传")
                        .font(.title)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading)
                        .frame(height: 100.0)
                    Text("        个人患阿尔茨海默氏症不需要家族史。然而，研究表明，与阿尔茨海默氏症没有一级亲属的人相比，父母或兄弟姐妹患有阿尔茨海默氏症的人更有可能患上这种疾病。那些拥有多个一级阿尔茨海默氏症亲属的人的风险甚至更高。当阿尔茨海默氏症和其他痴呆症等疾病往往发生在家庭中时，遗传学（遗传因素）、环境因素——或两者兼而有之——可能会发挥作用。"
                    )
                    .font(.title3 )
                }
                Group {
                    Text("近距离观察与阿尔茨海默氏症相关的基因")
                        .font(.title)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading)
                        .frame(height: 100.0)
                    Text("        这23对人类染色体包含编码人类生物蓝图的30,000个基因中的所有基因。这个交互式插图突出了包含导致家族性阿尔茨海默氏症的三个基因中的每一个的染色体，以及对阿尔茨海默氏症风险影响最大的基因。")
                        .font(.title3)
                }
                Group {
                    HStack{
                        VStack{
                            Image("gene1")
                                .resizable(resizingMode: .stretch)

                            Text("淀粉样前体蛋白（APP)")

                        }
                        VStack{
                            Image("gene2")
                                .resizable(resizingMode: .stretch)

                            Text("Presenilin-1（PS-1）")
                        }
                    }
                
                    HStack{
                        VStack{
                            Image("gene3")
                                .resizable(resizingMode: .stretch)

                            Text("Presenilin-2（PS-2）")

                        }
                        
                        VStack{
                            Image("gene4")
                                .resizable(resizingMode: .stretch)

                            Text("载脂蛋白E-e4（APOE4）")
                        }
                    }
                }
                
                Spacer()
                Text(danbai)
                    .font(.footnote)
                
              
                Text("遗传学和阿尔茨海默氏症")
                    .font(.title)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.leading)
                    .frame(height: 100.0)
                Text(gene)
                    .font(.title3)
            }
            .padding([.leading, .bottom, .trailing], 50.0)
            .navigationBarTitle("痴呆症的遗传因素")
        }
    }
}

struct GeneticView_Previews: PreviewProvider {
    static var previews: some View {
        GeneticView()
    }
}
