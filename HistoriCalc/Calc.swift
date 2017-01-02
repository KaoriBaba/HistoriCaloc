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
    var button_status:String //押されたボタンの種類の記録（"num","ope","ans"）
    
    init() {
        self.num = 0
        self.ans = 0
        self.ope = ""
        self.clr = ""
        self.dot = 0
        self.button_status = ""
    }
    
    func makeNum(num:Double) {
        //直前に"="が押されていたら"AC"の処理を行う
        if button_status == "ans" {
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
        if button_status == "ans" {
            //直前に"="が押されていた場合は、何もしない
        }else{
            //それ以外の場合は、前回入力された演算子を用いて四則演算を実施する
            makeAns()
        }
        self.ope = ope
        makeClear(clr: "C")
    }
    
    //前回までのansに対して四則演算を実施する
    func makeAns() {
        
        //1つ目の数字が入力された後に"="が押された場合は、"ans"に"num"を格納
        if self.ans == 0 && button_status == "num"{
            self.ans = self.num
        //四則演算子入力後に"="が押された場合は、"num"同士で演算を実施
        }else if self.num == 0 && button_status == "ope" {
            self.num = self.ans
            makeAns()
        }else{
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
                return;
            }
        }
    }
    
    func changeMinus(){
        //直前に"="が押されていたら"ans"の処理を行う
        if button_status == "ans" {
            self.ans = self.ans * (-1)
        }else{
            self.num = self.num * (-1)
        }
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
            button_status = ""
        default:
            print("clr_error")
        }
    }
    
}
