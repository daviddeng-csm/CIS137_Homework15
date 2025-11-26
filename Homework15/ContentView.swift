//
//  ContentView.swift
//  Homework15
//
//  App demostrating the usage of context menus
//
//  Created by David Deng on 11/26/25.
//

import SwiftUI

// Model for our items
struct MenuItem: Identifiable {
    let id = UUID()
    let name: String
    var selectedIcon: String?
}

struct ContentView: View {
    @State private var foodItems: [MenuItem] = [
        MenuItem(name: "Pasta"),
        MenuItem(name: "Hot Dog"),
        MenuItem(name: "Burger"),
        MenuItem(name: "Pizza")
    ]
    
    @State private var drinkItems: [MenuItem] = [
        MenuItem(name: "Coffee"),
        MenuItem(name: "Tea"),
        MenuItem(name: "Apple cider"),
        MenuItem(name: "Water")
    ]
    
    var body: some View {
        TabView {
            // Food Tab
            NavigationView {
                List(foodItems) { item in
                    HStack {
                        Text(item.name)
                            .font(.headline)
                        
                        Spacer()
                        
                        if let icon = item.selectedIcon {
                            Image(systemName: icon)
                                .foregroundColor(.blue)
                                .font(.title2)
                        }
                    }
                    .padding()
                    .contextMenu {
                        Button(action: {
                            selectSpicy(for: item)
                        }) {
                            Label("Make it Spicy", systemImage: "flame")
                        }
                        
                        Button(action: {
                            selectHealthy(for: item)
                        }) {
                            Label("Make it Vegatarian", systemImage: "leaf")
                        }
                    }
                }
                .navigationTitle("Food Menu")
            }
            .tabItem {
                Image(systemName: "fork.knife")
                Text("Food")
            }
            
            // Drinks Tab
            NavigationView {
                List(drinkItems) { item in
                    HStack {
                        Text(item.name)
                            .font(.headline)
                        
                        Spacer()
                        
                        if let icon = item.selectedIcon {
                            Image(systemName: icon)
                                .foregroundColor(.green)
                                .font(.title2)
                        }
                    }
                    .padding()
                    .contextMenu {
                        Button(action: {
                            selectHot(for: item)
                        }) {
                            Label("Serve Hot", systemImage: "thermometer.sun")
                        }
                        
                        Button(action: {
                            selectCold(for: item)
                        }) {
                            Label("Serve Cold", systemImage: "thermometer.snowflake")
                        }
                    }
                }
                .navigationTitle("Drink Menu")
            }
            .tabItem {
                Image(systemName: "mug")
                Text("Drinks")
            }
        }
    }
    
    // Food context menu actions
    private func selectSpicy(for item: MenuItem) {
        if let index = foodItems.firstIndex(where: { $0.id == item.id }) {
            foodItems[index].selectedIcon = "flame.fill"
        }
    }
    
    private func selectHealthy(for item: MenuItem) {
        if let index = foodItems.firstIndex(where: { $0.id == item.id }) {
            foodItems[index].selectedIcon = "leaf.fill"
        }
    }
    
    // Drink context menu actions
    private func selectHot(for item: MenuItem) {
        if let index = drinkItems.firstIndex(where: { $0.id == item.id }) {
            drinkItems[index].selectedIcon = "thermometer.sun.fill"
        }
    }
    
    private func selectCold(for item: MenuItem) {
        if let index = drinkItems.firstIndex(where: { $0.id == item.id }) {
            drinkItems[index].selectedIcon = "thermometer.snowflake"
        }
    }
}

#Preview {
    ContentView()
}
