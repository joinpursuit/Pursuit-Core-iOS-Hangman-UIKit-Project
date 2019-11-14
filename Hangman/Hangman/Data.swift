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
    "AutomaticReferenceCounting", "MemorySafety", "AccessControl", "AdvancedOperators"]), Category(type: "Pursuit 6.3 Fellows", targetWords: ["Kelby", "Cameron", "Shaniya", "Juan", "Ian", "Matthew", "Maitree", "Stephanie", "Greg", "Jaheed", "Tanya", "Tiffany", "David", "Brendon", "Ameni", "Cassandra", "Oscar", "Tsering", "Chelsi", "Bienbenido", "Yulia", "Luba", "Eric", "Adan", "Margiett", "Melinda", "Christian", "Joshua", "Andrea", "Anna", "Lilia"]), Category(type: "Countries", targetWords: ["Nigeria","Bangladesh","India", "Nepal", "Ukraine", "Russia", "SaintLucia", "Jamaica", "America", "Mexico", "Brazil", "Argentina", "Chile", "France", "Japan", "Philipines", "China", "Canada", "Greenland", "Iceland", "Spain", "Catalan", "Denmark", "Germany", "DominicanRepublic", "Haiti", "Egypt", "Iran", "Pakistan", "Italy"]), Category(type: "Colours", targetWords: ["Indigo", "Black", "Gray", "Green", "White", "Violet", "Scarlet", "Crimson", "Beige", "Brown", "Magenta", "Yellow", "Pink", "Orange", "Blue", "Periwinkle", "Olive", "Gold", "Silver", "Neon", "Bronze", "Red", "Aquamarine", "Topaz", "Emerald", "Garnet", "Ruby", "Sapphire", "Rainbow", "Onyx"]), Category(type: "Unbeatable Words", targetWords:["Awkward","Bagpipes","banjo","Haiku","Gypsy","Jazzy","Ivory","Jukebox","Kiosk","Momento","Pajama","Pixel","Rhythmic","Rogue","Sphinx","Twelfth","Unzip","Wildebeest", "Yacht","Zealous","Zigzag","Zombie","Gazebo","Fishhook","Crypt","Kayak","Mystify","Numbskull","Phlegm","Dwarves", "Croquet"]), Category(type: "Human Body", targetWords: ["Eye", "Nose", "Finger", "Ear", "Toe", "Skull", "Hair", "Esophagus", "Foot", "Mouth", "Lips", "Tongue", "Spine", "Stomach", "Chin", "Elbow", "Knee", "Shin", "Heel", "Chest", "Eyebrow", "Tooth", "Leg", "Hip", "Hand", "Wrist", "Nail", "Nostril", "Back", "Shoulder", "Neck", "Beard", "Waist", "arm", "Vein", "Nipple", "Skin", "Thigh"]), Category(type: "Greek Mythology", targetWords: ["Achelous", "Aeolus", "Aether", "Alastor", "Apollo", "Ares", "Aristaeus", "Asclepius", "Atlas", "Attis", "Boreas", "Caerus", "Castor", "Cerus", "Chaos", "Charon", "Cronos", "Crios", "Cronus", "Dinlas", "Deimos", "Dionysus", "Erebus", "Eros", "Eurus", "Glaucus", "Hades", "Helios", "Hephaestus", "Heracles", "Hermes", "Hesperus", "Hymenaios", "Hypnos", "Kratos", "Momus", "Morpheus", "Nereus", "Notus", "Oceanus", "Oneiroi", "Paean"," Pallas", "Pan", "Phosphorus", "Plutus", "Pollux", "Pontus", "Poseidon", "Priapus", "Pricus", "Prometheus", "Primordial", "Tartarus", "Thanatos", "Triton", "Typhon", "Uranus", "Zelus", "Zephyrus", "Zeus", "Cerberus", "Achilles", "Odysseus", "Atalanta", "Paris", "Athena", "Chiron", "Hera", "Demeter", "Persephone", "Oedipus", "Medusa"]), Category(type: "", targetWords: <#T##[String]#>)]
}
