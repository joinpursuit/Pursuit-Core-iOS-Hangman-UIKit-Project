//
//  Category.swift
//  Hangman
//
//  Created by Cameron Rivera on 11/13/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

// A Category for the user to choose when playing a single player game.
struct Category{
    var type: String = ""
    var targetWords: [String] = []
}
 // Contains all of the data necessary for a sinlge player game.
class Data{
    static var singlePlayerWords: [Category] = [Category(type: "Swift", targetWords: ["Operators", "Strings", "Characters", "CollectionTypes", "ControlFlow", "Functions",
    "Closures", "Enumerations", "Structures", "Classes", "Properties", "Methods", "Subscripts",
    "Inheritance", "Initialization", "Deinitialization", "OptionalChaining", "ErrorHandling",
    "TypeCasting", "NestedTypes", "Extensions", "Protocols", "Generics", "OpaqueTypes",
    "AutomaticReferenceCounting", "MemorySafety", "AccessControl", "AdvancedOperators"]), Category(type: "Pursuit 6.3 Fellows", targetWords: ["Kelby", "Cameron", "Shaniya", "Juan", "Ian", "Matthew", "Maitree", "Stephanie", "Greg", "Jaheed", "Tanya", "Tiffany", "David", "Brendon", "Ameni", "Cassandra", "Oscar", "Tsering", "Chelsi", "Bienbenido", "Yulia", "Luba", "Eric", "Adan", "Margiett", "Melinda", "Christian", "Joshua", "Andrea", "Anna", "Lilia"]), Category(type: "Countries", targetWords: ["Nigeria","Bangladesh","India", "Nepal", "Ukraine", "Russia", "SaintLucia", "Jamaica", "America", "Mexico", "Brazil", "Argentina", "Chile", "France", "Japan", "Philipines", "China", "Canada", "Greenland", "Iceland", "Spain", "Catalan", "Denmark", "Germany", "DominicanRepublic", "Haiti", "Egypt", "Iran", "Pakistan", "Italy"]), Category(type: "Colours", targetWords: ["Indigo", "Black", "Gray", "Green", "White", "Violet", "Scarlet", "Crimson", "Beige", "Brown", "Magenta", "Yellow", "Pink", "Orange", "Blue", "Periwinkle", "Olive", "Gold", "Silver", "Neon", "Bronze", "Red", "Aquamarine", "Topaz", "Emerald", "Garnet", "Ruby", "Sapphire", "Rainbow", "Onyx"]), Category(type: "Unbeatable Words", targetWords:["Awkward","Bagpipes","banjo","Haiku","Gypsy","Jazzy","Ivory","Jukebox","Kiosk","Momento","Pajama","Pixel","Rhythmic","Rogue","Sphinx","Twelfth","Unzip","Wildebeest", "Yacht","Zealous","Zigzag","Zombie","Gazebo","Fishhook","Crypt","Kayak","Mystify","Numbskull","Phlegm","Dwarves", "Croquet"]), Category(type: "Human Body", targetWords: ["Eye", "Nose", "Finger", "Ear", "Toe", "Skull", "Hair", "Esophagus", "Foot", "Mouth", "Lip", "Tongue", "Spine", "Stomach", "Chin", "Elbow", "Knee", "Shin", "Heel", "Chest", "Eyebrow", "Tooth", "Leg", "Hip", "Hand", "Wrist", "Nail", "Nostril", "Back", "Shoulder", "Neck", "Beard", "Waist", "arm", "Vein", "Nipple", "Skin", "Thigh"]), Category(type: "Greek Mythology", targetWords: ["Achelous", "Aeolus", "Aether", "Alastor", "Apollo", "Ares", "Aristaeus", "Asclepius", "Atlas", "Attis", "Boreas", "Caerus", "Castor", "Cerus", "Chaos", "Charon", "Cronos", "Crios", "Cronus", "Dinlas", "Deimos", "Dionysus", "Erebus", "Eros", "Eurus", "Glaucus", "Hades", "Helios", "Hephaestus", "Heracles", "Hermes", "Hesperus", "Hymenaios", "Hypnos", "Kratos", "Momus", "Morpheus", "Nereus", "Notus", "Oceanus", "Oneiroi", "Paean"," Pallas", "Pan", "Phosphorus", "Plutus", "Pollux", "Pontus", "Poseidon", "Priapus", "Pricus", "Prometheus", "Primordial", "Tartarus", "Thanatos", "Triton", "Typhon", "Uranus", "Zelus", "Zephyrus", "Zeus", "Cerberus", "Achilles", "Odysseus", "Atalanta", "Paris", "Athena", "Chiron", "Hera", "Demeter", "Persephone", "Oedipus", "Medusa"]), Category(type: "Spiderman Villains", targetWords: ["Chameleon", "Vulture", "Tinkerer", "DoctorOctopus","Sandman", "Lizard", "LivingBrain", "Electro", "Bigman", "Mysterio", "GreenGoblin", "Kraven", "Scorpio", "Moltenman", "RobotMaster", "Shocker", "Rhino", "Kingpin", "Finisher", "Silvermane", "Morbius", "Hammerhead", "Tarantula", "Grizzly", "BlackCat", "Hydroman", "HobGoblin", "Carnage", "Venom", "Morlun", "Overdrive", "Screwball", "Massacre"]), Category(type: "Pixar Movies", targetWords: ["ToyStory", "ABugsLife", "MonstersInc", "FindingNemo", "TheIncredibles", "Cars", "Ratatouille", "Walle", "Up", "Brave", "InsideOut", "Coco", "TheGoodDinosaur"]), Category(type: "X-men Characters", targetWords: ["ProfessorX", "Cyclops", "Iceman", "Angel", "Beast", "Phoenix", "Polaris", "Havoc", "Vulcan", "Nightcrawler", "Wolverine", "Storm", "Sunfire", "Colossus", "Banshee", "Rogue", "Magneto", "Psylocke", "Dazzler", "Forge", "Gambit", "Jubilee", "Bishop", "Cable", "EmmaFrost", "Juggernaut", "Mystique", "Sabretooth", "Sunspot", "Domino"])]
}
