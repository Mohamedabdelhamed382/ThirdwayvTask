//
//  String+Extension.swift
//  ThirdwayvTask
//
//  Created by MOHAMED ABD ELHAMED AHMED on 09/06/2022.
//

import Foundation
extension String{
    var asUrl: URL?{
        return URL(string: self)
    }
    
}

extension Data {
    public func toString() -> String {
        return String(data: self, encoding: .utf8) ?? "";
    }
}
extension Data {
    func hex(separator:String = "") -> String {
        return (self.map { String(format: "%02X", $0) }).joined(separator: separator)
    }
}
