//
//  WinningTicketViewController.swift
//  Jackpot
//
//  Created by Elizabeth Yeh on 10/15/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class WinningTicketViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate
{

    @IBOutlet weak var picker: UIPickerView!
    var delegate: WinningTicketViewControllerDelegate?
    var winningPicks = [Int](count: 6, repeatedValue: 0)
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return 6
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return 53
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return "\(row + 1)"
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        winningPicks[component] = row+1
    }
    
    
    @IBAction func checkTickets(sender: UIButton)
    {
        if winningPicks.count == 6
        {
            let winningTicket = JackpotTicket(picksArray: winningPicks)
            delegate?.winningTicketWasAdded(winningTicket)
        }
    }
    
    
    @IBAction func cancel(sender: UIButton)
    {
       self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
       /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
