//
//  TodoListView.swift
//  SwiftUIBestPractices
//
//  Created by Zien Solutions on 9/2/20.
//  Copyright © 2020 Trung Vo. All rights reserved.
//

import SwiftUI

struct TodoListView: View {
    @ObservedObject var viewModel = TodoListViewModel()
    @State private var isShowingAddNew = false
    
    private var addNewButton: some View {
        Button(action: {
            self.isShowingAddNew.toggle()
        }) {
            Image(systemName: "plus")
        }
    }
    
    private var showCompletedButton: some View { // 1
        Button(action: {
            self.viewModel.showCompleted.toggle()
        }) {
            Image(systemName: self.viewModel.showCompleted ? "checkmark.circle.fill" : "checkmark.circle")
        }
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.todos) { todo in
                Button(action: {self.viewModel.toggleIsCompleted(for: todo)}) {
                    TodoRow(todo: todo)
                }
            }
            .navigationBarTitle(Text("Todo List"))
            .navigationBarItems(leading: showCompletedButton, trailing: addNewButton) // 2
        }
        .sheet(isPresented: $isShowingAddNew, onDismiss: {
            self.viewModel.fetchTodos()
            
        }) {
            NewTodoView(viewModel: NewTodoViewModel())
        }
        .onAppear {
            self.viewModel.fetchTodos()
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        var view = TodoListView()
        view.viewModel = TodoListViewModel(dataManager: MockDataManager())
        return view
    }
}
