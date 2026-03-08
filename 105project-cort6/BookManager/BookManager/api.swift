//
//  api.swift
//  BookManager
//
//  Created by Naqui Darby on 2/17/26.
//

import Foundation

func getBooks() -> [Book] {
    return [
        Book(title: "Walking tall", author: "R. J. Bicken", cover: "lotr_fellowship", summary: "This is a summary", rating: 4, review: "This is a review", isFavorite: false, genre: .thriller, readingStatus: .finshed),
        Book(title: "Tee Top", author: "R John", cover: "lotr_towers", summary: "This is a summary", rating: 4, review: "This is a review", isFavorite: false, genre: .romance, readingStatus: .reading ),
    Book(title: "The Great Gatsby", author: "F. Scott Fitzgerald", cover: "lotr_king",summary: "This is a summary ismum wrufeidoi sjfjdjjdk djfjdj djfkdk fkfkk fdkdkdkd dfkdkdl ldlfld ldldl lf l lfldlfdllddldfjkrjj e lflkljfekfrejonfenfkejfekghergregjherb  ogfhergerjfgegujerhfergio  orihgregerouhg jo  iojgreg eir og oierjrsv  jhghgrwi jger gk jgerg we gkj hgkjerhgerhg h gjk jkewjk rhgrwjlkejkhtkjerkjtjkkjh jkh hjkjhf drfhgjkerjkhfejhk ehreherkjgerkjgerkjhgk", rating: 4, review: "This is a review", isFavorite: false, genre: .fantasy, readingStatus: .planToRead)
]
}

func getNewBook() -> Book {
    return Book(title: "", author: "", cover: "lotr_king", summary: "", rating: 1)
}
