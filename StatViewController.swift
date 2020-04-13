//
//  StatViewController.swift
//  MentalBalanceApp
//
//  Created by Developer on 2/25/20.
//  Copyright © 2020 Mohammed K. All rights reserved.
//

import UIKit
import Charts


class StatViewController: UIViewController {
    
    var colorsArray = [#colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1),#colorLiteral(red: 0.3921568627, green: 0.8235294118, blue: 1, alpha: 1),#colorLiteral(red: 0.368627451, green: 0.3607843137, blue: 0.9019607843, alpha: 1),#colorLiteral(red: 1, green: 0.2705882353, blue: 0.2274509804, alpha: 1),#colorLiteral(red: 1, green: 0.2156862745, blue: 0.3725490196, alpha: 1),#colorLiteral(red: 1, green: 0.6235294118, blue: 0.03921568627, alpha: 1),#colorLiteral(red: 1, green: 0.8392156863, blue: 0.03921568627, alpha: 1),#colorLiteral(red: 0.1960784314, green: 0.8431372549, blue: 0.2941176471, alpha: 1)]

    
    
    @IBOutlet weak var chartView: LineChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        chartView.backgroundColor = .white
        chartView.chartDescription?.enabled = true
        chartView.leftAxis.enabled = false
        chartView.dragEnabled = false
        chartView.leftAxis.spaceTop = 0.5
        chartView.leftAxis.spaceBottom = 0.2
        chartView.rightAxis.enabled = false
        chartView.xAxis.enabled = false
        chartView.pinchZoomEnabled = false
        chartView.animate(yAxisDuration: 1.0)
        chartView.legend.enabled = false
        
        let format = NumberFormatter()
        format.numberStyle = .none
        let formatter = DefaultValueFormatter(formatter: format)
        
        chartView.data?.setValueFormatter(formatter)
        
        
        setChartValues()
        
        
    }
    
    func setChartValues(_ count: Int = 7) {
        let phqAssessments = DBManager.sharedInstance.getDailyAssessmentsFromDB()


        if (phqAssessments.count >= 7){
            
            let values = (0..<count).map { (i) -> ChartDataEntry in
                let val = Double(phqAssessments[count-i-1].familyGoalScore)
                print("🟧\(count-i-1)🟧")
                print("🔵\(count-i)🔵")
                
                return ChartDataEntry(x: Double(i), y:val)
            }
            
            let set1 = LineChartDataSet(entries: values, label: nil)
            set1.lineWidth = 2.0
            set1.circleRadius = 5.0
            set1.circleHoleRadius = 2.5
            set1.setColor(colorsArray[0])
            set1.setCircleColor(colorsArray[0])
            set1.highlightColor = colorsArray[5]
            set1.drawValuesEnabled = true
            set1.valueTextColor = colorsArray[0]
            set1.mode = .cubicBezier
            
            
            let data = LineChartData(dataSet: set1)
//            data.setValueFormatter(IValueFormatter)
            
            self.chartView.data = data
            
            let gradientColors = [ChartColorTemplates.colorFromString("#FFFFFF").cgColor,
                                  ChartColorTemplates.colorFromString("#106BFF").cgColor]
            let gradient = CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil)!
            
            set1.fillAlpha = 1
            set1.fill = Fill(linearGradient: gradient, angle: 90) //.linearGradient(gradient, angle: 90)
            set1.drawFilledEnabled = true
        
        } else {return}
    }
    
}

extension StatViewController: IValueFormatter {
    func stringForValue(_ value: Double, entry: ChartDataEntry, dataSetIndex: Int, viewPortHandler: ViewPortHandler?) -> String {
        return String(Int(value))
    }
    

}
    
    

