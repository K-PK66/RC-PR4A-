//
//  Doctor_seeing.swift
//  Recall
//
//  Created by mac on 2021/10/20.
//

import SwiftUI

var which_room = """
    •神经内科
        神经内科医生可以帮助老人明确痴呆的病因，因此，当怀疑家里老人患有痴呆时可以到神经内科就诊。

    •精神科
        如果有明显的烦躁、淡漠或者幻觉等精神症状可以到精神科就诊。一般来说痴呆首发精神症状极少是单纯的精神疾病，往往是由躯体或者大脑的疾病导致。到精神科就诊时，一定要注意给医生提供详尽的病史，尤其是当痴呆老人智力或者生活能力下降时，家属和精神科医生都要高度警惕发生痴呆的可能。

    •老年科和记忆门诊
        有些医院专门设立了老年科和记忆门诊，可以到这些门诊就诊。

    •康复科和记忆康复门诊
        当痴呆诊断明确后，应该及时前往康复科就诊，康复科或者记忆康复门诊可以为患者提供康复评估、康复训练和护理指导等帮助。如果出现记忆力减退等症状首诊也可以到康复科进行详细的功能评估。

    •日间照护中心
        痴呆老人需要长期照护。当痴呆老人被确诊后如果家属在工作时间没有足够的精力照顾老人，那么日间照护中心则是一个很好的选择。这类中心有由全科医生、护士、护工、社工组成的专业团队，主要为居民提供医疗、护理、康复训练、生活护理、文体活动等综合性养老服务。家属可选择早送晚接的日问照护服务，也可以选择营养餐饮、康复理疗上门照护等单项服务。
"""

struct Doctor_seeing: View {
    var body: some View {
        ScrollView {
            VStack {
                Group {
                    Text("就诊应携带哪些材料")
                        .font(.title)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading)
                        .frame(height: 100.0)

                    Text("        老人到医院就诊时，最好是由与老人接触最多的照护者陪老人去医院，因为他们对老人的情况最了解。就诊时需要携带老人既往的病历资料、所有的检查结果。如果住过院，要把出院小结、疾病诊断证明书等资料带齐，有头颅磁共振成像（MRI）或者计算机断层成像（CT）片子是最好的。家人还应详细了解老人最近服用的药物及剂量，以上这些资料都有助于医生的诊断和治疗。")
                        .font(.title3)
                }
                Group {
                    Text("就诊应去哪个科室")
                        .font(.title)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading)
                        .frame(height: 100.0)
                    GroupBox {
                        HStack {
                            Text(which_room)
                                .font(.headline)
                            .multilineTextAlignment(.leading)
                            Spacer()
                        }
                    }
                    Image("Process")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .padding([.leading, .bottom, .trailing], 50.0)
            .navigationTitle("如何正确就医")
        }
    }
}

struct Doctor_seeing_Previews: PreviewProvider {
    static var previews: some View {
        Doctor_seeing()
    }
}
