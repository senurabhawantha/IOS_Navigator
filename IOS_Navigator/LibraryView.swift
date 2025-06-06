//
//  LibraryView.swift
//  IOS_Navigator
//
//  Created by ITEDP on 2025-06-06.
//
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
        LibraryRoom(name: "Room C", floor: "2nd Floor", status: .available),
        LibraryRoom(name: "Room D", floor: "2nd Floor", status: .occupied),
        LibraryRoom(name: "Room E", floor: "2nd Floor", status: .available)
    ]
    
    var filteredRooms: [LibraryRoom] {
        rooms.filter { room in
            (selectedFilter == "All" || room.floor.contains("2nd")) &&
            (searchText.isEmpty || room.name.lowercased().contains(searchText.lowercased()))
        }
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                // Header with background
                ZStack(alignment: .top) {
                    Image("libraryBackground")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 260)
                        .clipped()
                        .overlay(Color.black.opacity(0.3))

                    VStack(alignment: .leading, spacing: 16) {
                        // Search Bar
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.blue)
                            TextField("Search", text: $searchText)
                                .textFieldStyle(PlainTextFieldStyle())
                            Image(systemName: "mic.fill")
                            Spacer()
                            Text("Cancel")
                                .foregroundColor(.blue)
                        }
                        .padding(10)
                        .background(.ultraThinMaterial)
                        .cornerRadius(15)
                        .padding(.top, 50)
                        .padding(.horizontal)

                        // Title
                        Text("Library\nRoom Status")
                            .font(.system(size: 34, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    }
                }

                // Filter Buttons
                HStack(spacing: 10) {
                    Button(action: {
                        selectedFilter = "All"
                    }) {
                        Text("All")
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(selectedFilter == "All" ? Color.blue : Color.gray.opacity(0.3))
                            .cornerRadius(15)
                    }

                    Button(action: {
                        selectedFilter = "2nd Floor"
                    }) {
                        Text("2nd Floor")
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(selectedFilter == "2nd Floor" ? Color.blue : Color.gray.opacity(0.3))
                            .cornerRadius(15)
                    }

                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 8)
                
                // Room Cards
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(filteredRooms) { room in
                            HStack {
                                Circle()
                                    .fill(room.status.color)
                                    .frame(width: 24, height: 24)
                                
                                VStack(alignment: .leading) {
                                    Text(room.name)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.black)
                                    Text(room.floor)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                Text(room.status.rawValue)
                                    .fontWeight(.bold)
                                    .foregroundColor(room.status.color)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(20)
                            .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
                        }
                    }
                    .padding()
                }

                Spacer()
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
            //.clipShape(RoundedRectangle(cornerRadius: 30))
            //.shadow(radius: 4)
            .padding(.bottom, 0)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    LibraryView()
}

