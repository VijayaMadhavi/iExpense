//
//  ContentView.swift
//  iExpense
//
//  Created by Vijaya Madhavi on 28/02/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                            .foregroundColor(colorStyle(amount: item.amount))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    func colorStyle(amount: Double) -> Color {
        var color: Color
        if amount <= 10 {
            color = .blue
        } else if amount <= 50 {
            color = .red
        } else if amount <= 100 {
            color = .teal
        } else {
            color = .brown
        }
        return color
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
