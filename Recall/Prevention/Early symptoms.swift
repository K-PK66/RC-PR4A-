//
//  Early symptoms.swift
//  Recall
//
//  Created by mac on 2021/7/18.
//

import SwiftUI

var sympoms = """
    •寻找和使用词汇困难
    •语言理解力下降
    •抽象思维（如数字）障碍
    •难以完成许多日常任务，如在附近找路和记住东西的存放位置
    •难以正确判断
    """
var sympos1 = """
            情绪多变，不可预测地快速从高兴转变为悲伤。

            人格改变也很常见。家人可能发现有异常行为。

            一些痴呆症患者将其缺陷隐藏得很好，因为他们在家中遵循现有规则，避免进行一些诸如结平账簿、阅读和工作等复杂的活动。不改变生活方式的患者可能因不能完成日常任务而感到沮丧。他们可能忘记完成重要任务或可能错误完成。例如，他们可能忘记付账、或关灯、或关闭火炉。

            在痴呆症早期，患者可以驾驶，但在交通拥挤等情况时反应差，易迷路。
    """
var symposMiddle = """
    •学习和记住新信息
    •有时记起过往事件
    •生活自理能力丧失（如洗澡、吃饭、穿衣服、如厕）
    •识别人和物
    •回忆并知道存放处
    •理解所见所闻（导致思维紊乱）
    •控制行为
    """
var symposMiddle1 = """
            患者常常迷路，可能无法找到自己的卧室或浴室。他们可以行走，但易跌倒。在约10%的患者中，这种思维紊乱可导致精神病症状，如幻觉 、妄想 （错误信念，通常指对感知或经历的误解）或偏执（被迫害的无端感觉）。

            随着痴呆症的进展，驾驶越来越困难，因为这需要快速决策和协调许多手动技巧。患者可能不记得他们要去往何处。

            人格特质可能越发夸大。总是担心金钱的患者会不能自拔。常常担忧的患者会持续担忧。某些患者表现为不安、焦虑、以自我为中心、固执或易怒。某些表现为更加被动、面无表情、抑郁、犹豫不决或孤僻。如果提及患者的人格改变或脑功能减退，患者会变得激动甚至敌对。

            睡眠模式也不正常。多数痴呆症患者睡眠时间增加，但其深睡眠时间减少。因此夜晚时，患者变得焦躁不安。他们也可能难以入睡或维持睡眠。如果患者锻炼不够或参与活动不多，可能在白天睡眠过多，然后在夜晚睡眠不良。
    """
var symposEnd = """
            痴呆症患者最终不能理解谈话并不能讲话。近事记忆和远事记忆完全丧失，患者可能无法认出亲密的家庭成员甚至镜子中自己的脸。

            当进入痴呆症晚期时，脑功能几乎完全损坏。晚期痴呆症影响肌肉控制。患者不能行走、进食或完成其它日常任务。患者完全依赖于他人，许多患者只能卧床。

            患者最终吞咽困难。这些问题增加了营养不良 、肺炎 (通常是由于吸入口腔分泌物或颗粒)和压疮 (因为不能移动)的风险。

            多数患者因为感染（如肺炎）而导致死亡。
    """

//var period = """
//前期: 如果这个时候开始进行治疗干预，会使得发病过程大大延缓。
//
//    •阶段一:了无痕迹；
//    •阶段二:认为岁数大了，记性不好；
//    •阶段三:令人在意的健忘。
//
//中期:多一份耐心，多和他们交流，耐心的听他们说话，他们能够记得我们的时间不多了。
//
//    •阶段四:痴呆症早期；
//    •阶段五:痴呆症中期。
//
//晚期:尽力延长老人的生命。
//
//    •阶段六:痴呆症晚期；
//    •阶段七:陷入百年孤独。
//"""
struct Early_symptoms: View {
    var body: some View {
        ScrollView {
            VStack {
//                Text("‬痴呆症从开始发病到最终得病，到最后阶段，一共分为七个阶段")
//                    .foregroundColor(.black)
//                    .font(.title
//                    .weight(.heavy))
//                    .multilineTextAlignment(.center)
//                    .frame(height: 100.0)
//                GroupBox {
//                    HStack {
//                        Text(period)
//                        Spacer()
//                    }
//                }
                Group{
                Text("早期症状")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding(.bottom)
                    ZStack {
                        Rectangle()
                            .frame(height: 100.0)
                            .foregroundColor(Color.orange)
                        Text("‬        痴呆症常常缓慢开始，随着时间发展而逐渐加重，最初不易被发现。")
                            .foregroundColor(.black)
                            .font(.title)
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                    .padding(.vertical)
                    HStack {
                        Text("        第一个明显恶化的精神功能是:")
                            .font(.title3)
                        Spacer()
                    }.padding()
                GroupBox {
                    HStack {
                        Text("•记忆，尤指对最近的事件")
                        Spacer()
                    }
                }
                    HStack {
                        Text("        随着痴呆症的进展，症状会逐步加重，例如：:")
                            .font(.title3)
                        Spacer()
                    }.padding()
                    GroupBox {
                        HStack {
                            Text(sympoms)
                            Spacer()
                        }
                    }
                    Text(sympos1)
                        .font(.title3)
                Divider()
                }
                Group {
                Text("中期症状")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding(.bottom)
                HStack {
                    Text("        随着痴呆症进展，现有问题加重并扩大，导致以下功能变得困难或不可能:")
                        .font(.title3)
                    Spacer()
                }.padding()
                GroupBox {
                    HStack {
                        Text(symposMiddle)
                        Spacer()
                    }
                }
                    HStack {
                        Text(symposMiddle1)
                            .font(.title3)
                        Spacer()
                    }.padding()
                
                Divider()
                }
                Group {
                Text("晚期症状")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding(.bottom)
                Text(symposEnd)
                    .font(.title3)
                        }
                    }
            }
                .padding([.top, .leading, .trailing], 50.0)
                .navigationBarTitle("疾病的早中晚各时期表现")
    }
    
}
struct Early_symptoms_Previews: PreviewProvider {
    static var previews: some View {
        Early_symptoms()
    }
}
