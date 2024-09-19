//
//  DatePicker.swift
//  PlanTrip
//
//  Created by MacBook AIR on 19/09/2024.
//

import SwiftUI
struct DateField: View {
    let title: String
    @Binding var date: Date
    @Binding var showPicker: Bool
    let formatter: DateFormatter

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
            .font(.satoshiMedium(size: 12))
            .foregroundColor(.blackText)

            Button(action: {
                showPicker.toggle()
            }) {
                HStack {
                    Text(formatter.string(from: date))
                    .foregroundColor(.blackText)
                    Spacer()
                    Image("CalendarImage")
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 4)
                      .fill(Color.white)
                  )
                .cornerRadius(8)
                .overlay(textViewBorder())
            }
        }
    }
  private func textViewBorder() -> some View {
      RoundedRectangle(cornerRadius: 4, style: .continuous) .stroke(Color.grayText, lineWidth: 1)

  }
}
