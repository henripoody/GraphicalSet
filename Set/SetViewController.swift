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
        updateView()
    }

    func updateView() {
        grid.frame = playgroundView.bounds
        grid.cellCount = set.boardCards.count
        
        //Remove all existing cardViews
        for view in playgroundView.subviews {
            view.removeFromSuperview()
        }
        
        //Draw cardViews based on boardCards
        for index in set.boardCards.indices {
            if let cardViewFrame = grid[index]{
                let card = set.boardCards[index]
                let cardView = SetCardView(frame: cardViewFrame.insetBy(dx: SetCardView.SizeRatio.cardViewInsetValue, dy: SetCardView.SizeRatio.cardViewInsetValue))
                
                cardView.color = card.color
                cardView.number =  card.numberOfSymbols
                cardView.shading = card.shading
                cardView.shape = card.symbol
                
                playgroundView.addSubview(cardView)
            } else {
                print("Grid[\(index)] does not exist")
            }
        }
    }

    @IBAction func touchDeal3MoreCards(_ sender: UIButton) {
        
    }
    
    @IBAction func touchRevealASet(_ sender: UIButton) {
        
    }
    
    @IBAction func touchNewGame(_ sender: UIButton) {

    }
}

