//
//  ViewController.swift
//  HistoriCalc
//
//  Created by kaori baba on 2016/12/17.
//  Copyright © 2016年 kaori baba. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let calc = Calc()
    let history = History()
    @IBOutlet weak var calcView: UILabel!
    @IBOutlet weak var historyView: UILabel!
    @IBOutlet weak var historyImage: UIImageView!
    
    var sound = SEManager()
    
    @IBAction func numButton(_ sender: UIButton) {
        calc.makeNum(num:Double(sender.tag))
        calc.button_status = "num"
        
        //ゼロを押した時だけ音を変える
        if sender.tag == 0 {
            sound.sePlay(soundName: "coin06.mp3")
        }else{
            sound.sePlay(soundName: "swish1.mp3")
        }
        
        
        //オーバーフローした場合はエラー
        if calc.num.isNaN {
            calcView.text = "error"
            return;
        }else if String(calc.num).hasSuffix(".0") && calc.dot == 0{
        //".0"で終わる場合は、Int型に変換して表示
            calcView.text = String(Int(calc.num))
        }else{
        //".0"以降にさらに"0"が続く場合には、"0"を連結させて表示
            let index:String.CharacterView.Index = String(calc.num).characters.index(of: ".")!
            let numberOfCharsAfterDot:Int
                = String(calc.num).distance(from:index, to:String(calc.num).endIndex)
            calcView.text = String(calc.num) + String(repeating:"0", count:calc.dot - numberOfCharsAfterDot)
        }
    }

    @IBAction func opeButton(_ sender: UIButton) {
        switch sender.tag {
        case 11:
            calc.makeOpe(ope:"+")
            sound.sePlay(soundName: "swing1.mp3")
        case 12:
            calc.makeOpe(ope:"-")
            sound.sePlay(soundName: "swing2.mp3")
        case 13:
            calc.makeOpe(ope:"×")
            sound.sePlay(soundName: "swing1.mp3")
        case 14:
            calc.makeOpe(ope:"÷")
            sound.sePlay(soundName: "coin07.mp3")
        default:
            print("NotOperator")
        }
        calc.button_status = "ope"
        

        //0で除算された場合・オーバーフローした場合はエラー
        if calc.ans.isNaN {
            calcView.text = "error"
            return;
        }else if String(calc.ans).hasSuffix(".0") && calc.dot == 0{
        //".0"で終わる場合は、Int型に変換して表示
            calcView.text = String(Int(calc.ans))
        }else{
            calcView.text = String(calc.ans)
        }
    }
    
    @IBAction func minusButton(_ sender: UIButton) {
        calc.changeMinus()
        sound.sePlay(soundName: "swing3.mp3")
        
        //今の状態が"ans"か"num"かを判定して表示
        if calc.button_status == "ans" {
            //".0"で終わる場合は、Int型に変換して表示
            if String(calc.ans).hasSuffix(".0") && calc.dot == 0{
                calcView.text = String(Int(calc.ans))
            }else{
                calcView.text = String(calc.ans)
            }
        }else{
            //".0"で終わる場合は、Int型に変換して表示
            if String(calc.num).hasSuffix(".0") && calc.dot == 0{
                calcView.text = String(Int(calc.num))
            }else{
                calcView.text = String(calc.num)
            }
        }
    }
    
    @IBAction func dotButton(_ sender: UIButton) {
        calc.dot = 1
        sound.sePlay(soundName: "knife.mp3")
        
        //今の状態が"ans"か"num"かを判定して表示
        if calc.button_status == "ans"{
            calc.makeClear(clr:"AC")
            calcView.text = String(Int(calc.ans))
        }else{
            calcView.text = String(Int(calc.num)) + "."
        }
    }
    
    @IBAction func ansButton(_ sender: UIButton) {
        calc.makeAns()
        calc.button_status = "ans"
        
        sound.sePlay(soundName: "shuriken_ninja_knifes1.mp3")
        
        //0で除算された場合・オーバーフローした場合はエラー
        if calc.ans.isNaN {
            calcView.text = "error"
            return;
        //".0"で終わる場合は、Int型に変換して表示
        }else if String(calc.ans).hasSuffix(".0") && calc.dot == 0{
            calcView.text = String(Int(calc.ans))
        }else{
            calcView.text = String(calc.ans)
        }
        
        //歴史を表示する
        history.searchHistory(year:Int(calc.ans))
        historyView.text = "西暦" + String(history.year) + "年\n" + history.event
        historyImage.image = UIImage(named:history.img)
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        calcView.text = "0"
        
        switch sender.tag {
        case 16:
            calc.makeClear(clr:"C")
            sound.sePlay(soundName: "pyo1.mp3")
        case 17:
            calc.makeClear(clr:"AC")
            sound.sePlay(soundName: "bomb.mp3")
        default:
            print("NotClear")
        }
        
        history.searchHistory(year:Int(calc.ans))
        historyView.text = "西暦" + String(history.year) + "年\n" + history.event
        historyImage.image = UIImage(named:history.img)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
