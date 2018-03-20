//
//  ViewController.swift
//  SwiftyStats
//
//  Created by Brian Advent on 19.03.18.
//  Copyright © 2018 Brian Advent. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var pieChart: PieChartView!
    
    @IBOutlet weak var iosStepper: UIStepper!
    @IBOutlet weak var macStepper: UIStepper!
    
    var iosDataEntry = PieChartDataEntry(value: 0)
    var macDataEntry = PieChartDataEntry(value: 0)
    
    var numberOfDownloadsDataEntries = [PieChartDataEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pieChart.chartDescription?.text = ""
        
        iosDataEntry.value = iosStepper.value
        iosDataEntry.label = "iOS"
        
        macDataEntry.value = macStepper.value
        macDataEntry.label = "macOS"
        
        numberOfDownloadsDataEntries = [iosDataEntry, macDataEntry]
        
        updateChartData()
        
    }
 
    @IBAction func changeiOS(_ sender: UIStepper) {
        iosDataEntry.value = sender.value
        updateChartData()
    }
    
    @IBAction func changeMac(_ sender: UIStepper) {
        macDataEntry.value = sender.value
        updateChartData()
    }
    
    
    func updateChartData() {
        
        let chartDataSet = PieChartDataSet(values: numberOfDownloadsDataEntries, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        
        let colors = [UIColor(named:"iosColor"), UIColor(named:"macColor")]
        chartDataSet.colors = colors as! [NSUIColor]
        
        pieChart.data = chartData
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

