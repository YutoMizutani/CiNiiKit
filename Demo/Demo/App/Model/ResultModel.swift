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

/// A state of pagenation
enum PagingState {
    case preparing
    case waiting
    case fetching
    case maxPage
}

// MARK: - Private methods
class ResultModel {
    /// Searched model
    private var model: ArticlesModel
    /// Results from ArticlesModel
    private var results: [ArticlesModel.Item]

    /// CiNiiKit instance
    private let cinii: CiNiiKit
    /// Pagenation state
    private var state: PagingState
    /// Filtering state
    private var isFiltering: Bool {
        return self._viewModels.count != self.viewModels.count
    }

    /// Search word
    private(set) var searchWord: String

    /// Raw view models
    private var _viewModels: [ResultViewModel] = []
    /// Filterd view models
    private(set) var viewModels: [ResultViewModel] = []

    init(model: ArticlesModel) {
        self.model = model
        self.results = model.graph[0].items ?? []
        self.cinii = CiNiiKit.shared
        self.state = .preparing

        self.searchWord = "Result"
        if let searchQuery = model.id.split(separator: "&").first(where: { $0.hasPrefix("q=") }),
           let searchWord = searchQuery[searchQuery.index(searchQuery.startIndex, offsetBy: 2)..<searchQuery.endIndex].removingPercentEncoding {
            self.searchWord = searchWord
        }

        self.configureViewModel()

        // State changes if the model has max num of items
        self.state = model.opensearchItemsPerPage == model.opensearchTotalResults ? .maxPage : .waiting
    }
}

// MARK: - Private methods
private extension ResultModel {
    /// Configure view models
    func configureViewModel() {
        self._viewModels = []
        self.results.forEach {
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

    /// Add view models with model
    func append(_ model: ArticlesModel) {
        self.results += model.graph.first?.items ?? []
        self.configureViewModel()
    }
}

// MARK: - Internal methods
extension ResultModel {
    /// Get view model with index
    func getViewModel(at index: Int) -> ResultViewModel? {
        guard index < self.viewModels.count else {
            return nil
        }
        return self.viewModels[index]
    }

    /// Request next page
    func nextPage(success: (() -> Void)? = nil, failure: ((Error) -> Void)? = nil) {
        guard self.state == .waiting, !isFiltering else { return }
        self.state = .fetching

        self.cinii.articles.nextPage(self.model, success: { [weak self] model in
            self?.append(model)
            success?()
            self?.state = .waiting
        }) { [weak self] error in
            failure?(error)
            switch error {
            case PagenationError.maxPage:
                self?.state = .maxPage
            default:
                self?.state = .waiting
            }
        }
    }

    /// Filter view models with text
    func filter(with text: String) {
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
}
