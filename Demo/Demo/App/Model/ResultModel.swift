//
//  ResultModel.swift
//  Demo
//
//  Created by Yuto Mizutani on 2018/09/04.
//  Copyright © 2018 Yuto Mizutani. All rights reserved.
//

import CiNiiKit
import UIKit

/// Result view model
struct ResultViewModel {
    /// Title name
    let title: String
    /// Journal name
    let journal: String
    /// Author name
    let author: String
    /// Link URL
    let link: URL?
}

// MARK: - Private methods
struct ResultModel {
    /// Search word
    private(set) var searchWord: String
    /// Raw view models
    private var _viewModels: [ResultViewModel] = []
    /// Filterd view models
    private(set) var viewModels: [ResultViewModel] = []

    init(model: ArticlesModel) {
        self.searchWord = "Result"
        if let searchQuery = model.id.split(separator: "&").first(where: { $0.hasPrefix("q=") }),
           let searchWord = searchQuery[searchQuery.index(searchQuery.startIndex, offsetBy: 2)..<searchQuery.endIndex].removingPercentEncoding {
            self.searchWord = searchWord
        }

        self._viewModels = []
        model.graph[0].items?.forEach {
            let title = $0.title ?? ""
            let journal = $0.prismPublicationName != nil ? "\($0.prismPublicationName!), " : ""
            let date = $0.prismPublicationDate?.publicationDateString != nil ? "\($0.prismPublicationDate!.publicationDateString!), " : ""
            let authors = $0.dcCreator?.map { $0.value }.filter { $0 != nil }.map { $0! } ?? []
            let author = authors.count > 4 ? "\(authors[...2].joined(separator: ", ")), ... \(authors[authors.endIndex-1])" : authors.joined(separator: ", ")
            let link = $0.link?.id != nil ? URL(string: $0.link!.id!) : nil
            let viewModel = ResultViewModel(title: title,
                                            journal: "\(journal)\(date)",
                                            author: author,
                                            link: link)
            self._viewModels.append(viewModel)
        }
        self.viewModels = self._viewModels
    }
}

// MARK: - Internal methods
extension ResultModel {
    /// Add view models with model
    mutating func append(_ model: ArticlesModel) {
    }

    /// Filter view models with text
    mutating func filter(with text: String) {
        guard text != "" else {
            self.viewModels = self._viewModels
            return
        }
        self.viewModels = self._viewModels.filter {
            $0.title.contains(text) ||
                $0.journal.contains(text) ||
                $0.author.contains(text)
        }
    }

    /// Get view model with index
    func getViewModel(at index: Int) -> ResultViewModel? {
        guard index < self.viewModels.count else {
            return nil
        }
        return self.viewModels[index]
    }
}
