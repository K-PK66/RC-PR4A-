//
//  Avoid.swift
//  Recall
//
//  Created by mac on 2021/7/18.
//

import SwiftUI

var avoid = """
    阿尔茨海默病的风险因素种类繁多，它可以是你从父母那里获得的遗传因子，也可以是你每天都在重复的生活方式，最近的一项研究发现大约有20余种阿尔茨海默病可调控风险因素，这意味着我们对这种恐怖的痴呆疾病并非完全束手无策。
    """

var nineCase1 = """
    •肥胖
    •体弱
    •颈动脉疾病
    """
var nineCase2 = """
    •高血压
    •低教育水平
    •抑郁症
    """
var nineCase3 = """
    •高同型半胱氨酸血症
    •糖尿病
    •吸烟
    """
struct Avoid: View {
    var body: some View {
        ScrollView {
            VStack {
                Group{
                    Text("如何预防痴呆症")
                        .font(.title)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading)
                        .frame(height: 100.0)
                    
                    Text("        阿尔茨海默病的风险因素种类繁多，它可以是你从父母那里获得的遗传因子，也可以是你每天都在重复的生活方式，我们可以通过调整这些风险因素来对疾病进行控制，这意味着我们对这种疾病并非完全束手无策。")
                        .font(.title3)
                    Image("avoid1")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text("        加利福尼亚大学旧金山分校神经内科记忆和衰老研究中心的郁金泰及其同事最近系统的研究了阿尔茨海默病的可调性危险因素，他们发现有九种风险因素与全球约2/3阿尔茨海默病患者的发病有关。该发现为我们主动采取措施预防阿尔茨海默病的发生提供了极为有力的证据支持。这9种风险因素分别为：")
                        .font(.title3)
                }
                Group {
                    GroupBox {
                        HStack {
                            Text(nineCase1)
                            Spacer()
                            Text(nineCase2)
                            Spacer()
                            Text(nineCase3)
                        }
                    }
                }
                Group {
                    Text("避免风险因素的方法")
                        .font(.title)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading)
                        .frame(height: 100.0)
                    VStack {
                        HStack {
                            Text("肥胖")
                                .font(.title3)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.black)

                            Spacer()
                        }
                        .padding(.top)

                        Text("        让你的体重达到健康标准并保持下去，就这么简单。在任何年龄段，维持一个“正常”体重都是值得推荐的。")
                            .font(.title3)
                    }
                    VStack {
                        HStack {
                            Text("体弱")
                                .font(.title3)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.black)
                            Spacer()
                        }
                        .padding(.top)

                        Text("        避免体弱并不能单纯依赖健康饮食或勤加锻炼。如果一个人是因为忘记吃饭或不能自理而变得越来越虚弱，那么痴呆可能早已进展到某种程度了。体弱也可能是其它混杂因素存在的象征，例如一个人可能因为经济状况不佳或未能得到足够的社会支持而无法做到健康饮食。")
                            .font(.title3)
                        Spacer()
                    }
                    VStack {
                        HStack {
                            Text("颈动脉疾病")
                                .font(.title3)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.black)
                            Spacer()
                        }
                        .padding(.top)

                        Text("        在严重情况下，医生可能需要借助外科手术才能使堵塞的颈动脉再通。在其它一般情况下，抗斑块形成药物可能有助于清理阻塞，预防中风。但很多人可以通过改变生活习惯来调控颈动脉疾病：包括营养饮食，监测血脂、血压，积极锻炼，戒烟等。")
                            .font(.title3)
                        Spacer()
                    }
                    VStack {
                        HStack {
                            Text("高血压")
                                .font(.title3)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.black)
                            Spacer()
                        }
                        Text("        标准建议是把血压降至140/90 mmHg水平以下。国家卫生研究院目前正在研究将血压降到更低是否可以显著改善大脑健康。")
                            .font(.title3)
                        Spacer()
                    }
                    .padding(.top)

                }
                Group {
                    VStack {
                        HStack {
                            Text("低教育水平")
                                .font(.title3)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.black)
                            Spacer()
                        }
                        Text("        你接受的教育年限越多，发生阿尔茨海默病的风险就越低。当然，很少有人能够抛弃一切，重返校园，但另有一些较为灵活的方式来实现继续再教育，如上舞蹈课，自学吉他，或学习一门新语言等。")
                            .font(.title3)
                        Spacer()
                    }
                Group {
                    VStack {
                        HStack {
                            Text("抑郁症")
                                .font(.title3)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.black)
                            Spacer()
                        }
                        Text("        不管是通过治疗、药物、改变生活方式还是联合多种技术，最终目标都是让抑郁症患者融入社会，保持机能活跃。如果你还在为讲出你自身的情感或精神健康障碍而犹豫不决，那么就想想这或许将是你为维护自身大脑健康所迈出的重要一步吧。")
                            .font(.title3)
                        Spacer()
                    }
                }
                    Group {
                        VStack {
                            HStack {
                                Text("高同型半胱氨酸血症")
                                    .font(.title3)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.black)
                                Spacer()
                            }
                            Text("        尽量每周至少有一天不吃肉类。多吃绿叶蔬菜，水果和全麦谷物可能有助于降低同型半胱氨酸水平。")
                                .font(.title3)
                            Spacer()
                        }
                    }
                    Group {
                        VStack {
                            HStack {
                                Text("糖尿病")
                                    .font(.title3)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.black)
                                Spacer()
                            }
                            Text("        大约2900万美国人患有2型糖尿病。其中，仅仅35%称其血糖水平得到了一定程度的控制，有5%的人称曾未采取任何降糖措施。即使持续血糖监测听起来很费事，但避免糖尿病并发症极为重要——这取决于你在医生指导下的血糖管理情况。")
                                .font(.title3)
                            Spacer()
                        }
                    }
                    Group {
                        VStack {
                            HStack {
                                Text("吸烟")
                                    .font(.title3)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.black)
                                Spacer()
                            }
                            Text("        如果你仍未戒烟，那么不妨把阿尔茨海默病添加在你立即戒烟理由的清单之中，只要行动起来，就绝不会太晚。")
                                .font(.title3)
                            Spacer()
                        }
                    }
//
//                    Text("        菠菜中含有丰富的维生素A、维生素C、维生素B1、维生素B2等营养成分。因此，菠菜是脑细胞代谢的最佳供给者之一。菠菜中还含有大量的抗氧化物质，对人体内的一些有害物质有清除作用。因此，常吃菠菜有助于减轻老年人记忆力减退的症状。")
//                        .font(.title3)
//                    Image("Image10")
//                    Divider()
//                    Text("大豆")
//                        .font(.largeTitle)
//                        .fontWeight(.heavy)
//                        .padding(.bottom)
//
//                    Text("        人们把大豆称为中国的牛奶。大豆中富含油脂、磷脂及二十多种维生素和微量元素。特别是大豆中所含的卵磷脂进入人的大脑后能释放乙酰胆碱。而乙酰胆碱能促进神经细胞间的信息传递，从而能改善老年痴呆病人的症状。")
//                        .font(.title3)
//                    Image("Image11")
//                    Text("补充维生素D")
//                        .font(.largeTitle)
//                        .fontWeight(.heavy)
//                        .padding(.bottom)
//                    Text("        研究发现，维生素D水平不足的中年人智力衰退速度更快，患老年痴呆症的危险和几率也相对更大,为了预防老年痴呆，日常生活中适量补充维生素d十分重要。在这里建议大家使用悦而维生素D滴剂。其可以影响钙磷代谢，调节激素分泌、影响免疫功能、调节细胞增生与分化，从而预防和辅助治疗多种疾病。对于促进肠钙吸收效果也十分明显。研究发现，维生素D3不足，钙的吸收率只有10-15%;当人体充足维生素D3后，对于钙的吸收率可提升3-4倍。由此可见人体补充维生素D3的重要性。")
//                        .font(.title3)
//                    Image("Image14")
                }
                .padding(.top)
            }
        }
        .padding([.leading, .trailing], 50.0)
        .navigationBarTitle("如何预防痴呆症")
    }
}

struct Avoid_Previews: PreviewProvider {
    static var previews: some View {
        Avoid()
    }
}
