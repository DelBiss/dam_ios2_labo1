//
//  GameConfig.swift
//  Labo 1
//
//  Created by Philippe Allard-Rousse (Étudiant) on 2022-06-03.
//  Copyright © 2022 Ahuntsic. All rights reserved.
//

import Foundation

class GameConfig{
    private var _playerName = "defaut player"
    
    static let shared = GameConfig()
    private init() {}
    
    var playerName:String{
        get{
            return _playerName
        }
        
        set(newName){
            _playerName = newName
        }
    }
}
