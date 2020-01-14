//
//  LoginRequest.swift
//  MedApp
//
//  Created by user157383 on 12/25/19.
//  Copyright © 2019 user157383. All rights reserved.
//

import Foundation
struct LoginRequest {
    
    let url: URL
    
    enum EventError: Error{
        case canNotParseError
    }
    
    init(){
        let resourceString = "http://13.59.142.1:5000/tip"
        guard let url = URL(string: resourceString) else {
        fatalError()}
        
        self.url = url
        getInterEvents()
        print("is initing")
        
        
    }
    func getInterEvents(){
       
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            let str = String(data: data ?? Data(), encoding: .utf8)
            print("data: \(data)")
            print(str)
            do {
                
                let decoder = JSONDecoder()
                let listfTip = try decoder.decode([Tip].self, from: data ?? Data())
                
               
                savedTip = listfTip
                print(savedTip[0].tiptitle)
                
            } catch let parsing{
               print("is parsing")
                print(parsing)
            }
        }
        
        dataTask.resume()
        
    }
}
