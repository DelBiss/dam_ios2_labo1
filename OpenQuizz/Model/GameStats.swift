//
//  GameStats.swift
//  Labo 1
//
//  Created by Philippe Allard-Rousse (Étudiant) on 2022-06-03.
//  Copyright © 2022 Ahuntsic. All rights reserved.
//

import Foundation

class GameStats{
    private var _best:Int=0
    private var _nbPartie:Int=0
    static let shared = GameStats()
    private init() {}
    
    var bestScore:Int{
        get{
            return _best
        }
    }
    
    var nb_partie:Int{
        get{
            return _nbPartie
        }
    }
    
    func gameCompleted(score:Int)  {
        _nbPartie = _nbPartie + 1
        _best = max(score, _best)
    }
}
