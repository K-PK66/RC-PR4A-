//
//  FinalPhaseSymptoms.swift
//  Recall
//
//  Created by mac on 2021/7/18.
//

import SwiftUI

struct FinalPhaseSymptoms: View {
    var body: some View {
        ScrollView {
            VStack {
                Group{
                        
                    Text("记忆障碍")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .padding(.bottom)
                    Text("        患者的记忆力产生严重的障碍，对于近事经常遗忘，严重者无法记忆当天所发生的日常琐事，且容易忘记不常用的名字，经常重复的发问。部分患者可无意地编造情节或者是远事近移，极容易产生错构以及虚构，学习以及记忆新知识时特别困难。")
                        .font(.title3)
                    Divider()
                    Text("认知障碍")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .padding(.bottom)
                    Text("        随着患者的病情进展，逐渐出现明显的表现，患者的语言功能形成障碍，口语方面因为找词困难，从而产生渐渐停顿的情况，导致患者的语言以及书写中断，主要表现为缺乏实质词、口语空洞。患者对于复述特别困难，且丧失了对于语言的理解力，口语量严重减少，产生错语症。")
                        .font(.title3)
                    Divider()
                    Text("精神障碍")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .padding(.bottom)
                    Text("        患者出现抑郁心境，导致情感淡漠、焦虑不安，而且主动性减少，注意力方面特别涣散，白天经常自言自语或者是大声说话，非常害怕在家，少数患者会产生不适当或者是频繁发笑。甚至于出现贪食的行为，有时还会忽略进食，对于身体健康带来严重的伤害。")
                        .font(.title3)
                    
                    Image("Image13")
                        .resizable(resizingMode: .stretch)
                        .padding(.top, 80.0)
                }
            }
            .padding([.top, .leading, .trailing], 50.0)
            .navigationBarTitle("中晚期症状")
        }
    }
}

struct FinalPhaseSymptoms_Previews: PreviewProvider {
    static var previews: some View {
        FinalPhaseSymptoms()
    }
}
