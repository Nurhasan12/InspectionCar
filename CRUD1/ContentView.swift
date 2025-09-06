import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        entity: InspectionItem.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \InspectionItem.title, ascending: true)],
        animation: .default
    )
    private var items: FetchedResults<InspectionItem>

    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    Section(header: HStack {
                        Text(item.title ?? "Untitled")
                            .font(.headline)
                        Spacer()
                        Button(action: {
                            toggleExpand(item)
                        }) {
                            Image(systemName: item.isExpanded ? "chevron.up" : "chevron.down")
                        }
                    }) {
                        if item.isExpanded {
                            VStack(alignment: .leading, spacing: 10) {
                                // Status
                                HStack {
                                    Button("Bersih") { updateStatus(item, "Bersih") }
                                        .buttonStyle(.bordered)
                                    Button("Noda") { updateStatus(item, "Noda") }
                                        .buttonStyle(.bordered)
                                    Button("Sobek") { updateStatus(item, "Sobek") }
                                        .buttonStyle(.bordered)
                                }
                                
                                // Note
                                TextField("Tambahkan Catatan", text: Binding(
                                    get: { item.note ?? "" },
                                    set: { newValue in
                                        item.note = newValue
                                        saveContext()
                                    }
                                ))
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                
                                // Status display
                                Text("Status: \(item.status ?? "-")")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Inspeksi Mobil")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
    }

    // MARK: - Core Data Helpers
    private func addItem() {
        let newItem = InspectionItem(context: viewContext)
        newItem.id = UUID()
        newItem.title = "Jok & Kursi" // default title (bisa diedit)
        newItem.note = ""
        newItem.status = "-"
        newItem.isExpanded = false
        saveContext()
    }

    private func toggleExpand(_ item: InspectionItem) {
        item.isExpanded.toggle()
        saveContext()
    }

    private func updateStatus(_ item: InspectionItem, _ status: String) {
        item.status = status
        saveContext()
    }

    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            print("Error saving context: \(error)")
        }
    }
}

#Preview {
    ContentView()
}
