//
//  Player-DetailsViewcontroller.swift
//  Ratings
//
//  Created by Vu Truong on 5/7/16.
//  Copyright © 2016 Vu Truong. All rights reserved.
//

import UIKit

class Player_DetailsViewcontroller: UITableViewController {

    var player: Player?
    var game:String = "Chess" {
        didSet {
            detailLabel.text? = game
        }
    }

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var detailLabel: UILabel!
    

    
    @IBAction func unwindWithSelectedGame(segue:UIStoryboardSegue) {

        if let gamePickerViewController = segue.sourceViewController as? GamePickerViewController,
            selectedGame = gamePickerViewController.selectedGame {
            game = selectedGame
        }
    }
    
    //tap the cell and app active  the text field
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (indexPath.section == 0){
            nameTextField.becomeFirstResponder()
        }
    }
    
    //create a new Player instance with default values for game and rating
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SavePlayerDetail" {
            player = Player(name: nameTextField.text!, game: game, rating: 1)
        }
        
        if segue.identifier == "PickGame" {
            if let gamePickerViewcontroller = segue.destinationViewController as? GamePickerViewController {
                gamePickerViewcontroller.selectedGame = game
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        print("init PlayerDetailsViewcontroller")
        super.init(coder: aDecoder)
    }
    
    deinit {
        print("deinit PlayerDetailsViewController")
    }
}
