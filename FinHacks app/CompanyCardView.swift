//
//  CompanyCardView.swift
//  FinHacks app
//
//  Created by Krisha Dani on 1/18/25.
//



import SwiftUI

struct CompanyCardView: View {
    let company: Company

    var body: some View {
        VStack(spacing: 10) {
            AsyncImage(url: URL(string: company.imageUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 150) // Increase the height of the logo area
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } placeholder: {
                Color.gray // Placeholder color while loading
                    .frame(height: 150) // Match the logo area height
            }

            Text(company.name)
                .font(.headline)
                .bold()

            Text(company.bio)
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Spacer()
            
            // Example additional placeholder text for stock info
            HStack {
                            Text("Stock Price:")
                                .font(.subheadline)
                                .bold()
                            Spacer()
                            Text(company.stockPrice)
                                .font(.subheadline)
                                .foregroundColor(.green)
                        }
            // Percent Change
                        HStack {
                            Text("Change:")
                                .font(.subheadline)
                                .bold()
                            Spacer()
                            Text(company.percentChange)
                                .font(.subheadline)
                                .foregroundColor(company.percentChange.contains("-") ? .red : .green) // Red for negative, green for positive
                        }
                        .padding(.horizontal)

            // Market Cap
                        HStack {
                            Text("Market Cap:")
                                .font(.subheadline)
                                .bold()
                            Spacer()
                            Text(company.marketCap)
                                .font(.subheadline)
                                .foregroundColor(.primary)
                        }
                        .padding(.horizontal)
            // currentRatio
                        HStack {
                            Text("Current Ratio:")
                                .font(.subheadline)
                                .bold()
                            Spacer()
                            Text(company.currentRatio)
                                .font(.subheadline)
                                .foregroundColor(.primary)
                        }
                        .padding(.horizontal)
            // Market Cap
                        HStack {
                            Text("P/E Ratio:")
                                .font(.subheadline)
                                .bold()
                            Spacer()
                            Text(company.peRatio)
                                .font(.subheadline)
                                .foregroundColor(.primary)
                        }
                        .padding(.horizontal)
            Text(company.riskLevel)
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Text(company.shortTerm)
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Text(company.longTerm)
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            

                        Spacer()
        }
        .frame(width: 300, height: 500) // Adjust the height of the card
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}




