//
//  SwipeableCardView.swift
//  FinHacks app
//
//  Created by Krisha Dani on 1/18/25.
//


import SwiftUI

struct SwipeableCardView: View {
    @Binding var savedCompanies: [Company]
    @Binding var numberOfSaves: Int
    @State private var companies: [Company] = []
    @State private var showToast: Bool = false

    var body: some View {
        ZStack {
            VStack {
                Text("Swipe Companies")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                if companies.isEmpty {
                    ProgressView("Loading companies...")
                        .onAppear {
                            fetchCompanies()
                        }
                } else {
                    ZStack {
                                            ForEach(companies.reversed()) { company in
                                                CompanyCardView(company: company)
                                                    .gesture(
                                                        DragGesture()
                                                            .onEnded { value in
                                                                if value.translation.width > 100 { // Swipe right
                                                                    saveCompany(company)
                                                                    showToastMessage()
                                                                }
                                                                removeCompany(company)
                                                            }
                                                    )
                                            }
                    }
                    .padding()
                }
                
                Spacer()
            }
            if showToast {
                            VStack {
                                Spacer()
                                Text("Company Saved!")
                                    .font(.headline)
                                    .padding()
                                    .background(Color.green.opacity(0.8))
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                                    .padding(.bottom, 50)
                                    .transition(.opacity) // Smooth fade effect
                            }
                        }
        }
        .animation(.easeInOut, value: showToast)
    }

    private func fetchCompanies() {
        companies = [
            Company(id: 1, name: "Tesla (TSLA)", bio: "Automotive and Clean Energy", imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Tesla_logo.png/1200px-Tesla_logo.png", stockPrice: "$426.50", percentChange: "3.06%", marketCap: "$1.3T", currentRatio: "1.73", peRatio: "0.07", riskLevel: "Low Risk", shortTerm: "Good Short Term Investment", longTerm: "Good Short Term Investment"),
            Company(id: 2, name: "Meta (META)", bio: "Social Media Giant", imageUrl: "https://www.citypng.com/public/uploads/preview/download-meta-facebook-black-logo-png-701751694777071xbfbrsf0xw.png", stockPrice: "$612.77", percentChange: "0.24%", marketCap: "$1.5T", currentRatio: "2.67", peRatio: "0.00", riskLevel: "Low Risk", shortTerm: "Bad Short Term Investment", longTerm: "Bad Long Term Investment"),
            Company(id: 3, name: "Pfizer (PFE)", bio: "Pharmaceuticals", imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/Pfizer_%282021%29.svg/500px-Pfizer_%282021%29.svg.png", stockPrice: "$26.3", percentChange: "-0.72%", marketCap: "$149B", currentRatio: "0.91", peRatio: "35.07", riskLevel: "High Risk", shortTerm: "Bad Short Term Tnvestment", longTerm: "Bad Long Term Investment"),
            Company(id: 4, name: "Johnson & Johnson (JNJ)", bio: "Healthcare", imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/JNJ_Logo_New.svg/2880px-JNJ_Logo_New.svg.png", stockPrice: "$147.03", percentChange: "-0.5%", marketCap: "$353.33B", currentRatio: "1.16", peRatio: "24.34", riskLevel : "Low Risk", shortTerm: "Bad Short Term Tnvestment", longTerm: "Good Long Term Investment"),
            Company(
                        id: 5,
                        name: "Apple (APL)",
                        bio: "Technology Leader",
                        imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/1280px-Apple_logo_black.svg.png",
                        stockPrice: "$229.98",
                        percentChange: "+0.5%",
                        marketCap: "$3.46T",
                        currentRatio: "0.87",
                        peRatio: "37.89",
                        riskLevel: "Low Risk",
                        shortTerm: "Good Short Term Investment",
                        longTerm: "Good Long Term Investment"
                    ),
            Company(
                        id: 6,
                        name: "Amazon (AMZN)",
                        bio: "E-Commerce Giant",
                        imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Amazon_2024.svg/2880px-Amazon_2024.svg.png",
                        stockPrice: "$229.94",
                        percentChange: "+2.39%",
                        marketCap: "$2.37T",
                        currentRatio: "1.05",
                        peRatio: "48.29",
                        riskLevel: "Low Risk",
                        shortTerm: "Good Short Term Investment",
                        longTerm: "Good Short Term Investment"
                    ),
            Company(
                        id: 7,
                        name: "Microsoft (MSFT)",
                        bio: "Technology Innovator",
                        imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/Microsoft_logo_%282012%29.svg/2880px-Microsoft_logo_%282012%29.svg.png",
                        stockPrice: "$429.03",
                        percentChange: "1.05",
                        marketCap: "$3.19T",
                        currentRatio: "1.27",
                        peRatio: "35.46",
                        riskLevel: "Low Risk",
                        shortTerm: "Bad Short Term Investment",
                        longTerm: "Bad Long Term Investment"
                    ),
            Company(
                        id: 9,
                        name: "Coca-Cola (KO)",
                        bio: "Beverage Leader",
                        imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/Coca-Cola_logo.svg/2880px-Coca-Cola_logo.svg.png",
                        stockPrice: "$62.71",
                        percentChange: "+0.74%",
                        marketCap: "$270B",
                        currentRatio: "1.13",
                        peRatio: "26.02",
                        riskLevel: "High Risk",
                        shortTerm: "Bad Short Term Investment",
                        longTerm: "Good Long Term Investment"
                    ),
                    Company(
                        id: 10,
                        name: "Nike (NKE)",
                        bio: "Sportswear Innovator",
                        imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Logo_NIKE.svg/2880px-Logo_NIKE.svg.png",
                        stockPrice: "$70.85",
                        percentChange: "-0.38%",
                        marketCap: "$105B",
                        currentRatio: "2.4",
                        peRatio: "21.86",
                        riskLevel: "Low Risk",
                        shortTerm: "Bad Short Term Investment",
                        longTerm: "Good Long Term Investment"
                    ),
            Company(id: 11, name: "Moderna (MRNA)", bio: "Biotech", imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Moderna_logo.svg/2880px-Moderna_logo.svg.png", stockPrice: "$34.06", percentChange: "0.89%", marketCap: "$13B", currentRatio: "3.42", peRatio: "-3.8", riskLevel: "Low Risk",
                        shortTerm: "Bad Short Term Investment",
                        longTerm: "Bad Short Term Investment"),
            Company(id: 11, name: "FedEX Corporation (FDX)", bio: "Manufacturing", imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/FedEx_Corporation_-_2016_Logo.svg/2880px-FedEx_Corporation_-_2016_Logo.svg.png", stockPrice: "$275.10", percentChange: "-0.82%", marketCap: "$66.B", currentRatio: "1.36", peRatio: "17.58", riskLevel: "High Risk",
                        shortTerm: "Bad Short Term Investment",
                        longTerm: "Good Long Term Investment"),
            Company(id: 12, name: "Lockheed Martin (LNT)", bio: "Manufacturing", imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Lockheed_Martin_logo.svg/2880px-Lockheed_Martin_logo.svg.png", stockPrice: "$494.32", percentChange: "0.71%", marketCap: "$116B", currentRatio: "1.21", peRatio: "17.73", riskLevel: "High Risk",
                        shortTerm: "Bad Short Term Investment",
                        longTerm: "Good Long Term Investment"),
            Company(id: 13, name: "TMobile (TMUS)", bio: "Information Technology", imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/T-Mobile_US_Logo_2022_RGB_Magenta_on_Transparent.svg/2880px-T-Mobile_US_Logo_2022_RGB_Magenta_on_Transparent.svg.png", stockPrice: "$218.97", percentChange: "1.49%", marketCap: "$254B", currentRatio: "0.91", peRatio: "24.94", riskLevel: "High Risk",
                        shortTerm: "Bad Short Term Investment",
                        longTerm: "Bad Long Term Investment")
            
        ]
    }

    private func saveCompany(_ company: Company) {
        savedCompanies.append(company)
        numberOfSaves += 1
    }

    private func removeCompany(_ company: Company) {
        companies.removeAll { $0.id == company.id }
    }
    
    private func showToastMessage() {
            showToast = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { // Hide after 1.5 seconds
                showToast = false
            }
        }
}
