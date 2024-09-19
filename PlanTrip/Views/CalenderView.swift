//
//  CalenderView.swift
//  PlanTrip
//
//  Created by MacBook AIR on 19/09/2024.
//

import SwiftUI

struct DatePickerView: View {
    @State private var startDate = Date()
    @State private var endDate = Date().addingTimeInterval(3 * 24 * 60 * 60) // 3 days later
    @State private var showingStartPicker = false
    @State private var showingEndPicker = false

    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, MMM d"
        return formatter
    }()

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
              ScrollView{
                DatePicker("", selection: $startDate, displayedComponents: [.date])
                  .datePickerStyle(GraphicalDatePickerStyle())
                  .frame(maxHeight: 400)
                DatePicker("", selection: $endDate, displayedComponents: [.date])
                  .datePickerStyle(GraphicalDatePickerStyle())
                  .frame(maxHeight: 400)
                 }
                HStack {
                    DateField(title: "Start Date", date: $startDate, showPicker: $showingStartPicker, formatter: dateFormatter)
                    DateField(title: "End Date", date: $endDate, showPicker: $showingEndPicker, formatter: dateFormatter)
                }

                Button(action: {
                    print("Dates selected: \(dateFormatter.string(from: startDate)) - \(dateFormatter.string(from: endDate))")
                }) {
                    Text("Choose Date")
                         .font(.satoshiBold(size: 14))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
            .navigationTitle("gopaddi.com/flights")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}) {
                        Image(systemName: "xmark")
                    }
                }
            }
        }
        .sheet(isPresented: $showingStartPicker) {
            DatePicker("", selection: $startDate, displayedComponents: [.date])
                .datePickerStyle(GraphicalDatePickerStyle())
                .presentationDetents([.medium])
        }
        .sheet(isPresented: $showingEndPicker) {
            DatePicker("", selection: $endDate, in: startDate..., displayedComponents: [.date])
                .datePickerStyle(GraphicalDatePickerStyle())
                .presentationDetents([.medium])
        }
    }
}


#Preview {
  DatePickerView()
}

extension DatePickerView {

}

