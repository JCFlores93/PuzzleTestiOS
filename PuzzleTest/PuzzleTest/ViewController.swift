//
//  ViewController.swift
//  PuzzleTest
//
//  Created by jean on 3/10/18.
//  Copyright © 2018 jean. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var demo: UIImageView!
    @IBAction func btnRandom(_ sender: Any) {
        randomTiles()
    }
    @IBOutlet weak var board: UIView!
    var tileWidth:CGFloat = 0.0
    var tileHeight:CGFloat = 0.0
    var tileCenterX:CGFloat = 0.0
    var tileCenterY:CGFloat = 0.0
    var tileArray: NSMutableArray = []
    var tileCenterArray: NSMutableArray = []
    var tileNumber:Int = 1
    var tileEmptyCenter:CGPoint = CGPoint(x:0,y:0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeTiles()
        randomTiles()
    }
    func makeTiles(){
        self.tileArray = []
        self.tileCenterArray = []
        
        let boardWidth = self.board.frame.width
        self.tileWidth = boardWidth / 4
        self.tileCenterX = self.tileWidth / 2
        self.tileCenterY = self.tileWidth / 2
        
        let boardHeight = self.board.frame.height
        self.tileHeight = boardHeight / 4
        for _ in 0..<4{
        
            for _ in 0..<4{
            let tileFrame: CGRect = CGRect(x: 0, y: 0, width: tileWidth - 2 , height: tileHeight - 2)
                
            let tile:CustomLabel = CustomLabel(frame: tileFrame)
                
            let currentCenter:CGPoint = CGPoint(x: self.tileCenterX, y: self.tileCenterY)
            tile.center = currentCenter
            tile.originCenter = currentCenter
            self.tileCenterArray.add(tile.center)
                
            tile.backgroundColor = UIColor.red
            self.board.addSubview(tile)
                tileNumber = tileNumber + 1
                //tile.text = "\(tileNumber)"
                if tileNumber <= 16 {
                    tile.backgroundColor = UIColor(patternImage: UIImage(named: "\(tileNumber).jpg")!)
                }else {
                    tile.backgroundColor = UIColor.gray
                }
                //demo.backgroundColor = UIColor(patternImage: UIImage(named: "demo.jpg")!)
                tile.textAlignment = NSTextAlignment.center
                tile.isUserInteractionEnabled = true
                
            self.tileArray.add(tile)
            self.tileCenterX = self.tileCenterX + self.tileWidth
        }
            self.tileCenterX = self.tileWidth / 2
            self.tileCenterY = self.tileCenterY + self.tileWidth
        }
        
        let lastTile:CustomLabel = self.tileArray.lastObject as! CustomLabel
        lastTile.removeFromSuperview()
        self.tileArray.removeObject(at: 15)
    }
        
        func randomTiles() {
            let tempTileCenterArray: NSMutableArray = self.tileCenterArray.mutableCopy() as! NSMutableArray
            for anyTile in self.tileArray {
                let randomIndex: Int = Int(arc4random()) % tempTileCenterArray.count
                let randomCenter: CGPoint = tempTileCenterArray[randomIndex] as! CGPoint
                (anyTile as! CustomLabel).center = randomCenter
                tempTileCenterArray.removeObject(at: randomIndex)
            }
            self.tileEmptyCenter = tempTileCenterArray[0] as! CGPoint
        }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let currentTouch: UITouch = touches.first!
        if (self.tileArray.contains(currentTouch.view as Any)) {
            //currentTouch.view?.alpha = 0
            let touchLabel: CustomLabel = currentTouch.view as! CustomLabel
            
            let xDif:CGFloat = touchLabel.center.x - self.tileEmptyCenter.x
            let yDif:CGFloat = touchLabel.center.y - self.tileEmptyCenter.y
            let distance:CGFloat = sqrt(pow(xDif,2) + pow(yDif,2))
            if distance == self.tileWidth {
                let tempCenter:CGPoint = touchLabel.center
                UIView.beginAnimations(nil, context: nil)
                UIView.setAnimationDuration(0.2)
                touchLabel.center = self.tileEmptyCenter
                UIView.commitAnimations()
                self.tileEmptyCenter = tempCenter
            }
        }
    }
    
    class CustomLabel: UILabel {
        var originCenter: CGPoint = CGPoint(x:0, y:0)
    }
    
    override func didReceiveMemoryWarning() {
        
    }


}

