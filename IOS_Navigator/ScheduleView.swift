import SwiftUI

struct ScheduleItem: Identifiable {
    let id = UUID()
    let iconName: String
    let title: String
    let hall: String
    let time: String
    let iconColor: Color
}

struct ScheduleView: View {
    let scheduleItems: [ScheduleItem] = [
        ScheduleItem(iconName: "circle.fill", title: "Programming, Data Structures & Algorithms", hall: "Hall C002", time: "8:00 AM - 11:00 AM", iconColor: .green),
        ScheduleItem(iconName: "bell.fill", title: "iOS Application Development", hall: "Hall C009", time: "6:00 PM - 8:30 PM", iconColor: .red),
        ScheduleItem(iconName: "circle.fill", title: "Artificial Intelligence", hall: "Hall C009", time: "6:00 PM - 8:30 PM", iconColor: .green),
        ScheduleItem(iconName: "building.2.fill", title: "Individual Project", hall: "Hall C007", time: "6:00 PM - 8:30 PM", iconColor: .purple),
        ScheduleItem(iconName: "building.2.fill", title: "Dissertation and Project", hall: "Hall C007", time: "6:00 PM - 8:30 PM", iconColor: .purple)
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Background Image
            Image("schedulebackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 0) {
                // Top Header
                VStack(alignment: .leading) {
                    HStack {
//                        Button("Back") {
//                            // Handle back action
//                        }
//                        .foregroundColor(.white)
                        
                        Spacer()
                        
                        Text("Schedule")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                    .padding(.top, 50)
                    .padding(.horizontal)
                    
                    // Search Bar
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.blue)
                        Text("Search")
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "mic.fill")
                            .foregroundColor(.white)
                        Text("Cancel")
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(20)
                    .padding(.horizontal)
                    .padding(.top, 10)
                }
                .padding(.bottom)

                // Scrollable Content
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(scheduleItems) { item in
                            ScheduleCard(item: item)
                        }
                    }
                    .padding()
                }

                // Bottom Navigation Bar
                HStack(spacing: 60) {
                    TabBarItem(iconName: "homeimage", isSelected: true)
                    TabBarItem(iconName: "locationimage", isSelected: false)
                    TabBarItem(iconName: "bellimage", isSelected: false)
                    TabBarItem(iconName: "profileimage", isSelected: false)
                }
                .frame(height: 85)
                .padding(.horizontal, 55)
                .background(Color.white)
                //.clipShape(RoundedRectangle(cornerRadius: 30))
                //.shadow(radius: 4)
                .padding(.bottom, 30)
            }
        }
    }
}

// MARK: - Schedule Card

struct ScheduleCard: View {
    let item: ScheduleItem
    
    var body: some View {
        HStack {
            Image(systemName: item.iconName)
                .foregroundColor(item.iconColor)
                .font(.system(size: 24))
                .frame(width: 36, height: 36)
                .background(item.iconColor.opacity(0.2))
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(item.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                Text(item.hall)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text(item.time)
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(25)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}

// MARK: - TabBar Item

struct TabBarItem9: View {
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

// MARK: - Preview

#Preview {
    ScheduleView()
}
