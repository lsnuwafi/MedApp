//
//  FMed.swift
//  Final
//
//  Created by user157383 on 12/14/19.
//  Copyright © 2019 user157383. All rights reserved.
//

struct Tasks: Decodable {
    var tasks : [OTC]
}

struct OTC: Decodable {
    var name: String
    var type: Int
    var Dosage: String
    var Tab: String
}

struct PMM: Decodable {
     var name: String
     var type: Int
    var useFor: Int
       var Dosage: String
       var Tab: String
}

struct TipList: Decodable {
    var tips: [Tip]
}

struct Tip: Decodable {
    var tiptitle: String
    var contents: String
}

struct Tiptitle: Decodable {
    var text: String
}

var savedTip = [Tip]()
var fOTC = [OTC]()
var savedOTC = [OTC]()
var fPMM = [PMM]()
var savedPMM = [PMM]()
