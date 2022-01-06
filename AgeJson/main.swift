//
//  main.swift
//  AgeJrason
//
//  Created by Raul Leonardo Pavon Toral on 06/01/22.
//

import Foundation

struct DataObject: Decodable {
    let data: String
}

var age = [Int]()
let JSON = """
{"data":"key=IAfpK, age=58, key=IAfpK, age=64, key=IAfpK, age=47, key=IAfpK, age=68, key=IAfpK, age=76, key=IAfpK, age=79, key=IAfpK, age=29, key=IAfpK, age=32, key=IAfpK, age=88, key=IAfpK, age=65, key=IAfpK, age=33, key=IAfpK, age=13, key=IAfpK, age=14, key=IAfpK, age=30, key=IAfpK, age=85, key=IAfpK, age=10, key=IAfpK, age=90, key=IAfpK, age=74, key=IAfpK, age=12, key=IAfpK, age=3, key=IAfpK, age=66, key=IAfpK, age=78, key=IAfpK, age=77, key=IAfpK, age=24, key=IAfpK, age=59"}
"""

let jsonData = JSON.data(using: .utf8)!
let dataObject: DataObject = try! JSONDecoder().decode(DataObject.self, from: jsonData)

let array = dataObject.data.description.components(separatedBy: ", ")

for item in array {
    if item.contains("age") {
        let number = Int(item.replacingOccurrences(of: "age=", with: ""))
        if number ?? 0 >= 50 {
            age.append(number ?? 0)
        }
    }
}

print(age.count)

