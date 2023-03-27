//
//  ViewController.swift
//  IOS_Calculator
//
//  Created by 방유빈 on 2023/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel:UILabel!
    @IBOutlet weak var btn0:UIButton!
    @IBOutlet weak var btn1:UIButton!
    @IBOutlet weak var btn2:UIButton!
    @IBOutlet weak var btn3:UIButton!
    @IBOutlet weak var btn4:UIButton!
    @IBOutlet weak var btn5:UIButton!
    @IBOutlet weak var btn6:UIButton!
    @IBOutlet weak var btn7:UIButton!
    @IBOutlet weak var btn8:UIButton!
    @IBOutlet weak var btn9:UIButton!
    @IBOutlet weak var dotBtn:UIButton!
    @IBOutlet weak var equalBtn:UIButton!
    @IBOutlet weak var plusBtn:UIButton!
    @IBOutlet weak var minusBtn:UIButton!
    @IBOutlet weak var multiplyBtn:UIButton!
    @IBOutlet weak var divideBtn:UIButton!
    @IBOutlet weak var percentBtn:UIButton!
    @IBOutlet weak var plusMinusBtn:UIButton!
    @IBOutlet weak var clearBtn:UIButton!

    var prevNumber:String = "0"
    var calculating:Bool = false
    var operatorIdx:Int?
    var operatorBtn = [UIButton]()
//    override func viewWillLayoutSubviews(){
//        configRoundBtn()
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configRoundBtn()
        displayLabel.adjustsFontSizeToFitWidth = true
        initOperatorBtnArray()
        
    }
    func initOperatorBtnArray(){
        operatorBtn.append(plusBtn)
        operatorBtn.append(minusBtn)
        operatorBtn.append(multiplyBtn)
        operatorBtn.append(divideBtn)
    }
    func configRoundBtn(){
        let cycleBtnList:[UIButton] = [btn0, btn1, btn2, btn3, btn4, btn5, btn6, btn7, btn8, btn9, dotBtn, equalBtn, plusBtn, minusBtn, multiplyBtn, divideBtn, percentBtn, plusMinusBtn, clearBtn]
        cycleBtnList.forEach{ (btn) in
//            print(btn.bounds.height)
            btn.layer.cornerRadius = btn.bounds.height / 2
            btn.clipsToBounds = true
        }
        
    }
    
    @IBAction func numberBtnClick(_ sender:UIButton){
        clearBtn.setTitle("C", for: .normal)
        
        if calculating {
            for btn in operatorBtn{
                if btn.tag == operatorIdx{
                    btn.backgroundColor = .orange
                    btn.setTitleColor(.white, for: .normal)
                }
            }
            displayLabel.text = String(sender.tag)
            calculating = false
        }else{
            if displayLabel.text == "0" {
                displayLabel.text = String(sender.tag)
            }else{
                displayLabel.text = displayLabel.text!+String(sender.tag)
            }
        }
    }
    @IBAction func operatorBtnClick(_ sender:UIButton){
        if calculating {
            for btn in operatorBtn{
                if btn.tag == operatorIdx{
                    btn.backgroundColor = .orange
                    btn.setTitleColor(.white, for: .normal)
                }
            }
        }
        calculating = true
        operatorIdx = sender.tag
        prevNumber = displayLabel.text ?? "0"
        for btn in operatorBtn{
            if sender == btn {
                btn.backgroundColor = .white
                btn.setTitleColor(.orange, for: .normal)
            }
        }
    }
    
    @IBAction func equalBtnClick(_ sender:UIButton){
        
    }
}

