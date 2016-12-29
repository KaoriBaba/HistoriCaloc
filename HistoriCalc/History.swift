//
//  History.swift
//  HistoriCalc
//
//  Created by kaori baba on 2016/12/18.
//  Copyright © 2016年 kaori baba. All rights reserved.
//

import Foundation

class History {
    var csvHistoryArray:[String]
    var historyArray:[String]
    var year:Int
    var event:String
    var img:String

    init() {
        let loadFile = LoadFile()
        self.csvHistoryArray = loadFile.loadCSV(fileName:"history")
        self.historyArray = []
        self.year = 0
        self.event = "何が起こった？"
        self.img = ""
    }
    
    
    func searchHistory(year:Int){
        
        for var i in 0 ... 15 {
            self.historyArray = csvHistoryArray[i].components(separatedBy:",")
            print(Int(historyArray[0])!)
            print(year)
            if Int(historyArray[0])! == year {
                self.year = Int(historyArray[0])!
                self.event = historyArray[1]
                self.img = historyArray[2]
                break
            }else{
                self.year = year
                self.event = "何にもなかったよ!"
                self.img = ""
            }
        }
    }

}
