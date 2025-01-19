//
//  HomePageView.swift
//  FinHacks app
//
//  Created by Krisha Dani on 1/18/25.
//

import SwiftUI

struct HomePageView: View {
    @Binding var savedCompanies: [Company] // Shared list of saved companies
    @Binding var numberOfSaves: Int        // Shared counter for saved companies

    var body: some View {
        VStack(spacing: 20) {
            // Header
            Text("GrowFolio")
                .font(.custom("Copperplate", size: 50))
                .bold()
                .padding(.top)

            Spacer()

            // Block: Saved Companies Button
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.green)
                    .frame(height: 60)

                NavigationLink(destination: SavedCompaniesView(savedCompanies: savedCompanies)) {
                    Text("Saved Companies")
                        .font(.headline)
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal)

            // Block: Preview of Last eight saved companies
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    .frame(height: 300)

                VStack(alignment: .leading, spacing: 10) {
                    if savedCompanies.isEmpty {
                        Text("No saved companies yet.")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    } else {
                        Text("Recently Saved Companies:")
                            .font(.headline)
                            .padding(.bottom, 5)

                        ForEach(savedCompanies.suffix(8), id: \.id) { company in
                            Text(company.name)
                                .font(.subheadline)
                                .foregroundColor(.primary)
                        }
                    }
                }
                .padding()
            }
            .padding(.horizontal)

            // Block: Number of Saves Counter
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    .frame(height: 60)

                Text("Number of Saves: \(numberOfSaves)")
                    .font(.headline)
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding()
        .background(Color(UIColor.systemGroupedBackground))
        .navigationBarHidden(true) // Removes default navigation bar
    }
}

