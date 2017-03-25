//
//  menuViewController.swift
//  Jaiben
//
//  Created by kidnapper on 26/01/2017.
//  Copyright © 2017 JaiBen. All rights reserved.
//

import UIKit

class VC_menu: UIViewController {

    static var tag: Int = 0
    static var price: Int = 0
    @IBOutlet var meat: newButton!
    @IBOutlet var vegetarian: newButton!
    @IBOutlet var date: newButton!
    @IBOutlet var for_full: newButton!
    @IBOutlet var meet_up: newButton!
    @IBOutlet var discuss: newButton!
    @IBOutlet var afternoon_tea: newButton!
    @IBOutlet var snack: newButton!
    @IBOutlet var low_price: newButton!
    @IBOutlet var mid_price: newButton!
    @IBOutlet var high_price: newButton!
    @IBOutlet var short_distance: newButton!
    @IBOutlet var mid_distance: newButton!
    @IBOutlet var long_distance: newButton!
    @IBOutlet var confirmButton: newButton!
    
    @IBAction func TypeOfMeal(_ sender: Any){
        if (sender as? newButton) == meet_up{
            print("meet_up has been touched")
            print(meet_up.isHighlighted)
            meet_up.isHighlighted = false
            if (date.isHighlighted && for_full.isHighlighted && discuss.isHighlighted && afternoon_tea.isHighlighted && snack.isHighlighted) == false{
                //default
                meet_up.isHighlighted = true
                date.isHighlighted = true
                for_full.isHighlighted = true
                discuss.isHighlighted = true
                afternoon_tea.isHighlighted = true
                snack.isHighlighted = true
                print("meet_up has been selected")
                userData.user_menu_default["typeOfMeal"] = "meet_up"
                print(userData.user_menu_default["typeOfMeal"]!)
                VC_menu.tag = 3
            }else if (date.isHighlighted && for_full.isHighlighted && discuss.isHighlighted && afternoon_tea.isHighlighted && snack.isHighlighted)  == true{
                meet_up.isHighlighted = false
                date.isHighlighted = false
                for_full.isHighlighted = false
                discuss.isHighlighted = false
                afternoon_tea.isHighlighted = false
                snack.isHighlighted = false
                print("none")
                userData.user_menu_default["typeOfMeal"] = ""
                print(userData.user_menu_default["typeOfMeal"]!)
                VC_menu.tag = 0
            }
            
        }else if (sender as? newButton) == date{
            date.isHighlighted = false
            if  (for_full.isHighlighted && discuss.isHighlighted && afternoon_tea.isHighlighted && snack.isHighlighted && meet_up.isHighlighted) == false{
                //default
                meet_up.isHighlighted = true
                for_full.isHighlighted = true
                discuss.isHighlighted = true
                afternoon_tea.isHighlighted = true
                snack.isHighlighted = true
                print("date has been selected")
                userData.user_menu_default["typeOfMeal"] = "date"
                print(userData.user_menu_default["typeOfMeal"]!)
                VC_menu.tag = 1
            }else if (for_full.isHighlighted && discuss.isHighlighted && afternoon_tea.isHighlighted && snack.isHighlighted && meet_up.isHighlighted) == true{
                meet_up.isHighlighted = false
                for_full.isHighlighted = false
                discuss.isHighlighted = false
                afternoon_tea.isHighlighted = false
                snack.isHighlighted = false
                print("none")
                userData.user_menu_default["typeOfMeal"] = ""
                print(userData.user_menu_default["typeOfMeal"]!)
                VC_menu.tag = 0
            }
        }else if (sender as? newButton) == for_full{
            for_full.isHighlighted = false
            if (date.isHighlighted && discuss.isHighlighted && afternoon_tea.isHighlighted && snack.isHighlighted && meet_up.isHighlighted) == false{
                //default
                meet_up.isHighlighted = true
                date.isHighlighted = true
                discuss.isHighlighted = true
                afternoon_tea.isHighlighted = true
                snack.isHighlighted = true
                print("for_full has been selected")
                userData.user_menu_default["typeOfMeal"] = "for_full"
                print(userData.user_menu_default["typeOfMeal"]!)
                VC_menu.tag = 2
            }else if (date.isHighlighted && discuss.isHighlighted && afternoon_tea.isHighlighted && snack.isHighlighted && meet_up.isHighlighted) == true{
                meet_up.isHighlighted = false
                date.isHighlighted = false
                discuss.isHighlighted = false
                afternoon_tea.isHighlighted = false
                snack.isHighlighted = false
                print("none")
                userData.user_menu_default["typeOfMeal"] = ""
                print(userData.user_menu_default["typeOfMeal"]!)
                VC_menu.tag = 0
            }
        }else if (sender as? newButton) == discuss{
            discuss.isHighlighted = false
            if (date.isHighlighted && for_full.isHighlighted && afternoon_tea.isHighlighted && snack.isHighlighted && meet_up.isHighlighted) == false{
                //default
                meet_up.isHighlighted = true
                date.isHighlighted = true
                for_full.isHighlighted = true
                afternoon_tea.isHighlighted = true
                snack.isHighlighted = true
                print("discuss has been selected")
                userData.user_menu_default["typeOfMeal"] = "discuss"
                print(userData.user_menu_default["typeOfMeal"]!)
                VC_menu.tag = 4
            }else if (date.isHighlighted && for_full.isHighlighted && afternoon_tea.isHighlighted && snack.isHighlighted && meet_up.isHighlighted) == true{
                meet_up.isHighlighted = false
                date.isHighlighted = false
                for_full.isHighlighted = false
                afternoon_tea.isHighlighted = false
                snack.isHighlighted = false
                print("none")
                userData.user_menu_default["typeOfMeal"] = ""
                print(userData.user_menu_default["typeOfMeal"]!)
                VC_menu.tag = 0
            }
        }else if (sender as? newButton) == afternoon_tea{
            afternoon_tea.isHighlighted = false
            if (date.isHighlighted && for_full.isHighlighted && discuss.isHighlighted  && snack.isHighlighted && meet_up.isHighlighted) == false{
                //default
                meet_up.isHighlighted = true
                date.isHighlighted = true
                for_full.isHighlighted = true
                discuss.isHighlighted = true
                snack.isHighlighted = true
                print("afternoon_tea has been selected")
                userData.user_menu_default["typeOfMeal"] = "afternoon_tea"
                print(userData.user_menu_default["typeOfMeal"]!)
                VC_menu.tag = 5
            }else if (date.isHighlighted && for_full.isHighlighted && discuss.isHighlighted && snack.isHighlighted && meet_up.isHighlighted) == true{
                meet_up.isHighlighted = false
                date.isHighlighted = false
                for_full.isHighlighted = false
                discuss.isHighlighted = false
                snack.isHighlighted = false
                print("none")
                userData.user_menu_default["typeOfMeal"] = ""
                print(userData.user_menu_default["typeOfMeal"]!)
                VC_menu.tag = 0
            }
        }else if (sender as? newButton) == snack{
            snack.isHighlighted = false
            if (date.isHighlighted && for_full.isHighlighted && discuss.isHighlighted && afternoon_tea.isHighlighted && meet_up.isHighlighted) == false{
                //default
                meet_up.isHighlighted = true
                date.isHighlighted = true
                for_full.isHighlighted = true
                discuss.isHighlighted = true
                afternoon_tea.isHighlighted = true
                print("snack has been selected")
                userData.user_menu_default["typeOfMeal"] = "snack"
                print(userData.user_menu_default["typeOfMeal"]!)
                VC_menu.tag = 6
            }else if (date.isHighlighted && for_full.isHighlighted && discuss.isHighlighted && afternoon_tea.isHighlighted && meet_up.isHighlighted) == true{
                meet_up.isHighlighted = false
                date.isHighlighted = false
                for_full.isHighlighted = false
                discuss.isHighlighted = false
                afternoon_tea.isHighlighted = false
                print("none")
                userData.user_menu_default["typeOfMeal"] = ""
                print(userData.user_menu_default["typeOfMeal"]!)
                VC_menu.tag = 0
            }
        }
    }
    @IBAction func EatMeatOrNot(_ sender: Any){
        if (sender as? newButton) == meat{
            print(meat.isHighlighted)
            print(vegetarian.isHighlighted)
            if meat.isHighlighted {
                meat.isHighlighted = false
            }
            if vegetarian.isHighlighted {
                vegetarian.isHighlighted = false
                //none has been selected
                userData.user_menu_default["meatEater"] = ""
                print(userData.user_menu_default["meatEater"]!)
            }else if vegetarian.isHighlighted == false{
                //only meat has been selected
                vegetarian.isHighlighted = true
                userData.user_menu_default["meatEater"] = "yes"
                print(userData.user_menu_default["meatEater"]!)
            }
            
        }else if (sender as? newButton) == vegetarian{
            print("321")
            if vegetarian.isHighlighted {
                vegetarian.isHighlighted = false
            }
            if meat.isHighlighted{
                meat.isHighlighted = false
                userData.user_menu_default["meatEater"] = ""
                print(userData.user_menu_default["meatEater"]!)
            }else if meat.isHighlighted == false{
                meat.isHighlighted = true
                userData.user_menu_default["meatEater"] = "no"
                print(userData.user_menu_default["meatEater"]!)
            }
        }
    }
    @IBAction func PriceBeenSelected(_ sender: Any){
        if (sender as? newButton) == low_price{
            low_price.isHighlighted = false
            if (mid_price.isHighlighted && high_price.isHighlighted) == false{
                mid_price.isHighlighted = true
                high_price.isHighlighted = true
                print("low_price has been selected")
                userData.user_menu_default["price"] = "low_price"
                print(userData.user_menu_default["price"]!)
            }else if (mid_price.isHighlighted && high_price.isHighlighted) == true{
                mid_price.isHighlighted = false
                high_price.isHighlighted = false
                print("none")
                userData.user_menu_default["price"] = ""
                print(userData.user_menu_default["price"]!)
            }
        }else if mid_price == (sender as? newButton){
            mid_price.isHighlighted = false
            if (low_price.isHighlighted && high_price.isHighlighted) == false{
                low_price.isHighlighted = true
                high_price.isHighlighted = true
                print("mid_price has been selected")
                userData.user_menu_default["price"] = "mid_price"
                print(userData.user_menu_default["price"]!)
            }else if (low_price.isHighlighted && high_price.isHighlighted) == true{
                low_price.isHighlighted = false
                high_price.isHighlighted = false
                print("none")
                userData.user_menu_default["price"] = ""
                print(userData.user_menu_default["price"]!)
            }
        }else if high_price == (sender as? newButton){
            high_price.isHighlighted = false
            if (mid_price.isHighlighted && low_price.isHighlighted) == false{
                low_price.isHighlighted = true
                mid_price.isHighlighted = true
                print("high_price has been selected")
                userData.user_menu_default["price"] = "high_price"
                print(userData.user_menu_default["price"]!)
            }else if (mid_price.isHighlighted && low_price.isHighlighted) == true{
                low_price.isHighlighted = false
                mid_price.isHighlighted = false
                print("none")
                userData.user_menu_default["price"] = ""
                print(userData.user_menu_default["price"]!)
            }
        }
    }
    @IBAction func DistanceBeenSelected(_ sender: Any){
        if short_distance == (sender as? newButton){
            short_distance.isHighlighted = false
            if (mid_distance.isHighlighted && long_distance.isHighlighted) == false{
                mid_distance.isHighlighted = true
                long_distance.isHighlighted = true
                print("short_distance")
                userData.user_menu_default["distance"] = "short_distance"
                print(userData.user_menu_default["distance"]!)
            }else if (mid_distance.isHighlighted && long_distance.isHighlighted) == true{
                mid_distance.isHighlighted = false
                long_distance.isHighlighted = false
                print("none")
                userData.user_menu_default["distance"] = ""
                print(userData.user_menu_default["distance"]!)
            }
        }else if mid_distance == (sender as? newButton){
            mid_distance.isHighlighted = false
            if (short_distance.isHighlighted && long_distance.isHighlighted) == false{
                short_distance.isHighlighted = true
                long_distance.isHighlighted = true
                print("mid_distance")
                userData.user_menu_default["distance"] = "mid_distance"
                print(userData.user_menu_default["distance"]!)
            }else if (short_distance.isHighlighted && long_distance.isHighlighted) == true{
                short_distance.isHighlighted = false
                long_distance.isHighlighted = false
                print("none")
                userData.user_menu_default["distance"] = ""
                print(userData.user_menu_default["distance"]!)
            }
        }else if long_distance == (sender as? newButton){
            long_distance.isHighlighted = false
            if (mid_distance.isHighlighted && short_distance.isHighlighted) == false{
                short_distance.isHighlighted = true
                mid_distance.isHighlighted = true
                print("long_distance")
                userData.user_menu_default["distance"] = "long_distance"
                print(userData.user_menu_default["distance"]!)
            }else if (mid_distance.isHighlighted && short_distance.isHighlighted) == true{
                short_distance.isHighlighted = false
                mid_distance.isHighlighted = false
                print("none")
                userData.user_menu_default["distance"] = ""
                print(userData.user_menu_default["distance"]!)
            }
        }

    }
    
    

//    @IBOutlet weak var confirmButton: buttonControl!
    override func viewWillAppear(_ animated: Bool) {
        loadUserDefault()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadUserDefault(){
        if let meatOrNot = userData.user_menu_default["meatEater"] as! String?{
            if meatOrNot == "yes" {
                vegetarian.isHighlighted = true
            }else if meatOrNot == "no"{
                meat.isHighlighted = true
            }
        }
        if let typeOfMeal = userData.user_menu_default["typeOfMeal"] as! String?{
            if typeOfMeal == "date"{
                for_full.isHighlighted = true
                meet_up.isHighlighted = true
                discuss.isHighlighted = true
                afternoon_tea.isHighlighted = true
                snack.isHighlighted = true
            }else if typeOfMeal == "for_full"{
                date.isHighlighted = true
                meet_up.isHighlighted = true
                discuss.isHighlighted = true
                afternoon_tea.isHighlighted = true
                snack.isHighlighted = true
            }else if typeOfMeal == "meet_up"{
                date.isHighlighted = true
                for_full.isHighlighted = true
                discuss.isHighlighted = true
                afternoon_tea.isHighlighted = true
                snack.isHighlighted = true
            }else if typeOfMeal == "discuss"{
                date.isHighlighted = true
                for_full.isHighlighted = true
                meet_up.isHighlighted = true
                afternoon_tea.isHighlighted = true
                snack.isHighlighted = true
            }else if typeOfMeal == "afternoon_tea"{
                date.isHighlighted = true
                for_full.isHighlighted = true
                meet_up.isHighlighted = true
                discuss.isHighlighted = true
                snack.isHighlighted = true
            }else if typeOfMeal == "snack"{
                date.isHighlighted = true
                for_full.isHighlighted = true
                meet_up.isHighlighted = true
                discuss.isHighlighted = true
                afternoon_tea.isHighlighted = true
            }
        }
        if let price = userData.user_menu_default["price"] as! String?{
            if price == "low_price"{
                mid_price.isHighlighted = true
                high_price.isHighlighted = true
            }else if price == "mid_price"{
                low_price.isHighlighted = true
                high_price.isHighlighted = true
            }else if price == "high_price"{
                low_price.isHighlighted = true
                mid_price.isHighlighted = true
            }
            
        }
        if let distance = userData.user_menu_default["distance"] as! String?{
            if distance == "short_distance"{
                mid_distance.isHighlighted = true
                long_distance.isHighlighted = true
            }else if distance == "mid_distance"{
                short_distance.isHighlighted = true
                long_distance.isHighlighted = true
            }else if distance == "long_distance"{
                short_distance.isHighlighted = true
                mid_distance.isHighlighted = true
            }
        }
    }
}
