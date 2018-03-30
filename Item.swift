//
//  Item.swift
//  HomepwnerSecondTime
//
//  Created by Laurence Wingo on 3/29/18.
//  Copyright © 2018 Laurence Wingo. All rights reserved.
//

import UIKit

class Item: NSObject {
    
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    let dateCreated: NSDate
    
    init(name: String, serialNumber: String?, valueInDollars: Int) {
        self.name = name
        self.valueInDollars = valueInDollars
        self.serialNumber = serialNumber
        self.dateCreated = NSDate.init()
        
        super.init()
    }
    
    convenience init(random: Bool = false) {
        if random == true {
            let adjectives = ["Fluffy", "Rusty", "Shiny"]
            
            let nouns = ["Bear", "Spork", "Mac"]
            
            var idx = arc4random_uniform(UInt32(adjectives.count))
            //the idx variable is nothing more than a random number in which the upper bound is a integer value from the count of items in the adjectives array.  This integer value is then converted to an unsigned integer 32 bits type.
            
            let randomAdjective = adjectives[Int(idx)]
            //convert the idx value to an Integer and use that as the value of the adjectives array and choose the value represented at that index
            
            idx = arc4random_uniform(UInt32(nouns.count))
            //next wihtin this agorithem or "function", it uses the idx variable again to hold a random number generated from the number of elements existant within the nouns array.
            
            let randomNoun = nouns[Int(idx)]
            
            let randomName = "\(randomAdjective) \(randomNoun)"
            let randomValue = Int(arc4random_uniform(100))
            let randomSerialNumber = NSUUID.init().uuidString.components(separatedBy: "-").first!
            
            self.init(name: randomName, serialNumber: randomSerialNumber, valueInDollars: randomValue)
            
        } else {
            self.init(name: "", serialNumber: nil, valueInDollars: 0)
        }
    }
}
