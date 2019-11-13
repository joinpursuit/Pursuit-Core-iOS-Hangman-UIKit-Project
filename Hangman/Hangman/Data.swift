//
//  Category.swift
//  Hangman
//
//  Created by Cameron Rivera on 11/13/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct Category{
    var type: String = ""
    var targetWords: [String] = []
}

class Data{
    static var singlePlayerWords: [Category] = [Category(type: "Swift", targetWords: ["Operators", "Strings", "Characters", "CollectionTypes", "ControlFlow", "Functions",
    "Closures", "Enumerations", "Structures", "Classes", "Properties", "Methods", "Subscripts",
    "Inheritance", "Initialization", "Deinitialization", "OptionalChaining", "ErrorHandling",
    "TypeCasting", "NestedTypes", "Extensions", "Protocols", "Generics", "OpaqueTypes",
    "AutomaticReferenceCounting", "MemorySafety", "AccessControl", "AdvancedOperators"])]
}
