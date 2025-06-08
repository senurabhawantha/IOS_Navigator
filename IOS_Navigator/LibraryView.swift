import SwiftUI

struct LibraryRoom: Identifiable {
    let id = UUID()
    let name: String
    let floor: String
    let status: RoomStatus
}

enum RoomStatus: String {
    case available = "AVAILABLE"
    case occupied = "OCCUPIED"
    
    var color: Color {
        switch self {
        case .available: return .green
        case .occupied: return .red
        }
    }
}

struct LibraryView: View {
    @State private var selectedFilter: String = "All"
    @State private var searchText: String = ""

    let rooms: [LibraryRoom] = [
        LibraryRoom(name: "Room A", floor: "1st Floor", status: .available),
        LibraryRoom(name: "Room B", floor: "1st Floor", status: .occupied),
        LibraryRoom(name: "Room C", floor: "2st Floor", status: .available),
        LibraryRoom(name: "Room D", floor: "2st Floor", status: .occupied),
        LibraryRoom(name: "Room E", floor: "2st Floor", status: .available)
    ]
    
    var filteredRooms: [LibraryRoom] {
        rooms.filter { room in
            (selectedFilter == "All" || room.floor.contains("2st")) &&
            (searchText.isEmpty || room.name.lowercased().contains(searchText.lowercased()))
        }
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            
            Image("libraryBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            
            Color.black.opacity(0.3)
                .ignoresSafeArea()

            VStack(spacing: 0) {
                
                VStack(spacing: 16) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                        TextField("Search", text: $searchText)
                            .foregroundColor(.white)
                        Image(systemName: "mic.fill")
                            .foregroundColor(.white)
                        Spacer()
                        Text("Cancel")
                            .foregroundColor(.white)
                    }
                    .padding(10)
                    .background(.ultraThinMaterial)
                    .cornerRadius(15)
                    .padding(.top, 50)
                    .padding(.horizontal, 90)

                    VStack(spacing: 0) {
                        Text("Library")
                        Text("Room Status")
                    }
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
                }

                // 🔹 Filter Buttons
                HStack(spacing: 10) {
                    Button(action: {
                        selectedFilter = "All"
                    }) {
                        Text("All")
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(selectedFilter == "All" ? Color.blue : Color.blue.opacity(0.4))
                            .cornerRadius(15)
                    }

                    Button(action: {
                        selectedFilter = "2st Floor"
                    }) {
                        Text("2nd Floor")
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(selectedFilter == "2st Floor" ? Color.blue : Color.blue.opacity(0.4))
                            .cornerRadius(15)
                    }

                    Spacer()
                }
                .padding(.horizontal, 90)
                .padding(.top, 8)

                
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(filteredRooms) { room in
                            HStack {
                                Circle()
                                    .fill(room.status.color)
                                    .frame(width: 20, height: 20)
                                
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(room.name)
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundColor(.black)
                                    Text(room.floor)
                                        .font(.system(size: 12))
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                Text(room.status.rawValue)
                                    .font(.system(size: 14, weight: .bold))
                                    .foregroundColor(room.status.color)
                            }
                            .padding(.vertical, 15)
                            .padding(.horizontal, 20)
                            .background(Color.white)
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 1)
                        }
                    }
                    .padding(.horizontal, 80)
                    .padding(.top)
                }

                Spacer(minLength: 20)

                
              
                
                VStack {
                    HStack(spacing: 70) {
                        // Home Tab (stays here)
                        TabBarItem(iconName: "homeimage", isSelected: true)

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
                            TabBarItem(iconName: "profileimage", isSelected: false)
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
}

#Preview {
    LibraryView()
}
