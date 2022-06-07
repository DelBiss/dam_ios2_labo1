//
//  Labo_1Tests.swift
//  Labo 1Tests
//
//  Created by Vincent Leduc on 2021-06-30.
//  Copyright © 2021 Ahuntsic. All rights reserved.
//

import XCTest
@testable import Labo_1 // MARK: - FIXME

class Labo_1Tests: XCTestCase {

    var TrueQuestion=Question(title: "True Question", isCorrect: true)
    var FalseQuestion=Question(title: "False Question", isCorrect: false)
    
    override func setUpWithError() throws {
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func playGame(questions questions: [Question], answers answers: [Bool]) -> Game
    {
        let game = Game()
        game.setGameQuestions(questions)
        for answer in answers {
            game.answerCurrentQuestion(with: answer)
        }
        return game
    }
    
    func testGivenTwoTrueQuestions_WhenAnsweringTrue_ThenScoreIsOneAndGameOnGoing() throws {
        let myQuestion:[Question] = [TrueQuestion,TrueQuestion]
        let myAnswer:[Bool] = [true]
        let game = playGame(questions: myQuestion, answers: myAnswer)
        
        XCTAssert(game.score == 1)
        XCTAssert(game.state == .ongoing)
    }
    
    func testGivenOneTrueQuestion_WhenAnsweringFalse_ThenScoreIs0AndGameOver() throws {
        let myQuestion:[Question] = [TrueQuestion]
        let myAnswer:[Bool] = [false]
        let game = playGame(questions: myQuestion, answers: myAnswer)
        
        XCTAssert(game.score == 0)
        XCTAssert(game.state == .over)
    }

    func testGivenOneTrueQuestion_WhenAnsweringTrue_ThenScoreIs1AndGameOver() throws {
        let myQuestion:[Question] = [TrueQuestion]
        let myAnswer:[Bool] = [true]
        let game = playGame(questions: myQuestion, answers: myAnswer)
        
        XCTAssert(game.score == 1)
        XCTAssert(game.state == .over)
    }
    
    func testGivenEmptyQuestionnaire_WhenSetGameQuestions_ThenGameIsOnGoingAndCurrentQuestionMatchesExcpectedTitle() throws {
        let myQuestion:[Question] = [FalseQuestion,TrueQuestion]
        let myAnswer:[Bool] = []
        let game = playGame(questions: myQuestion, answers: myAnswer)
        
        XCTAssert(game.currentQuestion.title == myQuestion[0].title)
        XCTAssert(game.state == .ongoing)
    }
    
    func testGivenACompletedQuestionnaire_WhenRefresh_ThenGameStatusIsOngoingAndScoreIs0CurrentQuestionTitleIsDifferentThenLastQuestion(){
        let myQuestion:[Question] = [FalseQuestion,TrueQuestion,FalseQuestion]
        let myAnswer:[Bool] = [true,false,false]
        let game = playGame(questions: myQuestion, answers: myAnswer)
        
        weak var expectation = self.expectation(description: "testDataFetched")

            //set the notification name to whatever you called it
        NotificationCenter.default.addObserver(forName: Game.questionsLoadedNotifName, object: nil, queue: nil) { notification in
                XCTAssert(game.score == 0)
                XCTAssert(game.state == .ongoing)
                XCTAssert(game.currentQuestion.title != myQuestion[myQuestion.count-1].title)
                expectation?.fulfill()
            }

        
            game.refresh()

        waitForExpectations(timeout: 30, handler: nil)
        
        }

}
