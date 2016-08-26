//
//  CivilityGoalViewController.swift
//  Gracing Up
//
//  Created by Sarah Melvin on 6/18/16.
//  Copyright © 2016 ERP Resources. All rights reserved.
//

import Foundation
import UIKit


class CivilityGoalViewController: UIViewController {
    
    @IBOutlet weak var goalText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        goalText.lineBreakMode = .ByWordWrapping
        goalText.numberOfLines = 0;
        getGoal()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func determineTime(start: NSDate) -> String{
        let now = NSDate()
        var dates = [NSDate]()
        for i in 0...51{
            let newDate = start.dateByAddingTimeInterval(60*60*24*(Double(i) * 7.0))
            dates.append(newDate)
        }
        for i in 1...51{
            let result = dates[i].earlierDate(now)
            if(result == now){
                return String(i - 1)
            }
        }
        return String(51)
    }
    
    func getGoal() {
        // get the installDate from nsuserdefaults
        let defaults = NSUserDefaults.standardUserDefaults()
        let origDate = defaults.objectForKey("installDate") as! NSDate
        let weekString = determineTime(origDate)
        let weekInt :Int? = Int(weekString)
        
        let lines = ["Speak kind words", "Forego idle complaints.", "Make a conscious effort to be aware of the needs of others around you.", "Be thankful for the little things.", "Look for the best in all situations.", "Set goals for the week and accomplish them.", "When someone comes into your space, be attentive and listen.", "If you are given a task to support someone, be responsible and finish the task.", "Make it a point to be patient with people that we come in contact with.", "Encourage your friends, you never know what an impact your words may have.", "Be respectful of time.", "Focus on your gifts and talents and how you can use them to make a difference in your community.", "Be open to other people’s thoughts and opinions.", "Smile more!", "Gather your friends, family and/or co-workers to find ways to be kind to the environment.", "Learn how to set a table properly and invite family and friends over for dinner.", "What are three things that you are fearful of that stops you from being your best.  How are you going to conquer these fears?", "Show random acts of kindness this week.", "Appreciate where you are at this moment in your life and make the best of it.", "Dress appropriately for all occasions.", "Bring sunshine to lifeless places.", "Be the example for your surroundings, avoid using foul or obscene language.", "Look within your heart and see how you can transform it to bring positivity to the world.", "Think about being your most civil self for this world, what does that person possess?", "What activities can you to help you be at your best? (I.e. exercise, volunteer, quiet time, etc.)", "Reach out to a person that has supported and inspired you in your life and thank them.", "Go and introduce yourself to a neighbor, find a homeless shelter, a school, a foundation that speaks to your heart, and volunteer where you can use your gifts and talents.", "Write a handwritten note to someone special and say thank you.", "Live a life to be proud of.", "What gets you up in the morning and makes you excited about your day?", "If someone is not pleasant towards you, make it a point to not take it personally.", "Discover ways to create positive memories for your family, friends and relatives.", "Use Social media responsibly, remember when you hit the button your thoughts are forever out in the world.", "Act in ways that can produce more Civility in your home school and workplace.", "Be honest in your actions and in your words.", "Connect with people that you normally would not give a chance.", "Be aware of your conversations. Are they constructive or destructive?", "Spend time simply sitting without electronic devices in silence and enjoy the beautiful gift that if offers.", "Each day wake up with a heart of gratitude.", "Be hopeful for your future.  List out ways you will make a positive impact in this world.", "Live each day to the fullest, seeking to show Civility through your words, actions, and attitudes.", "Walk the extra mile to accomplish your goals and tasks.", "Spend at least 10 minutes a day doing something that you love.", "Be sensitive to your needs and assert yourself in situations that compromise you.", "Take time to apologize for your wrong doings.", "Sometimes it is good to observe instead of being the loudest in the room.", "Mind your body.", "Lift others through kind words.", "Embrace the spirit of laughter.", "Incorporate activities in your life (i.e. exercise, classes, etc.) that help you to be the best you can be.", "Be thankful for all things in your life."]

        // get goal from array
        let goal = lines[weekInt!]
        self.goalText.text = goal

    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
}