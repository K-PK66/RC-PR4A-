//
//  Progress.swift
//  Recall
//
//  Created by mac on 2021/7/25.
//

import SwiftUI

var progress1 = """
    •血管性痴呆症 （通常由中风引起）患者，症状会逐步恶化，伴随每次新发中风后突然加重，两次中风间隔期得以部分改善。
    
    •在阿尔茨海默病 或路易体痴呆症 的患者中，症状倾向于逐步恶化。
    
    •Creutzfeldt-Jakob病 患者的痴呆症发展迅速且持续。
    """
var progress2 = """
    •记忆力减退

    •语言障碍

    •人格改变

    •定向障碍

    •日常任务障碍

    •破坏性或不当的行为
"""

var progress3 = """
    •他们可能忘记正常行为的规范，而表现为不恰当的行为。如果感觉到热，可能在公共场所赤裸。当他们有性冲动时，可能在大庭广众下手淫、说脏话或提出性要求。
    
    •由于不能理解所看到和听到的信息，他们可能会将帮助误解为威胁并进行攻击。如旁人帮助其穿衣，他们可能认为是一种攻击行为，而尝试保护自己甚至击打对方。
    
    •患者短期记忆受损，不记得被告知或已经做过的事情。患者重复提问或对话，要求持续获得关注，或重复索要已经得到的东西（如进餐）。当他们没有得到满足时，会变得不安或失望。
    
    •由于患者不能清楚地或根本不能表达自己的需求，在其痛苦时可能高声喊叫，在孤独或恐惧时可能四处徘徊。当患者不能入睡时，他们可能四处徘徊，吼叫或大声喊叫。
    """
var period = """
前期: 如果这个时候开始进行治疗干预，会使得发病过程大大延缓。

    •阶段一:了无痕迹；
    •阶段二:认为岁数大了，记性不好；
    •阶段三:令人在意的健忘。

中期:多一份耐心，多和他们交流，耐心的听他们说话，他们能够记得我们的时间不多了。

    •阶段四:痴呆症早期；
    •阶段五:痴呆症中期。

晚期:尽力延长老人的生命。

    •阶段六:痴呆症晚期；
    •阶段七:陷入百年孤独。
"""
struct Progress: View {
    var body: some View {
        ScrollView {
            VStack {
                Group{
                Text("痴呆症症状")
                    .font(.title)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.leading)
                    .frame(height: 100.0)
                    Text("        如果在痴呆症前期开始进行治疗干预，会使得发病过程大大延缓。虽然现在的医学无法将这个疾病逆转，但是如果患者能够在这个阶段接受医院正确的治疗，会大大延缓疾病的发展，明显改善病人在未来几十年的生存质量，并降低患者家庭的沉重负担。但是很遗憾，很多人在这个时候却不会选择去医院，大多数人仍然把这种现象归结于老糊涂了，从而错过了最佳的治疗时间。也就是说，当你身边的老人发生了“奇怪的健忘”的时候，请迅速带他们去就医.                           ")
                        .font(.title3)
                        .fontWeight(.heavy)
                    HStack {
                        Text("‬        痴呆症常常缓慢开始，随着时间发展而逐渐加重，最初不易被发现。痴呆症患者的精神功能通常会在2至10年内恶化，其发展速度因病因而异：")
                            .foregroundColor(.black)
                            .font(.title3)
                        Spacer()
                    }
                GroupBox {
                    HStack {
                        Text(progress1)
                            .font(.headline)
                        Spacer()
                    }
                }
                HStack {
                    Text("        进展速度也因人而异。回首过去一年中恶化的速度，通常可以预示来年。由于痴呆症患者记忆或遵守规章制度存在困难，将其转入疗养院或其它机构后其症状可能恶化。")
                        .font(.title3)
                    Spacer()
                }
                    
                }
                Group {
                Text("一般痴呆症状")
                    .font(.title)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.leading)
                    .frame(height: 100.0)
                HStack {
                    Text("大多数痴呆症患者症状相似。通常，痴呆症可导致：")
                        .font(.title3)
                    Spacer()
                }
                GroupBox {
                    HStack {
                        Text(progress2)
                            .font(.headline)
                        Spacer()
                    }
                }
                HStack {
                    Text("        尽管出现症状的时间各不相同，但将其分类为早期，中期或晚期症状有助于受影响的人，家庭成员和其他照护者对预期的情况有所了解。人格改变和破坏性行为(行为障碍 )可以早期出现，也可以在晚期才出现。某些痴呆症患者有癫痫发作，并可随时出现。")
                        .font(.title3)
                    Spacer()
                }
           
                }
                Group {
                Text("痴呆症患者的行为障碍")
                        .font(.title)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading)
                        .frame(height: 100.0)
                Text("‬        由于患者无法控制自己的行为，因此他们有时会有行为不当或破坏性行为。这些行为被称为行为障碍。痴呆症的一些方面会促进这些行为:")
                    .font(.title3)
                    }
                    GroupBox {
                        HStack {
                            Text(progress3)
                                .font(.headline)
                            Spacer()
                        }
                    }
                Text("‬痴呆症从开始发病到最终得病，到最后阶段，一共分为七个阶段")
                    .font(.title
                    .weight(.heavy))
                    .multilineTextAlignment(.center)
                    .frame(height: 100.0)
                GroupBox {
                    HStack {
                        Text(period)
                            .font(.headline)
                        Spacer()
                    }
                }
                Group{
                    VStack{
                        Group {
                            HStack {
                                Text("阶段一:了无痕迹")
                                    .font(.title2
                                            .weight(.heavy))
                                    .padding(.top)
                                    
                                Spacer()
                            }
                            Text("        他们在表面上看起来和健康的人并没有什么区别。因为虽然病人脑内的神经元开始死亡，但是死亡得不够多，并不影响正常的生活和思维的表达，这个阶段没有任何科技手段可以检测到。")
                                .font(.title3)
                            Image("page1")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        Group {
                            HStack {
                                Text("阶段二:是不是“老糊涂”了呢")
                                    .font(.title2
                                            .weight(.heavy))
                                    .padding(.top)
                                    
                                Spacer()
                            }
                            Text("        进入到这个阶段，他们会开始忘记一些平日里很熟悉的生活细节。比如明明经常做的拿手菜，却突然记不清楚应该放盐还是放糖；说好要去洗衣服，却让洗衣机空转了半天。周围人看到了也并不觉得有多奇怪，顶多是认为岁数大了，老糊涂了。")
                                .font(.title3)
                            Image("page2")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        Group {
                            HStack {
                                Text("阶段三:奇怪的健忘")
                                    .font(.title2
                                            .weight(.heavy))
                                    .padding(.top)
                                    
                                Spacer()
                            }
                            Text("        这个阶段，一些早期的患者就可以被诊断出来了。也是在这个阶段，他们的“健忘”已经到了让人觉得奇怪的地步，包括很明显的忘记人名地名或者日常物品的名称，没法记住陌生的人名，阅读出现障碍，弄丢贵重物品或把物品放在不该放的地方，做事变得无计划无条理性等特征。而且这个忘事太奇怪了，总是忘掉刚刚发生的事情，对于几十年之前的事情却还有一些记忆。")
                                .font(.title3)
                            Image("page3")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        Group {
                            HStack {
                                Text("阶段四:轻度阿尔茨海默症")
                                    .font(.title2
                                            .weight(.heavy))
                                    .padding(.top)
                                    
                                Spacer()
                            }
                            Text("        主要表现为：唉，我刚才说什么了？我刚才吃饭了吗？不知道，全都忘记了。他们会开始对最近发生过的事没有印象，不能进行较为复杂的心算，忘记一些个人经历，性格变得不积极不主动，尤其是面对一些大的社交场面或者很需要脑力去做的事的时候显得很畏惧等等。")
                                .font(.title3)
                            Image("page4")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        Group {
                            HStack {
                                Text("阶段五:中度阿尔茨海默症")
                                    .font(.title2
                                            .weight(.heavy))
                                    .padding(.top)
                                    
                                Spacer()
                            }
                            Text("        他们的记忆和其他认知功能已经开始出现很明显的障碍了，开始需要人陪护了。他们有可能会忘记家庭住址，电话号码，搞不清现在是哪个月份或什么季节，不知道自己身处何方（类似于奥古斯特·蒂特的症状），需要人帮着挑选合适的衣着出门。但他们通常还是可以记得自己和家人的名字，吃饭如厕也能自理。")
                                .font(.title3)
                            Image("page5")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        Group {
                            HStack {
                                Text("阶段六:中重度阿尔茨海默症")
                                    .font(.title2
                                            .weight(.heavy))
                                    .padding(.top)
                                    
                                Spacer()
                            }
                            Text("        他们的记忆力已经变得更差了，就连性格也开始出现了明显的变化，原本慈祥可亲的他们可能会无缘无故变得暴躁或者不耐烦。但是请不要嫌弃他们，这不是他们真的想这样做，也不表示他们不再爱我们了，只是因为他们脑内的神经细胞已经出现了大量的死亡，很多正常的生理功能都已经无法维持了。")
                                .font(.title3)
                            Image("page6")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        Group {
                            HStack {
                                Text("阶段七:重度阿尔茨海默症")
                                    .font(.title2
                                            .weight(.heavy))
                                    .padding(.top)
                                    
                                Spacer()
                            }
                            Text("        他们已经失去了对环境的感知力，说话和行动都有困难。他们可能念叨一些没有意义的词语或句子碎片。大小便失禁，饭要人喂，走路要人扶，坐不稳，不能抬头，不能微笑，全身肌肉僵硬，会不时出现不正常的条件反射等等。他们已经什么也不认识了，不认识人，不认识物，不认识字，就好像自己置身于一个异星球，眼睛看到的全不认识，耳朵听到的全不明白，仿佛自己一个人在孤独的生活。而这个孤独很长很长，就像一百年那么长，几乎没有尽头，直到死亡。")
                                .font(.title3)
                        }
                    }
                }
            }
        }
        .padding([.leading, .trailing], 50.0)
        .navigationBarTitle("疾病症状")
        }
}


struct Progress_Previews: PreviewProvider {
    static var previews: some View {
        Progress()
    }
}
