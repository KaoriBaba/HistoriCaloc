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
    var ans_flag:Bool //直前に"="が押されたかどうかの判定用
    
    init() {
        self.num = 0
        self.ans = 0
        self.ope = ""
        self.clr = ""
        self.dot = 0
        self.ans_flag = false
    }
    
    func makeNum(num:Double) {
        
        //直前に"="が押されていたら"AC"の処理を行う
        if ans_flag == true {
            self.num = 0
            self.dot = 0
            self.ans = 0
            self.ope = ""
            self.ans_flag = false
        }
        
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
        self.ans_flag = false
    }
    
    //前回までのansに対して四則演算を実施する
    func makeAns() {
        switch self.ope {
        case "+":
            self.ans += self.num
            self.num = 0
            self.dot = 0
            self.ans_flag = true
        case "-":
            self.ans -= self.num
            self.num = 0
            self.dot = 0
            self.ans_flag = true
        case "×":
            self.ans *= self.num
            self.num = 0
            self.dot = 0
            self.ans_flag = true
        case "÷":
            self.ans /= self.num
            self.num = 0
            self.dot = 0
            self.ans_flag = true
        default:
            self.ans = self.num
            self.num = 0
            self.dot = 0
            self.ans_flag = true
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
            self.ans_flag = false
        default:
            print("clr_error")
        }
    }
    
}
