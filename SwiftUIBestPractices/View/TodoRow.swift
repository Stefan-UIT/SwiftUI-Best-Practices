//
//  TodoRow.swift
//  SwiftUIBestPractices
//
//  Created by Zien Solutions on 9/2/20.
//  Copyright © 2020 Trung Vo. All rights reserved.
//

import SwiftUI

struct TodoRow: View {
    var todo: Todo
    
    var body: some View {
        HStack {
            Image(systemName: todo.isCompleted ? "checkmark.square.fill" : "square") // 2
                .resizable() // 3
                .frame(width: 20, height: 20) // 4
                .foregroundColor(todo.isCompleted ? .blue : .black) // 5
            Text(todo.title)
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
    }
}

struct TodoRow_Previews: PreviewProvider {
    static var previews: some View {
        Group { // 7
            TodoRow(todo: Todo(title: "Buy groceries"))
            TodoRow(todo: Todo(title: "Visit a doctor", isCompleted: true)) // 8
        }.previewLayout(.fixed(width: 300, height: 44)) // 9
    }
}
