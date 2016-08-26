//
//  InspirationQuoteViewController.swift
//  Gracing Up
//
//  Created by Sarah Melvin on 6/18/16.
//  Copyright © 2016 ERP Resources. All rights reserved.
//

import Foundation
import UIKit

class InspirationQuoteViewController: UIViewController {
    
    @IBOutlet weak var quoteText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        quoteText.lineBreakMode = .ByWordWrapping
        quoteText.numberOfLines = 0;
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
        
//        // read the civility goals file
//        let location = "/Users/sarah/Desktop/Gracing-Up/Gracing Up/wireframes + timeline/inspiration-quotes.txt"
//        let fileContent = try? NSString(contentsOfFile: location, encoding: NSUTF8StringEncoding) as String
//        
//        // put content of file into an array
//        let newlineChars = NSCharacterSet.newlineCharacterSet()
//        let lines = fileContent!.utf16.split { newlineChars.characterIsMember($0) }.flatMap(String.init)
        
        let lines = ["Unkind words can be strong enough to break a heart.  Use your words carefully to make sure that they uplift others.", "When you smile at life it smiles back at you.", "Being attentive to the needs of others is important for building relationships.", "When you wake up each morning, your day should start with gratitude because some people did not make it through the night.", "A positive outlook will bring a positive outcome.", "A “To Do” list that is accomplished brings self-satisfaction.", "Listening to others attentively, is an act of humility.", "No one is useless in this world who lightens the burden of another.  Charles Dickens", "Patience is the calm acceptance that things can happen in a different order than the one you have in mind. David G. Allen", "Friends are like angels who lift you up when your wings have forgotten how to Fly.", "Time management is life management.", "We are all blessed with special talents, shine your unique light and share it with the world.", "Let go of your attachment to being right, and suddenly your mind is more open. You’re able to benefit from the unique viewpoints of others, without being crippled by your own judgment.  Ralph Marston", "A warm smile is the universal language of kindness. William Arthur Ward", "We never know the importance of water until the well is dry.", "Spending time gathered around the table is a great opportunity to communicate and spend precious time with people that you care about.", "Don’t be afraid of failure; be afraid of never trying.", "We are our brother’s keeper.", "You are where you were meant to be.", "If you have questions about the appropriate attire to wear to work, ask someone.", "A joyful spirit inspires joy in others.", "The words that come out of your heart, display the condition of your heart.", "“No one is useless in this world who lightens the burdens of another.” Charles Dickens", "Civility is the art and act in caring for others.  Deborah King", "When you are at your best, you can give your best.", "It takes a person of great heart to see the wisdom the elders have to offer, and so serve them out of gratitude for the life they have passed on to us.  Ken Nerburn", "A joyful spirit inspires joy in others and is a pleasure to behold.", "A handwritten note is timeless and it shows a willingness to go beyond the status quo.", "“The best way to not feel hopeless is to get up and do something. Don’t wait for good things to happen to you. If you go out and make some good things happen, you will fill the world with hope, you will fill yourself with hope.” Barack Obama", "When you work in alignment with your gifts and talents, you will find your passion.  When you find your passion, you become excited about life.", "Nothing others do is because of you.  What others say and do is a project of their own reality, their own dream.  When you are immune to the opinions and actions of others, you won’t be the victim of needless suffering. Miguel Ruiz", "Sometimes you will never know the value of a moment until it becomes a memory. Dr. Seuss", "T H I N K before using Social Media – (T – Is it True, H – Is it Helpful, I – Is it Inspiring   , N – Is it Necessary, K – Is it Kind)?", "Civility, starts with you, if not, then who?", "Integrity is doing the right thing, even when no one is watching.  C.S. Lewis", "It’s our differences that make us beautiful and unique.  Focus on the good in all people.", "Your words have power, use them to lift up others not to tear them down.", "Revelations about who you are and why you are on this earth, can come to surface, when you sit in silence.", "Focus on the good in life and you will find it.", "Hope is one of the most powerful motivators in the world", "It isn’t what we say or think that defines us, it’s what we do.", "Leap and the Net Shall Appear.", "Do what you love and do it often.", "One of the greatest gifts that you do for yourself, is to set clear boundaries for what works for you.", "Apology leads to forgiveness, forgiveness leads to freedom.", "Confidence is silent, insecurities are loud.", "Your body is your temple, treat it as such.", "Never under estimate the power of a kind word.", "Laughing is contagious – laugh more often and infect the world!", "When you are at your best, you can give your best.", "When you walk with gratitude for the good and the bad in your life, you understand the blessings of life."]
        
        // get goal from array
        let goal = lines[weekInt!]
        self.quoteText.text = goal
        
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }

    
}