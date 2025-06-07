//
//  ProfileView.swift
//  IOS_Navigator
//
//  Created by ITEDP on 2025-06-06.
//
import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 0) {
            // Top profile section
            ZStack(alignment: .topTrailing) {
                Color.blue
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 300)

                VStack(spacing: 12) {
                    Spacer().frame(height: 60)

                    Text("Profile")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)

                    // Profile Picture & Name
                    Image("profilepicture") // Add your asset with this name
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 3))

                    Text("Fernando")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)

                    Text("jd@gmail.com")
                        .foregroundColor(.white.opacity(0.9))
                }

                // Settings icon
                Button(action: {
                    // Action for settings gear
                }) {
                    Image(systemName: "gearshape.fill")
                        .font(.title2)
                        .padding()
                        .foregroundColor(.white)
                }
                .padding(.top, 60)
                .padding(.trailing, 20)
            }

            // Settings and privacy section
            VStack(spacing: 20) {
                ButtonRow(title: "Settings and Privacy")

                Text("Settings")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)

                VStack(spacing: 16) {
                    ButtonRow(title: "Notification")
                    ButtonRow(title: "Schedule")
                    ButtonRow(title: "Logout")
                }
            }
            .padding()

            Spacer()

            // Bottom navigation bar
            VStack {
                HStack(spacing: 70) {
                    // Home Tab (stays here)
                    NavigationLink(destination: DashboardView()) {
                        TabBarItem(iconName: "homeblack", isSelected: false)
                    }
                    // Location Tab
                    NavigationLink(destination: SearchMapView()) {
                        TabBarItem(iconName: "locationimage", isSelected: false)
                    }

                    // Bell Tab
                    NavigationLink(destination: NotificationView()) {
                        TabBarItem(iconName: "bellimage", isSelected: false)
                    }

                    // Profile Tab
                    NavigationLink(destination: ProfileView()) {
                        TabBarItem(iconName: "profileblue", isSelected: true)
                    }
                }
                .frame(height: 45)
                .padding(.horizontal, 40)
                .padding(.top, 40)
                .padding(.bottom, 10)
            }
            
            .frame(maxWidth: .infinity)
            .background(Color.white)
        }
    }
}

struct ButtonRow: View {
    let title: String

    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.black)
                .font(.system(size: 18, weight: .semibold))
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 2)
    }
}

struct TabBarItem6: View {
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
    ProfileView()
}

