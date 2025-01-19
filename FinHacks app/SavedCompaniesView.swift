//
//  SavedCompaniesView.swift
//  FinHacks app
//
//  Created by Krisha Dani on 1/18/25.
//

import SwiftUI

struct SavedCompaniesView: View {
    let savedCompanies: [Company]

    var body: some View {
        VStack {
            Text("Saved Companies")
                .font(.largeTitle)
                .padding()
            

            if savedCompanies.isEmpty {
                Text("No companies saved yet.")
                    .foregroundColor(.gray)
            } else {
                List(savedCompanies, id: \.id) { company in
                    Text(company.name)
                        .font(.headline)
                }
            }

            Spacer()
        }
        .padding()
    }
}

