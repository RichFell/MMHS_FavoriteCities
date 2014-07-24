//
//  ViewController.swift
//  MMHS_FavoriteCities
//
//  Created by Richard Fellure on 7/23/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet var tableView: UITableView!
    var favorites = ["Columbus, OH", "Salt Lake City, UT", "Chicago, IL", "Hatteras, NC"]

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    //Action that shows our UIAlertController which we will use to add data to our Array and UITableView
    @IBAction func onButtonPressedAddFavorite(sender: AnyObject)
    {
        let alert = UIAlertController(title: "Add another favorite city", message: nil, preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler({ textField in
            textField.placeholder = "Add a new favorite"
            })

        let cancelAction = UIAlertAction(title: "Cancel", style:.Cancel, handler: ({ action in

            }))
        alert.addAction(cancelAction)

        let saveAction = UIAlertAction(title: "Add", style: .Default, handler: ({ action in

            let textField = alert.textFields[0] as UITextField
            self.favorites.append(textField.text)

            self.tableView.reloadData()
            }))
        alert.addAction(saveAction)

        self.presentViewController(alert, animated: true, completion: nil)

    }

    //UITableViewDataSource function that allows us to access our UITableViewCells and change their properties
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        let city = favorites[indexPath.row] as String

        cell.textLabel.text = city

        return cell
    }

    //UITableViewDataSource function that allows us to determine the amount rows we will be returning
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return favorites.count
    }

    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!)
    {

        if editingStyle == UITableViewCellEditingStyle.Delete
        {
            favorites.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!)
    {
        var mapVC = segue.destinationViewController as MapViewController
        let indexPath = tableView.indexPathForSelectedRow()
        mapVC.city = favorites[indexPath.row]
    }


}


