//
//  ViewController.swift
//  PuzzleTest
//
//  Created by jean on 3/10/18.
//  Copyright © 2018 jean. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var board: UIView!
    var tileWidth:Int = 0
    var tileHeight:Int = 0
    var tileCenterX:Int = 0
    var tileCenterY:Int = 0
    var tileArray: NSMutableArray = []
    var tileCenterArray: NSMutableArray = []
    var tileNumber:Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeTiles()
    }
    func makeTiles(){
        let boardWidth = Int(self.board.frame.width)
        self.tileWidth = boardWidth / 4
        self.tileCenterX = self.tileWidth / 2
        self.tileCenterY = self.tileWidth / 2
        
        let boardHeight = Int(self.board.frame.height)
        self.tileHeight = boardHeight / 4
        for _ in 0..<4{
        
            for _ in 0..<4{
            let tileFrame: CGRect = CGRect(x: 0, y: 0, width: tileWidth - 2 , height: tileHeight - 2)
            let tile:UILabel = UILabel(frame: tileFrame)
            let currentCenter:CGPoint = CGPoint(x: self.tileCenterX, y: self.tileCenterY)
            tile.center = currentCenter
                self.tileCenterArray.add(tile.center)
            tile.backgroundColor = UIColor.red
            self.board.addSubview(tile)
                tileNumber = tileNumber + 1
                tile.text = "\(tileNumber)"
            self.tileArray.add(tile)
            self.tileCenterX = self.tileCenterX + self.tileWidth
        }
            self.tileCenterX = self.tileWidth / 2
            self.tileCenterY = self.tileCenterY + self.tileWidth
        }
        
        let lastTile:UILabel = self.tileArray.lastObject as! UILabel
        lastTile.removeFromSuperview()
        self.tileArray.removeObject(at: 15)
        
    }

    override func didReceiveMemoryWarning() {
        
    }


}

