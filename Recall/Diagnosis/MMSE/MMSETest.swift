//
//  MMSETest.swift
//  Recall
//
//  Created by jeffreyzfq on 2021/7/21.
//

import Foundation
import SwiftUI

struct MMSETest: View {
    @State var index: Int = 1
    @State var score = [Int : Bool]()
    
    @State var started: Bool = false
    @State var showAlert: Bool = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.white)
                .shadow(radius: 2)
            Group {
                if started == true {
                    if index <= 30 {
                        quests
                    } else {
                        result
                    }
                } else {
                    startPage
                }
            }
        }
        .padding(.horizontal, 40)
        .padding(.vertical, 40)
        .background(Color(#colorLiteral(red: 0.9331704974, green: 0.9330220222, blue: 0.9536234736, alpha: 1)))
    }
    
    var quests: some View {
        return VStack(alignment: .leading) {
            Group {
                //Spacer(minLength: 40)
            
                Text(MMSEQuestInfo[index-1].title)
                    .font(.system(size: 40, weight: .black))
               // Spacer(minLength: 20)
                Spacer()
                Text(MMSEQuestInfo[index-1].content)
                    .font(.system(size: 30, weight: .light))
                Spacer(minLength: 30)
                Spacer()
                Text(MMSEQuestInfo[index-1].detail)
                    .font(.system(size: 30, weight: .regular))
//                Spacer(minLength: 30)
                Spacer()
                Scoring(index: index, score: $score)
 //               Spacer(minLength: 40)
                Spacer()
            }
            .foregroundColor(.black)
            HStack {
                Spacer()
                if index > 1 {
                    Button(action: {
                        index -= 1
                    }, label: {
                        Text("上一题")
                    })
                }
                Spacer()
                Spacer()
                Button(action: {
                    if score[index] != nil {
                        index += 1
                    } else {
                        showAlert = true
                    }
                }, label: {
                    Text(index < 30 ? "下一题" : "完成")
                })
                Spacer()
            }.alert(isPresented: $showAlert) {
                Alert(title: Text("当前题目未作答"), message: Text("请先作答当前当前题目"), dismissButton: .default(Text("好的")))
            }
        }
        .padding(40)
    }
    
    
    var startPage: some View {
        return VStack {
            Spacer(minLength: 100)
            Text("MMSE测试")
                .font(.system(size: 50, weight: .regular))
                .foregroundColor(.black)
            Spacer(minLength: 20)
            Text("简易智力状态检查量表（MMSE）能全面、准确、迅速地反映被试智力状态及认知功能缺损程度。为临床心理学诊断、治疗以及神经心理学的研究提供科学依据。该表简单易行，国内外广泛应用，是痴呆筛查的首选量表。")
                .font(.system(size: 25, weight: .light))
                .foregroundColor(.black)
            Spacer(minLength: 20)
            Text("注意：MMSE测试共30项题目，每项回答正确得1分，回答错误或答不知道评0分，量表总分范围为0-30分。")
                .font(.system(size: 25, weight: .light))
                .foregroundColor(Color(#colorLiteral(red: 0.6946068129, green: 0.2738522725, blue: 0.2934220374, alpha: 1)))
            Spacer(minLength: 50)
            Button(action: {
                started = true
            }, label: {
                ZStack(alignment: .center) {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .frame(width: 260, height: 60, alignment: .center)
                    Text("开始测试")
                        .font(.system(size: 40, weight: .light))
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                }
            })
            Spacer(minLength: 50)
        }.padding(20)
    }
    
    var result: some View {
        var finalScore = 0
        for index in 1...30 {
            finalScore += (score[index]!) ? 1 : 0
        }
        var diagnosis = ""
        var saysomething = ""
        if finalScore >= 27 {
            diagnosis = "认知功能正常"
            saysomething = "看起来你的状态不错，继续保持呦，可以参考我们预防栏目中的建议做针对训练，让痴呆远离你。"
        } else if finalScore >= 21 {
            diagnosis = "轻度认知功能障碍"
            saysomething = "表现的很不错，但是建议参阅疾病的更多信息并去医院做进一步检查。"
        } else if finalScore >= 10 {
            diagnosis = "中度认知功能障碍"
            saysomething = "看来病情已经较为严重了，建议去医院进行进一步检查，在随后也可参与到我们的AR康复中。"
        } else {
            diagnosis = "重度认知功能障碍"
            saysomething = "请立即前往医院就医并按照医嘱进行治疗"
        }
        return VStack {
            Spacer(minLength: 30)
            Text("最终得分： \(finalScore)，诊断结果： \(diagnosis)，\(saysomething)")
                .font(.system(size: 35, weight: .regular))
            Spacer()
            Text("评分参考：27-30分：认知功能正常；＜27分：认知功能障碍；21-26分：轻度认知功能障碍；10-20分：中度认知功能障碍；0-9分：重度认知功能障碍。")
                .font(.system(size: 25, weight: .light))
//            Spacer(minLength: 100)
        }.padding(25)
    }
}

struct Scoring: View {
    var index: Int
    @Binding var score: [Int : Bool]
    
    var body: some View {
        VStack {
            Button(action: {
                score[index] = true
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor((score[index] ?? true) ? Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)) : Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        
                    Text("回答正确")
                        .font(.system(size: 30, weight: .light))
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                }
            }).frame(height: 80)
            
            Button(action: {
                score[index] = false
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor((score[index] ?? false) ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)))
                    Text("回答错误")
                        .font(.system(size: 30, weight: .light))
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                }
            }).frame(height: 80)
        }
    }
}
