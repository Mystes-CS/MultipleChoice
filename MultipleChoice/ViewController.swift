//
//  ViewController.swift
//  MultipleChoice
//
//  Created by User18 on 2018/7/5.
//  Copyright © 2018年 User18. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    struct QA{
        var Q:String
        var choose:[String]=[]
        var A:Int
    }
    var score=0
    var answser:Int=0;
    var Qcount=0
    @IBAction func restart(_ sender: Any) {
        gameStart()
        next()
    }
    @IBOutlet weak var Qimage: UIImageView!
    @IBOutlet weak var Qnumber: UILabel!
    @IBOutlet var Buttons: [UIButton]!
    @IBOutlet weak var Score: UILabel!
    var questions:[QA]=[]
    var Qlist:[Int]=[]
    var number:Int=0
    @IBAction func judge(_ sender: UIButton) {
        number = sender.tag
        if(number==answser)
        {
            score=score+10
            Score.text="\(score)";
        }
        check()
    }
    func gameStart(){
        questions = [QA(Q:"1.jpg",choose:["秦始皇","漢武帝","隋煬帝","唐高祖"],A:1),
                         QA(Q:"2.jpg",choose:["高斯","歐拉","拉格朗日","克卜勒"],A:1),
                         QA(Q:"3.jpg",choose:["管仲","鮑叔牙","晏嬰","魏徵"],A:3),
                         QA(Q:"4.jpg",choose:["宋少卿","屈中恆","鈕承澤","郭子亁"],A:2),
                         QA(Q:"5.jpg",choose:["挪威","丹麥","瑞典","英格蘭"],A:1),
                         QA(Q:"6.jpg",choose:["莊子","老子","孔子","孟子"],A:3),
                         QA(Q:"7.jpg",choose:["姜維","黃忠","趙雲","馬超"],A:4),
                         QA(Q:"8.jpg",choose:["莊子","老子","孔子","孟子"],A:2),
                         QA(Q:"9.jpg",choose:["波扎那","諾魯","葉門","塔吉克"],A:4),
                         QA(Q:"10.jpg",choose:["月讀","天照大神","素盞嗚尊","大國主神"],A:3),
                         QA(Q:"11.jpg",choose:["韓湘子","呂洞賓","張果老","藍采和"],A:1),
                         QA(Q:"12.jpg",choose:["克里斯蒂亞諾·羅納爾多","貝克漢","米拉德·穆罕默迪","阿里森·貝克爾"],A:2),
                         QA(Q:"13.jpg",choose:["東尼·布萊爾","大衛·卡麥隆","戈登·布朗","約翰·梅傑"],A:2),
                         QA(Q:"14.jpg",choose:["蘇格拉底","歐幾里得","阿基米德","畢達哥拉斯"],A:2),
                         QA(Q:"15.jpg",choose:["松本城","松江城","名古屋城","姬路城"],A:4),
                         QA(Q:"16.jpg",choose:["R2-D2","C-3PO","BB-8","BB-9E"],A:1),
                         QA(Q:"17.jpg",choose:["達伽馬","迪亞士","哥倫布","麥哲倫"],A:3),
                         QA(Q:"18.jpg",choose:["布里茲涅夫","史達林","赫魯雪夫","戈巴契夫"],A:4),
                         QA(Q:"19.jpg",choose:["路易十五","腓力一世","路易十三","路易十四"],A:4),
                         QA(Q:"20.jpg",choose:["明智光秀","豐臣秀吉","德川家康","織田信長"],A:3),
                         ]
        score=0
        Qcount=0
        Score.text="\(score)";
        Qlist = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]
    }
    func next(){
        Qcount=Qcount+1
        var index:Int=0
        let randomDistribution = GKRandomDistribution(lowestValue: 0, highestValue: Qlist.count-1)
        let number = randomDistribution.nextInt()
        index = Qlist[number]
        for i in 0 ..< Buttons.count{
            Buttons[i].setTitle("\(i+1). \(questions[index].choose[i])", for: UIControlState.normal)
        }
        Qlist.remove(at: number)
        Qnumber.text=String(Qcount)
        Qimage.image=UIImage(named: questions[index].Q)
        answser=questions[index].A
    }
    func check(){
        if(Qcount==10)
        {
            let alertController = UIAlertController(title: "遊戲結束", message: "分數\(score)", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(
                title: "OK",
                style: .default,
                handler: {
                    action in self.gameStart()
            }
            )
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
            gameStart()
            next()
        }
        else
        {
            next()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        gameStart()
        next()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

