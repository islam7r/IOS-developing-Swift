//
//  ViewController.swift
//  CatchTheKenny
//
//  Created by Islam Rzayev on 15.10.23.
//

import UIKit

class ViewController: UIViewController {
    
    
    
   
    
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var highscoreLabel: UILabel!
    
    @IBOutlet weak var kenny1: UIImageView!
    
    @IBOutlet weak var kenny2: UIImageView!
    
    @IBOutlet weak var kenny3: UIImageView!
    
    @IBOutlet weak var kenny4: UIImageView!
    
    @IBOutlet weak var kenny5: UIImageView!
    
    @IBOutlet weak var kenny6: UIImageView!
    
    @IBOutlet weak var kenny7: UIImageView!
    
    @IBOutlet weak var kenny8: UIImageView!
    
    @IBOutlet weak var kenny9: UIImageView!
    
    var timer = Timer()
    var kennyHideTimer = Timer()
    var kennyArray = [UIImageView]()
    var counter = 0
    var score = 0
    var highscore = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        
        //Images
        
        kenny1.isUserInteractionEnabled = true
        kenny2.isUserInteractionEnabled = true
        kenny3.isUserInteractionEnabled = true
        kenny4.isUserInteractionEnabled = true
        kenny5.isUserInteractionEnabled = true
        kenny6.isUserInteractionEnabled = true
        kenny7.isUserInteractionEnabled = true
        kenny8.isUserInteractionEnabled = true
        kenny9.isUserInteractionEnabled = true
        
        
        let gestureRecognizerKenny1 = UITapGestureRecognizer(target: self, action: #selector(tapToScore))
        let gestureRecognizerKenny2 = UITapGestureRecognizer(target: self, action: #selector(tapToScore))
        let gestureRecognizerKenny3 = UITapGestureRecognizer(target: self, action: #selector(tapToScore))
        let gestureRecognizerKenny4 = UITapGestureRecognizer(target: self, action: #selector(tapToScore))
        let gestureRecognizerKenny5 = UITapGestureRecognizer(target: self, action: #selector(tapToScore))
        let gestureRecognizerKenny6 = UITapGestureRecognizer(target: self, action: #selector(tapToScore))
        let gestureRecognizerKenny7 = UITapGestureRecognizer(target: self, action: #selector(tapToScore))
        let gestureRecognizerKenny8 = UITapGestureRecognizer(target: self, action: #selector(tapToScore))
        let gestureRecognizerKenny9 = UITapGestureRecognizer(target: self, action: #selector(tapToScore))


        
        kenny1.addGestureRecognizer(gestureRecognizerKenny1)
        kenny2.addGestureRecognizer(gestureRecognizerKenny2)
        kenny3.addGestureRecognizer(gestureRecognizerKenny3)
        kenny4.addGestureRecognizer(gestureRecognizerKenny4)
        kenny5.addGestureRecognizer(gestureRecognizerKenny5)
        kenny6.addGestureRecognizer(gestureRecognizerKenny6)
        kenny7.addGestureRecognizer(gestureRecognizerKenny7)
        kenny8.addGestureRecognizer(gestureRecognizerKenny8)
        kenny9.addGestureRecognizer(gestureRecognizerKenny9)
        
        
    
        kennyArray = [kenny1, kenny2, kenny3, kenny4, kenny5, kenny6, kenny7, kenny8, kenny9]
        
        
        
        
        

        
        
        


        
        counter = 10
        
        timeLabel.text = "Time: \(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        
        kennyHideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideKenny), userInfo: nil, repeats: true)
        
        
        
    }
    
   @objc func hideKenny(){
        for kenny in kennyArray {
            kenny.isHidden = true
        
        }
        let random = Int(arc4random_uniform(UInt32(kennyArray.count - 1)))
        kennyArray[random].isHidden = false
    }
    
    
    @objc func tapToScore(){
        score += 1
        scoreLabel.text = "Score: \(score)"
    }

    @objc func timerFunction(){
                 
        counter -= 1
        timeLabel.text = "Time: \(counter)"

        if (counter == 0){
            timer.invalidate()
            kennyHideTimer.invalidate()
            timeLabel.text = "Time's over"
            
            for kenny in kennyArray {
                kenny.isHidden = true
            }
            
            
            if (self.score > self.highscore){
                self.highscore = self.score
                UserDefaults.standard.set(self.highscore, forKey: "highscore")
            }
            
            
            
            let alertButton = UIAlertController(title: "Time's over", message: "Your score: \(score)", preferredStyle: UIAlertController.Style.alert)
                    let leaveButton = UIAlertAction(title: "Leave", style: UIAlertAction.Style.destructive)
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.cancel) { UIAlertAction in
                self.score = 0
                self.scoreLabel.text = String("Score: \(self.score)")
                self.counter = 10
                self.timeLabel.text = String("Time: \(self.counter)")
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerFunction), userInfo: nil, repeats: true)
                
                self.kennyHideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideKenny), userInfo: nil, repeats: true)
                
            }
            
                    alertButton.addAction(leaveButton)
                    alertButton.addAction(replayButton)
            
            self.present(alertButton, animated: true)
        }
        
        let storedHighscore = UserDefaults.standard.object(forKey: "highscore")
        
        if (storedHighscore == nil){
            highscore = 0
            highscoreLabel.text = "Highscore: \(highscore)"
        }
         
        if let newScore = storedHighscore as? Int{
            highscore = newScore
            highscoreLabel.text = "Highscore: \(highscore)"
        }
        
    }
    
    
    
    
    
    
    
        
        

    }



