//
//  ViewController.swift
//  countapp
//
//  Created by 村上英明 on 2025/04/20.
//

import UIKit

class ViewController: UIViewController {
    
    var timer: Timer!
    var countdown: Int = 0

    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func startTimer(time:Int){
        countdown = time
        if timer != nil {
            
            timer.invalidate()
        }
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:
            #selector(onTimerCalled), userInfo: nil, repeats: true)
    }
    @IBAction func select30second(){
        startTimer(time: 30)
    }
    @objc func onTimerCalled() {
        
        updateLabel()
        
        countdown -= 1
        
        if countdown < 0 {
            let stopAlart = UIAlertController(title: "タイマーが終了されました", message: "nil", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            
            stopAlart.addAction(okAction)
            
            present(stopAlart, animated: true)
            
            timer.invalidate()
            }
    }
    
    func updateLabel(){
        let remainingMinutes: Int = countdown / 60
        let remainingSeconds: Int = countdown % 60
        
        label.text = String(format: "%02d:%02d", remainingMinutes, remainingSeconds)
    }
    
    func showStopAlert(){
        let stopAlart = UIAlertController(title: "タイマーが終了されました", message: "nil", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        stopAlart.addAction(okAction)
        
        present(stopAlart, animated: true)
    }
    @IBAction func select120second(){
        startTimer(time: 30)
    }
    @IBAction func select1minn(){
        startTimer(time: 60)
    }
    
    @IBAction func minin(){
        startTimer(time: 300)
    }
    
    @IBAction func mininio(){
        startTimer(time: 600)
        
    }


}

