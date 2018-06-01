//
//  tableViewController.swift
//  WanderLust
//
//  Created by Ritu Shikha on 28/03/2018.
//  Copyright © 2018 epita. All rights reserved.
//

import UIKit

class tableViewController: UITableViewController {
    
    @IBOutlet var myTableView2: UITableView!
    
    var placeArray : [Places] = []
    
    var clickedIndex : IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let place1 = Places(placeTitle: "Victoria Falls", country:"Zimbabwe/Zambia", description: "Victoria Falls that border Zambia and Zimbabwe is the largest waterfall in the world by total area. The falls transport an astonishing 1,088 cubic meters per second of water down an ~350-foot cliff.", imageName: "Victoria.jpg")
        
        let place2 = Places(placeTitle: "Amazon River", country:"Brazil", description: "The Amazon River is the artery for the largest rainforest in the world. It is the largest river in the world by discharge and one of the largest by length. The surrounding rainforest represents over half of the world's remaining rainforest.", imageName: "Amazon.jpg")
        
        let place3 = Places(placeTitle: "Rainbow Mountains of Zhangye Danxia", country:"China", description: "The Rainbow Mountains of Zhangye Danxia, China show off weathering and erosion at its most beautiful. The dramatic colors throughout the mountain are a result of trace minerals associated within the sandstone, coloring the sand in reds, greens, and yellows.", imageName: "Rainbow.jpg")
        
        let place4 = Places(placeTitle: "Neuschwanstein Castle", country:"Germany", description: "Neuschwanstein, a nineteenth-century castle in southern Germany is the inspiration for Disneyland's Sleeping Beauty Castle. This German retreat is visited regularly during summer months as a symbol of refuge and peace.", imageName: "Neuschwanstein.jpg")
        
        let place5 = Places(placeTitle: "Northern Lights", country:"Iceland", description: "The natural display of varying color within the arctic sky is one of Iceland's biggest tourist sights. Unfortunately, it's rather unpredictable so make sure you leave enough time to try a few times.", imageName: "NorthernLights.jpg")
        
        let place6 = Places(placeTitle: "Antarctica", country:"Antarctica", description: "Antarctica is on average the coldest, windiest, driest, and highest of the 7 continents. This desert continent is, however, home to millions of penguins of different species.", imageName: "Antartica.jpg")
        
        let place7 = Places(placeTitle: "Bison of Yellowstone National Park", country:"Wyoming", description: "Yellowstone National Park is the oldest national park in the US and likely the world. Drive through the park and encounter an array of wildlife 10's of feet away from you.", imageName: "Bison.jpg")
        
        let place8 = Places(placeTitle: "Tracy Arm Fjord", country:"Alaska", description: "Fjords are created by the slow erosion of mountain valleys as glaciers move down toward the sea. Tracy Arm Fjord in Alaska is home to Orcas and a rapidly disappearing environment.", imageName: "Tracy.jpg")
        
        let place9 = Places(placeTitle: "Torres Del Paine Patagonia", country:"Chile", description: "Torres Del Paine in southern Patagonia is a national park that boasts beautiful mountains, glaciers, lakes, and rivers. Take the trip to southern Patagonia and you can hike the partial or full circuit around the stunning granite peaks in the backdrop of the photo above.", imageName: "Torres.jpg")
        
        let place10 = Places(placeTitle: "Svalbard", country:"Norway", description: "The incredibly cold island of Svalbard is located within the Arctic Ocean, north of mainland Europe. Svalbard is the northernmost settlement with a permanent population in the world. Trekking through Svalbard it's not uncommon to see polar bears, reindeer, and perhaps an Arctic fox.", imageName: "Svalbard.jpg")

        
        
        // fill the array
        
        placeArray.append(place1)
        placeArray.append(place2)
        placeArray.append(place3)
        placeArray.append(place4)
        placeArray.append(place5)
        placeArray.append(place6)
        placeArray.append(place7)
        placeArray.append(place8)
        placeArray.append(place9)
        placeArray.append(place10)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell

        // stroke effect
        let strokeTextAttributes: [NSAttributedStringKey : Any] = [
            NSAttributedStringKey.strokeColor : UIColor.black,
            NSAttributedStringKey.foregroundColor : UIColor.white,
            NSAttributedStringKey.strokeWidth : -4.0,
            ]
        
        // bold effect
        cell.titleLbl?.font = UIFont.boldSystemFont(ofSize: 30.0)
        cell.categoryLbl?.font = UIFont.boldSystemFont(ofSize: 25.0)
        
        // set attributes
        cell.titleLbl?.attributedText = NSAttributedString(string: placeArray[indexPath.row].placeTitle! ,attributes: strokeTextAttributes)
        cell.categoryLbl?.attributedText = NSAttributedString(string: placeArray[indexPath.row].country!, attributes: strokeTextAttributes)
        cell.bgImageView.image = UIImage(named: placeArray[indexPath.row].imageName!)
        
        // set cell border and shadow
        cell.layer.masksToBounds = true
        cell.layer.borderWidth = 5
        cell.layer.shadowOffset = CGSize(width: -1, height: 1)
        let borderColor: UIColor = .white
        cell.layer.borderColor = borderColor.cgColor
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        clickedIndex = indexPath
        self.performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detailSegue" {
            let detailVC = segue.destination as! detailViewController
            
            detailVC.place = placeArray[clickedIndex!.row]
        }
    }
    
    @IBAction func unwindToWeatherList(sender: UIStoryboardSegue){
        if let tableViewController = sender.source as? addViewController, let places = tableViewController.places {
            let newIndexPath = IndexPath(row: placeArray.count, section: 0)
            placeArray.append(places)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }

}

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var categoryLbl: UILabel!
    
}
