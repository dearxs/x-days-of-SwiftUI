//
//  TransactionApp.swift
//  Transaction
//
//  Created by Dali Han on 2020/7/31.
//  Credit to Ian Keen: https://gist.github.com/IanKeen/a85e4ed74a10a25341c44a98f43cf386
//  a self-cooked property wrapper: @transaction
//  a binding for swiftui to make changes to data supporting commit or rollback(cancel)

import SwiftUI

@main
struct TransactionApp: App {
    
    //    @State var value = User(firstName: "", lastName: "")
    //    @State var showEdit = false
    
    @State var value = 0
    
    var body: some Scene {
        WindowGroup {
            MyView(value: $value.transaction())
            //            VStack {
            //                Text("First Name: \(value.firstName)")
            //                Text("Last Name: \(value.lastName)")
            //                Button("Edit") { showEdit = true }
            //            }
            //            .sheet(isPresented: $showEdit) {
            //                UserEditView(value: $value.transaction())
            //            }
        }
    }
}


struct MyView : View {
    
    @Transaction var value : Int
    
    var body: some View {
        VStack {
            Text("Value: \(value)")
            Text("HasChanges: \($value.hasChanges ? "yes" : "No")")
            Divider()
            Button("Increase") { value += 1 }
            Button("Commit", action: $value.commit)
            Button("Rollback", action: $value.rollback)
        }
    }
}


struct User : Equatable {
    var firstName : String
    var lastName : String
}

struct UserEditView : View {
    @Transaction var value : User
    
    var body: some View {
        VStack {
            TextField("First Name", text: $value.firstName)
            TextField("Last Name", text: $value.lastName)
            Divider()
            Button("Commit", action: $value.commit).disabled(!$value.hasChanges)
            Button("Rollback", action: $value.rollback).disabled(!$value.hasChanges)
        }
    }
}
