//
//  ViewController.swift
//  Storyboard Bullseye
//
//  Created by Tony Hong on 1/13/22.
//  Jane Lupica CS198 iOS

import UIKit
import Foundation

var randomNumber = 0
var range = 100
var level = 1
var maxScore = 0

class ViewController: UIViewController {
    
    // switch that switches on and off from exact mode
    @IBOutlet weak var exactSwitch: UISwitch!
    
    // displays whether user hit bullseye
    @IBOutlet weak var resultLabel: UILabel!
    
    // displays the number user must hit to win
    @IBOutlet weak var numLabel: UILabel!
    
    // displays the current level the user is on
    @IBOutlet weak var currentLevel: UILabel!
    
    // displays high score of user
    @IBOutlet weak var highScore: UILabel!
    
    // slider user can slide to match random number given
    @IBOutlet weak var numSlider: UISlider!
    
    // IBOutlet for play again button
    @IBOutlet weak var playAgainButton: UIButton!
    
    // displays the max value of slider
    @IBOutlet weak var rangeLabel: UILabel!
    
    @IBAction func checkValue(_ sender: Any) {
        if (exactSwitch.isOn){
            if (randomNumber == Int(numSlider.value)) { //user wins this level
                resultLabel.text = "Bullseye!"
                
                //increment the range of slider
                range += 25
                rangeLabel.text = String(range)
                numSlider.maximumValue += 25.0
                
                // check to see if this level is the user's highschore
                if (level > maxScore) {
                    maxScore = level
                    highScore.text = String(maxScore)
                }
                
                //incrememet the user's level
                level += 1
                currentLevel.text = String(level)
                
                
                //implement the next level
                numSlider.setValue(Float(range/2), animated: false)
                randomNumber = Int(arc4random_uniform(UInt32(range + 1)))
                numLabel.text = String(randomNumber)
                resultLabel.isHidden = true
                
                
            } else {
                resultLabel.text = "Oops you missed.."
                playAgainButton.isHidden = false
                
            }
        }
        else {
            if ((randomNumber + 3) >= Int(numSlider.value) && (randomNumber - 3) <= Int(numSlider.value)) { //user wins this level
                resultLabel.text = "Bullseye!"
                
                //increment the range of slider
                range += 25
                rangeLabel.text = String(range)
                numSlider.maximumValue += 25.0
                
                // check to see if this level is the user's highschore
                if (level > maxScore) {
                    maxScore = level
                    highScore.text = String(maxScore)
                }
                
                //incrememet the user's level
                level += 1
                currentLevel.text = String(level)
                
                
                //implement the next level
                numSlider.setValue(Float(range/2), animated: false)
                randomNumber = Int(arc4random_uniform(UInt32(range + 1)))
                numLabel.text = String(randomNumber)
                resultLabel.isHidden = true
                
                
            } else {
                resultLabel.text = "Oops you missed.."
                playAgainButton.isHidden = false
            }
        }
        
        resultLabel.isHidden = false
        playAgainButton.isHidden = false
    }
    
    @IBAction func playAgain(_ sender: Any) {
        numSlider.setValue(50.0, animated: false)
        randomNumber = Int(arc4random_uniform(101))
        numLabel.text = String(randomNumber)
        resultLabel.isHidden = true
        playAgainButton.isHidden = true
        
        //reset the range and level
        range = 100
        level = 1
        
        rangeLabel.text = String(range)
        currentLevel.text = String(level)
        numSlider.maximumValue = Float(range)
        
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        //numLabel.text = "\(Int(numSlider.value))"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomNumber = Int(arc4random_uniform(101))
        numLabel.text = String(randomNumber)
        
        rangeLabel.text = String(range)
        currentLevel.text = String(level)
        highScore.text = String(maxScore)
    }
}

