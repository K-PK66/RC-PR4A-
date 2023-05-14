//
//  BloodTest.swift
//  Recall
//
//  Created by mac on 2021/7/17.
//

import SwiftUI

var early_recognition = """
    •语言表达困难，想不起自己要说什么，明明想说“东”，说出来的却是“西”。
    
    •记忆力明显减退，尤其是近期记忆。
    
    •时间定向困难，弄不清今天是哪年哪月哪日。
    
    •迷路，尤其是在不常去的地方容易迷路。
    
    •缺乏主动性和积极性，对什么事情都不感兴趣，觉得生活没意思。
    """

var middle_recognition = """
    •变得非常健忘，特别是对刚发生的事情和刚遇见的人，还会忘记吃饭或者洗澡。

    •说话越来越困难，字句变少，说话不连贯，缺乏逻辑性，不会阅读等。

    •再也不能独立应对日常起居。

    •分不清上午与下午、白天与夜晚，分不清家人。

    •不能做饭、清洁和购物。

    •可能变得非常依赖他人。

    •在个人卫生方面需要他人帮助，如上厕所、梳洗和穿衣服。

    •表现出一些行为上的昇常，情绪起伏比较大，容易和他人起冲突。

    •迷路和走失。

    •日夜颠倒，晚上不睡，白天睡不醒，出现安想症状，可能会出现幻觉。
"""

var late_recognition = """
    •进食困难，无法自我进食或拒食。

    •不认识亲属、朋友和熟悉的物品。

    •不能够理解和解释事物，言语少且重复。

    •行走困难，需要使用轮椅或干脆卧床不起。

    •大、小便失禁。

    •公众场合行为昇常，如随地大小便。
"""
struct BloodTest: View {
    var body: some View {
        ScrollView {
            
            VStack {
                Text("如何识别早期痴呆")
                    .font(.title)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.leading)
                    .frame(height: 100.0)

                Text("早期痴呆常常易被忽视，被错误地认为是正常的衰老表现，主要表现在下列几个方面:")
                    .font(.title3)
                
                GroupBox {
                    HStack {
                        Text(early_recognition)
                            .font(.headline)
                        .multilineTextAlignment(.leading)
                        Spacer()
                    }
                }
                Image("early_r")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("如何识别中期痴呆")
                    .font(.title)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.leading)
                    .frame(height: 100.0)
                
                Text("随着疾病进展，痴呆老人遇到的困难会越来越多，并且日常生活变得困难。")
                    .font(.title3)
                GroupBox {
                    HStack {
                        Text(middle_recognition)
                            .font(.headline)
                        .multilineTextAlignment(.leading)
                        Spacer()
                    }
                }
                
                Text("如何识别晚期痴呆")
                    .font(.title)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.leading)
                    .frame(height: 100.0)

                Text("        痴呆老人完全依赖他人，丧失主动性，记忆障碍非常严重，并出现肢体活动方面的障碍。")
                    .font(.title3)
                GroupBox {
                    HStack {
                        Text(late_recognition)
                            .font(.headline)
                        .multilineTextAlignment(.leading)
                        Spacer()
                    }
                }
            }
            .padding([.leading, .bottom, .trailing], 50.0)
            .navigationTitle("居家如何识别痴呆症")
        }
    }
}

struct BloodTest_Previews: PreviewProvider {
    static var previews: some View {
        BloodTest()
    }
}
