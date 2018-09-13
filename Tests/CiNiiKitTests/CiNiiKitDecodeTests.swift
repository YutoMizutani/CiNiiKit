//
//  CiNiiKitDecodeTests.swift
//  CiNiiKit iOSTests
//
//  Created by Yuto Mizutani on 2018/09/12.
//

import XCTest
@testable import CiNiiKit

extension CiNiiKitTests {
    /// articles.json to ArticlesModel
    func testDecodeArticle() {
        let jsonData = helper.json(from: "articles")
        XCTAssertNotNil(jsonData)
        guard let data = jsonData else { return }

        typealias Model = ArticlesModel
        let model = try? self.decoder.decode(Model.self, from: data)
        XCTAssertNotNil(model)

        // @context
        let context = model?.context
        XCTAssertNotNil(context)
        XCTAssertEqual(context?.prism, "http://prismstandard.org/namespaces/basic/2.0/")
        XCTAssertEqual(context?.rdf, "http://www.w3.org/1999/02/22-rdf-syntax-ns#")
        XCTAssertEqual(context?.rdfs, "http://www.w3.org/2000/01/rdf-schema#")
        XCTAssertEqual(context?.vocab, "http://purl.org/rss/1.0/")
        XCTAssertEqual(context?.opensearch, "http://a9.com/-/spec/opensearch/1.1/")
        XCTAssertEqual(context?.dc, "http://purl.org/dc/elements/1.1/")

        // @id
        let id = model?.id
        XCTAssertEqual(id, "https://ci.nii.ac.jp/opensearch/search?count=20&format=json&q=%E8%A1%8C%E5%8B%95%E5%88%86%E6%9E%90%E5%AD%A6&start=1&REMOTE_ADDR2=150.249.192.41")

        // @graph
        let graph = model?.graph.first
        XCTAssertNotNil(graph)
        XCTAssertEqual(graph?.link.id, "https://ci.nii.ac.jp/opensearch/search?count=20&format=json&q=%E8%A1%8C%E5%8B%95%E5%88%86%E6%9E%90%E5%AD%A6&start=1&REMOTE_ADDR2=150.249.192.41")
        XCTAssertEqual(graph?.opensearchStartIndex, "1")
        XCTAssertEqual(graph?.opensearchTotalResults, "3422")

        // @graph - items
        let items = graph?.items
        XCTAssertNotNil(items)
        XCTAssertEqual(items?.count, 20)
        // @graph - items[0]
        let item = items?.first
        XCTAssertNotNil(item)
        XCTAssertEqual(item?.prismEndingPage, "84")
        XCTAssertEqual(item?.id, "https://ci.nii.ac.jp/naid/110008093161/en")
        XCTAssertEqual(item?.description, "This article is a proposal for the full cooperation of the profession of &quot;psychology&quot; and &quot;social welfare&quot; for the handicapped person through the mediation of philosophy and methodology of &quot;behavior analysis. &quot; From the standpoint of &quot;radical behaviorism,&quot; which is the philosophy of &quot;behavior analysis&quot; founded by B.F. Skinner, every term or concept on handicapped person is a description of the interaction between individual and environment. Any behavioral service for those people, therefore, is a &quot;adjustment&quot; between individuals and their environments. In this context, if necessary, we must change their environments including the social systems. Behavioral approach, however, has been regarded as a procedure which changes only the client in the field of social casework. The reason of the misconception might be derived both from outside and inside of the framework of behavioral approach itself. For the full cooperation of behavior analyst and social caseworker, some new directions of method of &quot;behavioral social casework&quot; were discussed.")
        XCTAssertEqual(item?.type, "item")
        XCTAssertEqual(item?.rdfsSeeAlso?.id, "https://ci.nii.ac.jp/naid/110008093161.json")
        XCTAssertEqual(item?.link?.id, "https://ci.nii.ac.jp/naid/110008093161/en")
        XCTAssertEqual(item?.prismIssn, "0911-0232")
        XCTAssertEqual(item?.prismPublicationName, "Japanese Journal of Social Welfare")
        XCTAssertEqual(item?.prismStartingPage, "64")
        XCTAssertEqual(item?.dcPublisher, "Japanese Society for the Study of Social Welfare (JSSSW)")
        XCTAssertEqual(item?.title, "Behavior Analysis as a Methodology of Social Casework : New Relation between Psychology and Social Welfare")
        XCTAssertEqual(item?.dcCreator?.map { $0.value }, ["Mochizuki Akira"])
        XCTAssertEqual(item?.dcDate, "2018-07-20")
        XCTAssertEqual(item?.prismVolume, "30")
        XCTAssertEqual(item?.prismPublicationDate, "2018-07-20")
        XCTAssertEqual(item?.prismNumber, "2")
    }

    /// books.json to BooksModel
    func testDecodeBooks() {
        let jsonData = helper.json(from: "books")
        XCTAssertNotNil(jsonData)
        guard let data = jsonData else { return }

        typealias Model = BooksModel
        let model = try? self.decoder.decode(Model.self, from: data)
        XCTAssertNotNil(model)

        // @context
        let context = model?.context
        XCTAssertNotNil(context)
        XCTAssertEqual(context?.cinii, "http://ci.nii.ac.jp/ns/1.0/")
        XCTAssertEqual(context?.rdf, "http://www.w3.org/1999/02/22-rdf-syntax-ns#")
        XCTAssertEqual(context?.dcTerms, "http://purl.org/dc/terms/")
        XCTAssertEqual(context?.rdfs, "http://www.w3.org/2000/01/rdf-schema#")
        XCTAssertEqual(context?.prism, "http://prismstandard.org/namespaces/basic/2.0/")
        XCTAssertEqual(context?.vocab, "http://purl.org/rss/1.0/")
        XCTAssertEqual(context?.opensearch, "http://a9.com/-/spec/opensearch/1.1/")
        XCTAssertEqual(context?.dc, "http://purl.org/dc/elements/1.1/")

        // @id
        let id = model?.id
        XCTAssertEqual(id, "http://ci.nii.ac.jp/books/opensearch/search?q=%E8%A1%8C%E5%8B%95%E5%88%86%E6%9E%90%E5%AD%A6&count=20&format=json&start=1")

        // @graph
        let graph = model?.graph.first
        XCTAssertNotNil(graph)
        XCTAssertEqual(graph?.link.id, "http://ci.nii.ac.jp/books/opensearch/search?q=%E8%A1%8C%E5%8B%95%E5%88%86%E6%9E%90%E5%AD%A6&count=20&format=json&start=1")
        XCTAssertEqual(graph?.opensearchTotalResults, "56")
        XCTAssertEqual(graph?.opensearchStartIndex, "0")
        XCTAssertEqual(graph?.opensearchItemsPerPage, "20")
        XCTAssertEqual(graph?.description, "CiNii Books OpenSearch - 行動分析学 20 1")
        XCTAssertEqual(graph?.title, "CiNii Books OpenSearch - 行動分析学 20 1")
        XCTAssertEqual(graph?.type, "channel")
        XCTAssertEqual(graph?.dcDate, "2018-09-12T20:36:15+09:00")

        // @graph - items
        let items = graph?.items
        XCTAssertNotNil(items)
        XCTAssertEqual(items?.count, 20)
        // @graph - items[0]
        let item = items?.first
        XCTAssertNotNil(item)
        XCTAssertEqual(item?.link?.id, "http://ci.nii.ac.jp/ncid/AN10150936")
        XCTAssertEqual(item?.ciniiOwnerCount, "54")
        XCTAssertEqual(item?.id, "http://ci.nii.ac.jp/ncid/AN10150936")
        XCTAssertEqual(item?.dcPublisher, ["日本行動分析学会"])
        XCTAssertEqual(item?.dcTermsHasPart?.map { $0.id }, ["urn:issn:09138013"])
        XCTAssertEqual(item?.title, "行動分析学研究")
        XCTAssertEqual(item?.dcCreator, "日本行動分析学会")
        XCTAssertEqual(item?.type, "item")
        XCTAssertEqual(item?.rdfsSeeAlso?.id, "http://ci.nii.ac.jp/ncid/AN10150936.json")
        XCTAssertEqual(item?.prismPublicationDate, "1987")
        XCTAssertEqual(item?.dcDate, "1987")
    }

    /// dissertations.json to DissertationsModel
    func testDecodeDissertations() {
        let jsonData = helper.json(from: "dissertations")
        XCTAssertNotNil(jsonData)
        guard let data = jsonData else { return }

        typealias Model = DissertationsModel
        let model = try? self.decoder.decode(Model.self, from: data)
        XCTAssertNotNil(model)

        // @context
        let context = model?.context
        XCTAssertNotNil(context)
        XCTAssertEqual(context?.prism, "http://prismstandard.org/namespaces/basic/2.0/")
        XCTAssertEqual(context?.rdf, "http://www.w3.org/1999/02/22-rdf-syntax-ns#")
        XCTAssertEqual(context?.rdfs,  "http://www.w3.org/2000/01/rdf-schema#")
        XCTAssertEqual(context?.vocab, "http://purl.org/rss/1.0/")
        XCTAssertEqual(context?.opensearch, "http://a9.com/-/spec/opensearch/1.1/")
        XCTAssertEqual(context?.dc, "http://purl.org/dc/elements/1.1/")

        // @id
        let id = model?.id
        XCTAssertEqual(id, "http://ci.nii.ac.jp/d/search?q=%E6%9D%A1%E4%BB%B6%E3%81%A5%E3%81%91&count=20&format=json&start=1")

        // @graph
        let graph = model?.graph.first
        XCTAssertNotNil(graph)
        XCTAssertEqual(graph?.link.id, "http://ci.nii.ac.jp/d/search?q=%E6%9D%A1%E4%BB%B6%E3%81%A5%E3%81%91&count=20&format=json&start=1")
        XCTAssertEqual(graph?.opensearchStartIndex, "0")
        XCTAssertEqual(graph?.opensearchTotalResults, "46")

        // @graph - items
        let items = graph?.items
        XCTAssertNotNil(items)
        XCTAssertEqual(items?.count, 20)
        // @graph - items[0]
        let item = items?.first
        XCTAssertNotNil(item)
        XCTAssertEqual(item?.ndlDissertationNumber, "甲第985号")
        XCTAssertEqual(item?.link?.id, "http://ci.nii.ac.jp/naid/500000978699")
        XCTAssertEqual(item?.id, "http://ci.nii.ac.jp/naid/500000978699#article")
        XCTAssertEqual(item?.dcPublisher, "東海大学")
        let dcSourceOptional = item?.dcSource?.map { [$0.id, $0.dcTitle] }
        XCTAssertNotNil(dcSourceOptional)
        guard let dcSource = dcSourceOptional else { return }
        XCTAssertEqual(dcSource, [
            ["http://dl.ndl.go.jp/info:ndljp/pid/10192282", "NDLデジタルコレクション"],
            ["https://opac.time.u-tokai.ac.jp/webopac/TD00000195", "東海大学"]
            ]
        )
        XCTAssertEqual(item?.title, "モデル動物における連合学習神経基盤の研究")
        XCTAssertEqual(item?.dcCreator?.map { $0.value }, ["滝上, 慧"])
        XCTAssertEqual(item?.type, "item")
        XCTAssertEqual(item?.rdfsSeeAlso?.id, "http://ci.nii.ac.jp/naid/500000978699.json")
        XCTAssertEqual(item?.ndlDegreeName, "博士(理学)")
        XCTAssertEqual(item?.dcDate, "2016-03-24")
    }
}
