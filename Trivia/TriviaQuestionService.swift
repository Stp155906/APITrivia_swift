//
//  TriviaQuestionService.swift
//  Trivia
//
//  Created by Shantalia
//

import Foundation

class TriviaQuestionService {
    private let urlString = "https://opentdb.com/api.php?amount=5&type=multiple"

    func fetchTriviaQuestions(completion: @escaping (Result<[TriviaQuestion], Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 1001, userInfo: nil)))
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: 1002, userInfo: nil)))
                return
            }

            do {
                let triviaResponse = try JSONDecoder().decode(TriviaAPIResponse.self, from: data)
                completion(.success(triviaResponse.questions))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
