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
        
        for var i in 0 ... 220 {
            self.historyArray = csvHistoryArray[i].components(separatedBy:",")
            if year > 2017{
                self.year = year
                self.event = "未来はわからない!"
                self.img = ""
            }else if year < -2000000{
                self.year = year
                self.event = "すごく昔!"
                self.img = ""
            }else if -2000000 <= year && year < -10000{
                self.year = year
                self.event = "先土器時代 (2万年~1万年前頃)"
                self.img = ""
            }else if -10000 <= year && year < -300{
                self.year = year
                self.event = "縄文時代 (1万年前~紀元前3世紀頃)"
                self.img = ""
            }else if Int(historyArray[0])! == year {
                self.year = Int(historyArray[0])!
                self.event = historyArray[1]
                self.img = historyArray[2]
                break
            }else if -300 <= year && year < 350{
                self.year = year
                self.event = "弥生時代 (紀元前3世紀~3世紀頃)"
                self.img = ""
            }else if 350 <= year && year < 592{
                self.year = year
                self.event = "古墳時代 (3世紀中頃~7世紀頃)"
                self.img = ""
            }else if 592 <= year && year < 710{
                self.year = year
                self.event = "飛鳥時代"
                self.img = ""
            }else if 710 <= year && year < 794{
                self.year = year
                self.event = "奈良時代"
                self.img = ""
            }else if 794 <= year && year < 1185{
                self.year = year
                self.event = "平安時代"
                self.img = ""
            }else if 1185 <= year && year < 1336{
                self.year = year
                self.event = "鎌倉時代"
                self.img = ""
            }else if 1338 <= year && year < 1574{
                self.year = year
                self.event = "室町時代 (1336~1392南北朝時代 / 1467~1590 戦国時代)"
                self.img = ""
            }else if 1574 <= year && year < 1603{
                self.year = year
                self.event = "安土桃山時代"
                self.img = ""
            }else if 1603 <= year && year < 1868{
                self.year = year
                self.event = "江戸時代"
                self.img = ""
            }else if 1868 <= year && year < 1912{
                self.year = year
                self.event = "明治時代"
                self.img = ""
            }else if 1912 <= year && year < 1926{
                self.year = year
                self.event = "大正時代"
                self.img = ""
            }else if 1926 <= year && year < 1989{
                self.year = year
                self.event = "昭和時代"
                self.img = ""
            }else if 1989 <= year && year < 2018{
                self.year = year
                self.event = "平成時代"
                self.img = ""
            }else{
                self.year = year
                self.event = "何にもなかったよ!"
                self.img = ""
            }
        }
    }

}
