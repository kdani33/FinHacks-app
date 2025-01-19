//
//  FinancialLiteracyView.swift
//  FinHacks app
//
//  Created by Krisha Dani on 1/18/25.
//

import SwiftUI

struct FinancialLiteracyView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 20) {
                // Header
                Text("Financial Literacy Page")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top)

                // List of Terms
                FinancialTermBlock(title: "+/- x%", definition: "Percent change in stock price since the previous day. It highlights the change in a stock’s value.")
                
                FinancialTermBlock(title: "Market Cap", definition: "Short for market capitalisation, market cap is the value of a company’s outstanding shares in the market. It is the collective value of the company.")
                
                FinancialTermBlock(title: "Current Ratio", definition: "Used for determining a company’s liquidity - a company’s ability to turn an asset into cash. A current ratio between 1.0 and 2.0 is generally considered healthy, while a lower current ratio could signal liquidity issues and a higher current ratio could signal company inefficiencies.")
                
                FinancialTermBlock(title: "Quick Ratio", definition: "Another measure of liquidity, the quick ratio removes inventory from the calculation in order to determine how well liabilities can be paid off by assets that can easily be converted to cash. A quick ratio of around 1.0 shows that a company is more able to pay off its current liabilities while a lower ratio might show that it can pay of its liabilities as well.")
                
                FinancialTermBlock(title: "Earnings Per Share (EPS)", definition: """
                A tool to measure profitability, earnings per share shows how much money is made for each share of a company’s stock. A higher EPS is viewed as more valuable because it shows that a company has higher profits in comparison to the price of its stock.
                
                """)
                
                FinancialTermBlock(title: "Price-to-Earnings Ratio (P/E Ratio)", definition: "The P/E ratio shows the potential for growth, the ratio shows how much a company is trading in comparison to earnings. A high P/E ratio typically means that the stock is overvalued or that future high growth rates are expected. The opposite is true of low P/E ratios in the sense that low P/E ratios might mean that the stock is undervalued or that future growth rates are expected to be minimal.")
                
                FinancialTermBlock(title: "Debt-to-Earnings Ratio (D/E Ratio)", definition: "Measures how much borrowed money funds a company’s operations. Higher D/E ratios, around one or higher, are typically correlated with higher risk investments, whereas lower D/E ratios, lower than one, are typically correlated with safe investments.")
                
                FinancialTermBlock(title: "Return on Equity (ROE)", definition: "Expressed as a percentage, ROE shows how well a company makes a profit off of shareholder money. The higher the ROE, the more efficient it is at generating profits from shareholder investments. A good ROE increases steadily and helps to analyze investment returns.")
                
                Spacer()
            }
            .padding()
        }
        .background(Color(UIColor.systemGroupedBackground)) // Light background color
    }
}

struct FinancialTermBlock: View {
    let title: String
    let definition: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
                .bold()
                .foregroundColor(.blue)
            
            Text(definition)
                .font(.body)
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
    }
}

