//
//  ViewController.swift
//  FriendBookPlus
//
//  Created by ROHIT GUPTA on 12/6/15.
//  Copyright © 2015 ROHIT GUPTA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    var friends = [Friend]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createFriends()
       
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func createFriends(){
        
        let elaine = Friend()
        elaine.name = "Elaine"
        elaine.birthday = "January 1st"
        elaine.phoneNumber = "222-234-2213"
        elaine.picture = UIImage(named: "elaine")!
        self.friends.append(elaine)
        
        let george = Friend()
        george.name = "George"
        george.birthday = "January 2nd"
        george.phoneNumber = "333-444-2245"
        george.picture = UIImage(named: "george")!
        self.friends.append(george)
        
        let kramer = Friend()
        kramer.name = "Kramer"
        kramer.birthday = "January 3rd"
        kramer.phoneNumber = "888-800-1111"
        kramer.picture = UIImage(named: "kramer")!
        self.friends.append(kramer)
        
        let jerry = Friend()
        jerry.name = "Jerry"
        jerry.birthday = "January 4th"
        jerry.phoneNumber = "111-222-3333"
        jerry.picture = UIImage(named: "jerry")!
        self.friends.append(jerry)
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let friend = self.friends[indexPath.row]
        cell.textLabel!.text = friend.name
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let friend = self.friends[indexPath.row]
        self.performSegueWithIdentifier("detailSegue", sender: friend)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detailVC = segue.destinationViewController as! FriendDetailViewController
        detailVC.friend = sender as! Friend
    }

}

