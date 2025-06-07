//
//  StepView.swift
//  IOS_Navigator
//
//  Created by ITEDP on 2025-06-06.
//
import SwiftUI

struct StepView: View {
    let steps: [StepItem] = [
        StepItem(icon: "s5", text: "TAKE A LIFT"),
        StepItem(icon: "s5", text: "SETUP OUT FROM 3 FLOOR"),
        StepItem(icon: "s5", text: "MAKE RIGHT ON MAIN DOOR"),
        StepItem(icon: "s5", text: "TAKE LEFT ON FIRST DOOR"),
        StepItem(icon: "s5", text: "YOU REACHED TO HARDWARE LAB")
    ]

    var body: some View {
        ZStack(alignment: .bottom) {
            // MARK: - Background
            Image("stepsBackground") // Add your background image to assets
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 20) {
                // MARK: - Header
                HStack {
//                    Button("Back") {
//                        // Handle back
//                    }
//                    .foregroundColor(.white)

                    Spacer()

                    Text("Steps")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    Spacer()

//                    Button("Cancel") {
//                        // Handle cancel
//                    }
                    .foregroundColor(.white)
                }
                .padding(.top, 50)
                .padding(.horizontal)
                Spacer()
                // MARK: - Guide Title
                HStack {
                    Text("Follow This Guide")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                    
                }
                .padding(.horizontal)
                Spacer()
                //Spacer()
                // MARK: - Step List
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        ForEach(0..<steps.count, id: \.self) { index in
                            HStack(alignment: .top, spacing: 20) {
                                VStack(spacing: 20) {
                                    Image(steps[index].icon)
                                        .resizable()
                                        .frame(width: 36, height: 36)
                                        .background(Color.white)
                                        .clipShape(Circle())
                                    
                                    if index != steps.count - 1 {
                                        Rectangle()
                                            .fill(Color.white.opacity(0.5))
                                            .frame(width: 2, height: 40)
                                            .padding(.top, 2)
                                    }
                                }

                                Text(steps[index].text)
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                                    .fixedSize(horizontal: false, vertical: true)

                                Spacer()
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 100)
                }
            }

            // MARK: - Bottom Tab Bar
            VStack {
                HStack(spacing: 60) {
                    TabBarItem(iconName: "homeimage", isSelected: false)
                    TabBarItem(iconName: "locationblue", isSelected: true)
                    TabBarItem(iconName: "bellimage", isSelected: false)
                    TabBarItem(iconName: "profileimage", isSelected: false)
                }
                .frame(height: 75)
                .padding(.horizontal, 40)
                .padding(.top, 20)
                .padding(.bottom, 30)
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30))
        }
    }
}

struct StepItem {
    let icon: String
    let text: String
}

struct TabBarItem3: View {
    let iconName: String
    let isSelected: Bool

    var body: some View {
        Image(iconName)
            .resizable()
            .renderingMode(.template)
            .foregroundColor(isSelected ? .blue : .black)
            .frame(width: 28, height: 28)
    }
}

#Preview {
    StepView()
}

