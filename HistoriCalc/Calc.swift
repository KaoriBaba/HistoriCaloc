//
//  Calc.swift
//  HistoriCalc
//
//  Created by kaori baba on 2016/12/17.
//  Copyright © 2016年 kaori baba. All rights reserved.
//

import Foundation

class Calc {
    var num:Double
    var ans:Double
    var ope:String
    var clr:String
    var dot:Int
    
    init() {
        self.num = 0
        self.ans = 0
        self.ope = ""
        self.clr = ""
        self.dot = 0
    }
    
    func makeNum(num:Double) {
        //dotが入力されたら計算を切り替える
        if dot == 0 {
            self.num = self.num * 10 + num
        }else{
            self.num = self.num + num * pow(0.1, Double(dot))
            dot += 1
        }
    }
    
    func makeOpe(ope:String) {
        self.ope = ope
        //1回目に入力する数字はansの中に格納しておく
        if self.ans == 0 {
            self.ans = Double(self.num)
        }
        self.num = 0
        self.dot = 0
    }
    
    //前回までのansに対して四則演算を実施する
    func makeAns() {
        switch self.ope {
        case "+":
            self.ans += self.num
            self.num = 0
            self.dot = 0
        case "-":
            self.ans -= self.num
            self.num = 0
            self.dot = 0
        case "×":
            self.ans *= self.num
            self.num = 0
            self.dot = 0
        case "÷":
            self.ans /= self.num
            self.num = 0
            self.dot = 0
        default:
            self.ans = self.num
        }
    }
    
    func changeMinus(){
        self.num = self.num * (-1)
    }
    
    func makeClear(clr:String){
        self.clr = clr
        
        switch self.clr {
        //直近で入力した数字のみを消去
        case "C":
            self.num = 0
            self.dot = 0
        //全値を消去
        case "AC":
            self.num = 0
            self.dot = 0
            self.ans = 0
            self.ope = ""
        default:
            print("clr_error")
        }
    }
    
}
