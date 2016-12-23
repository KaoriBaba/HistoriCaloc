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
    
    @IBAction func numButton(_ sender: UIButton) {
        calc.makeNum(num:Double(sender.tag))
        //".0"で終わる場合は、Int型に変換して表示
        if String(calc.num).hasSuffix(".0") && calc.dot == 0{
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
        case 12:
            calc.makeOpe(ope:"-")
        case 13:
            calc.makeOpe(ope:"×")
        case 14:
            calc.makeOpe(ope:"÷")
        default:
            print("NotOperator")
        }
        //".0"で終わる場合は、Int型に変換して表示
        if String(calc.ans).hasSuffix(".0") && calc.dot == 0{
            calcView.text = String(Int(calc.ans))
        }else{
            calcView.text = String(calc.ans)
        }
        history.searchHistory(year:Int(calc.ans))
        historyView.text = String(history.year) + "年\n" + history.event
        historyImage.image = UIImage(named:history.img)
    }
    
    @IBAction func minusButton(_ sender: UIButton) {
        calc.changeMinus()
        //".0"で終わる場合は、Int型に変換して表示
        if String(calc.num).hasSuffix(".0") && calc.dot == 0{
            calcView.text = String(Int(calc.num))
        }else{
        //".0"以降にさらに"0"が続く場合には、"0"を連結させて表示
            let index:String.CharacterView.Index = String(calc.num).characters.index(of: ".")!
            let numberOfCharsAfterDot:Int
                = String(calc.num).distance(from:index, to:String(calc.num).endIndex)
            calcView.text = String(calc.num) + String(repeating:"0", count:calc.dot - numberOfCharsAfterDot)
        }
    }
    
    @IBAction func dotButton(_ sender: UIButton) {
        calc.dot = 1
    }
    
    @IBAction func ansButton(_ sender: UIButton) {
        calc.makeAns()
        //".0"で終わる場合は、Int型に変換して表示
        if String(calc.ans).hasSuffix(".0") && calc.dot == 0{
            calcView.text = String(Int(calc.ans))
        }else{
            calcView.text = String(calc.ans)
        }
        history.searchHistory(year:Int(calc.ans))
        historyView.text = String(history.year) + "年\n" + history.event
        historyImage.image = UIImage(named:history.img)
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        calcView.text = "0"
        switch sender.tag {
        case 16:
            calc.makeClear(clr:"C")
        case 17:
            calc.makeClear(clr:"AC")
        default:
            print("NotClear")
        }
        history.searchHistory(year:Int(calc.ans))
        historyView.text = String(history.year) + "年\n" + history.event
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
