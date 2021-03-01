//
//  CheckoutView.swift
//  iDine
//
//  Created by Leonid on 01.03.2021.
//

import SwiftUI

struct CheckoutView: View {
    
    @EnvironmentObject var order: Order
    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    let tipAmounts = [10, 15, 20, 25, 0]
    
    @State private var paymentType = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 15
    
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
    }
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
            }
            Section(header: Text("Add a tip?")) {
                Picker("", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("$\($0)%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            
            Section(header: Text("Total: \(totalPrice)")) {
                Button("Confirm order") {
                    
                }
            }
            
        }
        .navigationBarTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView().environmentObject(Order())
    }
}
