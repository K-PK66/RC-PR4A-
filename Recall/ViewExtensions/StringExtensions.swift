//
//  StringExtensions.swift
//  Recall
//
//  Created by jeffreyzfq on 2021/7/16.
//

import Foundation

extension String {
    // returns ourself but with numbers appended to the end
    // if necessary to make ourself unique with respect to those other Strings
    func uniqued<StringCollection>(withRespectTo otherStrings: StringCollection) -> String
        where StringCollection: Collection, StringCollection.Element == String {
        var unique = self
        while otherStrings.contains(unique) {
            unique = unique.incremented
        }
        return unique
    }
    
    // if a number is at the end of this String
    // this increments that number
    // otherwise, it appends the number 1
    var incremented: String  {
        let prefix = String(self.reversed().drop(while: { $0.isNumber }).reversed())
        if let number = Int(self.dropFirst(prefix.count)) {
            return "\(prefix)\(number+1)"
        } else {
            return "\(self) 1"
        }
    }
}
