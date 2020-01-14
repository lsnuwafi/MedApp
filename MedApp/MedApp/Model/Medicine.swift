//
//  Medicine.swift
//  Final
//
//  Created by user157383 on 12/9/19.
//  Copyright © 2019 user157383. All rights reserved.
//

import Foundation

var OTCMedicineList = [OTCMedicine]()
var favoriteMed = [Any]()
struct OTCMedicine{
    var name: String
    var mg: Int
    var tablet: Int
    init(_ s: String, _ mg: Int, _ tablet: Int) {
        self.name = s
        self.mg = mg
        self.tablet = tablet
        
    }
}
//class OTCMedicine: NSObject, NSSecureCoding {
//    static var supportsSecureCoding: Bool = true
//
//    func encode(with coder: NSCoder) {
//        coder.encode(name, forKey: "name")
//        coder.encode(mg, forKey: "mg")
//        coder.encode(tablet, forKey: "tablet")
//    }
//
//    required init?(coder: NSCoder) {
//        guard
//            let name = coder.decodeObject(forKey: "name") as? String,
//            let mg = coder.decodeObject(forKey: "mg") as? Int,
//            let tablet = coder.decodeObject(forKey: "tablet") as? Int
//
//        else {
//            return nil
//        }
//        self.name = name
//        self.mg = mg
//        self.tablet = tablet
//    }
//
//    var name: String
//    var mg: Int
//    var tablet: Int
////    init(_ s: String, _ mg: Int, _ tablet: Int) {
////
////    }
//}
var PMList = [PMMedicine]()
struct PMMedicine {
    var name: String
    init(_ s: String) {
        name = s
    }
}
