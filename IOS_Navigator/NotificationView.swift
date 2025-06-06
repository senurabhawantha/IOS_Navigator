import SwiftUI

struct NotificationItem: Identifiable {
    let id = UUID()
    let iconName: String
    let title: String
    let subtitle: String
    let time: String
    let iconColor: Color
}

struct NotificationView: View {
    
    let notifications: [NotificationItem] = [
        NotificationItem(iconName: "circle.fill", title: "Library Room A Available", subtitle: "Now Available", time: "10 min", iconColor: .green),
        NotificationItem(iconName: "bell.fill", title: "Orientation is at 1:00 pm", subtitle: "Don’t forget today session", time: "12 min", iconColor: .red),
        NotificationItem(iconName: "circle.fill", title: "Library Room C Available", subtitle: "Now Available", time: "15 min", iconColor: .green),
        
        NotificationItem(iconName: "building.2.fill", title: "C2009 is booked for SPM lecture", subtitle: "Not Available", time: "1 hour", iconColor: .purple),
        NotificationItem(iconName: "building.2.fill", title: "C2001 is booked for PDSA lecture", subtitle: "Not Available", time: "1 hour", iconColor: .purple)
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                // Header with new background image
                ZStack(alignment: .topLeading) {
                    Image("notificationBackground") // <-- Updated image name
                        .resizable()
                        .scaledToFill()
                        .frame(height: 220)
                        //.clipped()
                    
                    VStack(alignment: .leading) {
                        Button("Back") {
                            // handle back
                        }
                        .foregroundColor(.white)
                        .padding(.top, 50)
                        .padding(.leading)
                        .offset(x: 20)
                        Spacer()
                        
                        Text("Notification")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.leading)
                            .padding(.bottom, 10)
                            .offset(x: 110)
                            .offset(y : -125)
                    }
                }
                .frame(height: 220)

                // Notification Cards
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(notifications) { item in
                            NotificationCard(item: item)
                        }
                    }
                    .padding()
                }
                
                Spacer()
            }

            // Bottom Navigation Bar
            HStack(spacing: 60) {
                TabBarItem(iconName: "homeimage", isSelected: false)
                TabBarItem(iconName: "locationimage", isSelected: false)
                TabBarItem(iconName: "bellimage", isSelected: true)
                TabBarItem(iconName: "profileimage", isSelected: false)
            }
            .frame(height: 75)
            .padding(.horizontal, 40)
            .background(Color.white)
           // .clipShape(RoundedRectangle(cornerRadius: 30))
           // .shadow(radius: 4)
            .padding(.bottom, 0)
        }
        //.edgesIgnoringSafeArea(.top)
    }
}

// MARK: - Notification Card View

struct NotificationCard: View {
    let item: NotificationItem
    
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
                Text(item.subtitle)
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

struct TabBarItem8: View {
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
    NotificationView()
}
