//
//  ViewController.swift
//  11.2dice
//
//  Created by Daniel on 2018/8/2.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            print("shake")
            reset()
        }
    }
    var player: AVPlayer?
    
    struct dice {
        let image : String
        let number : Int
    }
    var diceArrays = [dice(image: "1", number: 1),
                      dice(image: "2", number: 2),
                      dice(image: "3", number: 3),
                      dice(image: "4", number: 4),
                      dice(image: "5", number: 5),
                      dice(image: "6", number: 6)]
    @IBOutlet weak var outputTextView: UITextView!
    
    @IBOutlet var button: [UIButton]!
    
    @IBAction func diceButton(_ sender: UIButton) {
        reset()
    }
    @IBAction func againButton(_ sender: UIButton) {
        reset()
    }
    func reset(){
        var total : Int = 0
        for index in diceArrays.indices{
            diceArrays.shuffle()
            button[index].setImage(UIImage(named:"\(diceArrays[index].image)"), for: .normal)
            //計算總數
            total = total + diceArrays[index].number
        }
        //輸出總數
        outputTextView.text = "骰子數字總合為:\(total)"
        //播放音樂
        if let url = Bundle.main.url(forResource: "rolldice", withExtension: "mp3") {
            player = AVPlayer(url: url)
            player?.play()
        }
    }
}

