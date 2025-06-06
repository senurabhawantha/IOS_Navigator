//
//  ScheduleView.swift
//  IOS_Navigator
//
//  Created by ITEDP on 2025-06-06.
//
import SwiftUI

struct ScheduleView: View {
    var body: some View {
        VStack(spacing: 0) {
            // Header
            ZStack(alignment: .topLeading) {
                Image("scheduleBackground") // Replace with your asset
                    .resizable()
                    .scaledToFill()
                    .frame(height: 250)
                    .clipped()

                VStack(alignment: .leading, spacing: 16) {
                    Button(action: {
                        // Back action
                    }) {
                        Text("Back")
                            .foregroundColor(.white)
                            .padding(.top, 40)
                            .padding(.leading, 20)
                    }

                    Text("Schedule")
                        .font(.system(size: 34, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.leading, 20)

                    // Search bar
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.blue)
                        Text("Search")
                            .foregroundColor(.gray)
                        Spacer()
                        Image(systemName: "mic.fill")
                            .foregroundColor(.gray)
                        Text("Cancel")
                            .foregroundColor(.blue)
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.horizontal, 20)
                }
            }

            // Schedule Cards
            ScrollView {
                VStack(spacing: 20) {
                    ScheduleCard(icon: "circle.fill", iconColor: .green, title: "Programming, Data Structures & Algorithms", room: "Hall C002", time: "8:00 AM - 11:00 AM")
                    ScheduleCard(icon: "bell.fill", iconColor: .red, title: "iOS Application Development", room: "Hall C009", time: "6:00 PM - 8:30 PM")
                    ScheduleCard(icon: "circle.fill", iconColor: .green, title: "Artificial Intelligence", room: "Hall C009", time: "6:00 PM - 8:30 PM")
                    ScheduleCard(icon: "building.2.fill", iconColor: .purple, title: "Individual Project", room: "Hall C007", time: "6:00 PM - 8:30 PM")
                    ScheduleCard(icon: "building.2.fill", iconColor: .purple, title: "Dissertation and Project", room: "Hall C007", time: "6:00 PM - 8:30 PM")
                }
                .padding(.horizontal)
                .padding(.top)
            }

            // Bottom Navigation Bar
            HStack(spacing: 60) {
                TabBarItem(iconName: "homeimage", isSelected: true)
                TabBarItem(iconName: "locationimage", isSelected: false)
                TabBarItem(iconName: "bellimage", isSelected: false)
                TabBarItem(iconName: "profileimage", isSelected: false)
            }
            .frame(height: 75)
            .padding(.horizontal, 40)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .shadow(radius: 4)
            .padding(.bottom, 5)
        }
    }
}

// MARK: - Schedule Card View
struct ScheduleCard: View {
    var icon: String
    var iconColor: Color
    var title: String
    var room: String
    var time: String

    var body: some View {
        HStack(alignment: .top) {
            Circle()
                .fill(iconColor)
                .frame(width: 24, height: 24)
                .overlay(
                    Image(systemName: icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 12, height: 12)
                        .foregroundColor(.white)
                )

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 16, weight: .bold))
                Text(room)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()

            Text(time)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}

// MARK: - TabBar Item
struct TabBarItem7: View {
    let iconName: String
    let isSelected: Bool

    var body: some View {
        Image(iconName)
            .resizable()
            .renderingMode(.template)
            .aspectRatio(contentMode: .fit)
            .frame(width: 24, height: 24)
            .foregroundColor(isSelected ? .blue : .black)
    }
}

#Preview {
    ScheduleView()
}

