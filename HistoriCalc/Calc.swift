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
            makeClear(clr: "AC")
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
        //1つ目の数字が入力された場合は、ansにnumを格納
        if self.ans == 0 {
            self.ans = self.num
        }else{
        //それ以外の場合は、前回入力された演算子を用いて四則演算を実施する
            makeAns()
        }
        self.ope = ope
        self.ans_flag = false
        makeClear(clr: "C")
    }
    
    //前回までのansに対して四則演算を実施する
    func makeAns() {
        switch self.ope {
        case "+":
            self.ans += self.num
        case "-":
            self.ans -= self.num
        case "×":
            self.ans *= self.num
        case "÷":
            //0除算された場合はエラー
            if self.num == 0 {
                self.ans = Double.nan
            }else{
                self.ans /= self.num
            }
        default:
            //1つ目の数字が入力された場合は、ansにnumを格納
            if self.ans == 0 {
                self.ans = self.num
            }else{
            //それ以外の場合は、何もしない
                return;
            }
        }
        self.ans_flag = true
        self.ope = ""
        makeClear(clr: "C")
    }
    
    func changeMinus(){
        if num == 0 {
            self.ans = self.ans * (-1)
        }else{
            self.num = self.num * (-1)
        }
        self.ans_flag = false
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
