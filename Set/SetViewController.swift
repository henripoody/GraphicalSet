//
//  ViewController.swift
//  Set
//
//  Created by Nada Yehia Dawoud on 6/9/18.
//  Copyright © 2018 Mobile Apps Kitchen. All rights reserved.
//

import UIKit

class SetViewController: UIViewController {
    
    lazy var set = SetGame()
    
    lazy var grid = Grid(layout: .aspectRatio(SetCardView.SizeRatio.cardViewAspectRatio), frame: playgroundView.bounds)
  
    @IBOutlet weak var playgroundView: UIView!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var foundSetsLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var deal3CardsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        newGame()
    }

    func newGame() {
        
    }

    func updateView() {
         //Draw card selection
        //Remove matched cards
    }

    @IBAction func touchDeal3MoreCards(_ sender: UIButton) {
        
    }
    
    @IBAction func touchRevealASet(_ sender: UIButton) {
        
    }
    
    @IBAction func touchNewGame(_ sender: UIButton) {

    }
}

