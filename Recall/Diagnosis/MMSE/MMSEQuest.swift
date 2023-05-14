//
//  MMSEQuest.swift
//  Recall
//
//  Created by jeffreyzfq on 2021/7/21.
//

import Foundation

class MMSEQuest {
    var id: Int
    var title: String
    var content: String
    var detail: String
    
    init(id: Int, title: String, content: String, detail: String) {
        self.id = id
        self.title = title
        self.content = content
        self.detail = detail
    }
}

let MMSEQuestInfo = [
    //1
    MMSEQuest(id: 1, title: "定向力", content: "用来判断一个人对时间、地点、人物以及自身状态的认识能力。", detail: "今天是星期几?"),
    MMSEQuest(id: 2, title: "定向力", content: "用来判断一个人对时间、地点、人物以及自身状态的认识能力。", detail: "今天是几号?"),
    MMSEQuest(id: 3, title: "定向力", content: "用来判断一个人对时间、地点、人物以及自身状态的认识能力。", detail: "现在是几月份?"),
    MMSEQuest(id: 4, title: "定向力", content: "用来判断一个人对时间、地点、人物以及自身状态的认识能力。", detail: "现在是什么季节?"),
    MMSEQuest(id: 5, title: "定向力", content: "用来判断一个人对时间、地点、人物以及自身状态的认识能力。", detail: "今年的年份?"),
    
    //2
    MMSEQuest(id: 6, title: "定向力", content: "用来判断一个人对时间、地点、人物以及自身状态的认识能力。", detail: "现在我们在哪里(省、市)?"),
    MMSEQuest(id: 7, title: "定向力", content: "现用来判断一个人对时间、地点、人物以及自身状态的认识能力。", detail: "现在我们在什么地方(区、县)?"),
    MMSEQuest(id: 8, title: "定向力", content: "用来判断一个人对时间、地点、人物以及自身状态的认识能力。", detail: "现在我们在什么街道(乡、村)?"),
    MMSEQuest(id: 9, title: "定向力", content: "用来判断一个人对时间、地点、人物以及自身状态的认识能力。", detail: "这里是什么地方(地址名称)?"),
    MMSEQuest(id: 10, title: "定向力", content: "用来判断一个人对时间、地点、人物以及自身状态的认识能力。", detail: "现在我们在第几层楼?"),
    
    //3
    MMSEQuest(id: 11, title: "记忆力", content: "现在我要说三样东西的名称，在我讲完以后，请您重复说一遍并记住。", detail: "复述：皮球"),
    MMSEQuest(id: 12, title: "记忆力", content: "现在我要说三样东西的名称，在我讲完以后，请您重复说一遍并记住。", detail: "复述：国旗"),
    MMSEQuest(id: 13, title: "记忆力", content: "现在我要说三样东西的名称，在我讲完以后，请您重复说一遍并记住。", detail: "复述：树木"),
    
    //4
    MMSEQuest(id: 14, title: "注意力和计算力", content: "请您算一算100减7，然后从所得的数目再减去7，请您将每减一个7后的答案告诉我，直到我说停为止。", detail: "100-7=93"),
    MMSEQuest(id: 15, title: "注意力和计算力", content: "请您算一算100减7，然后从所得的数目再减去7，请您将每减一个7后的答案告诉我，直到我说停为止。", detail: "93-7=86"),
    MMSEQuest(id: 16, title: "注意力和计算力", content: "请您算一算100减7，然后从所得的数目再减去7，请您将每减一个7后的答案告诉我，直到我说停为止。", detail: "86-7=79"),
    MMSEQuest(id: 17, title: "注意力和计算力", content: "请您算一算100减7，然后从所得的数目再减去7，请您将每减一个7后的答案告诉我，直到我说停为止。", detail: "79-7=72"),
    MMSEQuest(id: 18, title: "注意力和计算力", content: "请您算一算100减7，然后从所得的数目再减去7，请您将每减一个7后的答案告诉我，直到我说停为止。", detail: "72-7=65"),
    
    //5
    MMSEQuest(id: 19, title: "回忆能力", content: "刚才让你记住了三样东西，现在请复述第一样东西是什么。           ", detail: "回忆：皮球"),
    MMSEQuest(id: 20, title: "回忆能力", content: "刚才让你记住了三样东西，现在请复述第二样东西是什么。          ", detail: "回忆：国旗"),
    MMSEQuest(id: 21, title: "回忆能力", content: "刚才让你记住了三样东西，现在请复述第三样东西是什么。          ", detail: "回忆：树木"),
    
    //6
    MMSEQuest(id: 22, title: "语言能力", content: "（出示手表）这个东西叫什么？                    ", detail: "辨认：手表"),
    MMSEQuest(id: 23, title: "语言能力", content: "（出示钢笔）这个东西叫什么？                    ", detail: "辨认：钢笔"),
    MMSEQuest(id: 24, title: "语言能力", content: "现在我要说一句话，请您跟着我清楚的重复一遍：四十四只石狮子。", detail: "复述：四十四只石狮子。"),
    MMSEQuest(id: 25, title: "语言能力", content: "请您念一念这句话，并且按它的意思去做：闭上你的眼睛。", detail: "按纸上指令做动作：闭上你的眼睛。"),
    MMSEQuest(id: 26, title: "语言能力", content: "请您按我说的去做，现在开始：用右手拿着这张纸，用两只手将它对折起来，放在您的大腿上。", detail: "按口头指令动作：用右手拿纸"),
    MMSEQuest(id: 27, title: "语言能力", content: "请您按我说的去做，现在开始：用右手拿着这张纸，用两只手将它对折起来，放在您的大腿上。", detail: "按口头指令动作：将纸对折"),
    MMSEQuest(id: 28, title: "语言能力", content: "请您按我说的去做，现在开始：用右手拿着这张纸，用两只手将它对折起来，放在您的大腿上。", detail: "按口头指令动作：将纸放在自己大腿上"),
    MMSEQuest(id: 29, title: "语言能力", content: "您给我写一句完整的句子。                              ", detail: "能够写一句完整句子(含主语、谓语、宾语)"),
    MMSEQuest(id: 30, title: "语言能力", content: "这是一张图，请您在纸上照样画出来。                    ", detail: "按样画图"),
]
