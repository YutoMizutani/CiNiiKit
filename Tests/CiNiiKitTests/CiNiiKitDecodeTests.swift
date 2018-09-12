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
        guard let jsonData: Data = helper.json(from: "articles") else {
            XCTFail("jsonData is nil")
            return
        }

        var model: ArticlesModel

        do {
            model = try self.decoder.decode(ArticlesModel.self, from: jsonData)
        } catch let e {
            XCTFail("Could not decode; \(e.localizedDescription)")
            return
        }

        // @context
        let context = model.context
        XCTAssertEqual(context.prism, "http://prismstandard.org/namespaces/basic/2.0/")
        XCTAssertEqual(context.rdf, "http://www.w3.org/1999/02/22-rdf-syntax-ns#")
        XCTAssertEqual(context.rdfs, "http://www.w3.org/2000/01/rdf-schema#")
        XCTAssertEqual(context.vocab, "http://purl.org/rss/1.0/")
        XCTAssertEqual(context.opensearch, "http://a9.com/-/spec/opensearch/1.1/")
        XCTAssertEqual(context.dc, "http://purl.org/dc/elements/1.1/")

        // @id
        let id = model.id
        XCTAssertEqual(id, "https://ci.nii.ac.jp/opensearch/search?count=20&format=json&q=%E8%A1%8C%E5%8B%95%E5%88%86%E6%9E%90%E5%AD%A6&start=1&REMOTE_ADDR2=150.249.192.41")

        // @graph
        let graph = model.graph[0]
        XCTAssertEqual(graph.link.id, "https://ci.nii.ac.jp/opensearch/search?count=20&format=json&q=%E8%A1%8C%E5%8B%95%E5%88%86%E6%9E%90%E5%AD%A6&start=1&REMOTE_ADDR2=150.249.192.41")
        XCTAssertEqual(graph.opensearchStartIndex, "1")
        XCTAssertEqual(graph.opensearchTotalResults, "3422")

        // @graph - items.first
        guard let items = graph.items, let item = items.first else {
            XCTFail("Could not get items")
            return
        }
        XCTAssertEqual(items.count, 20)
        XCTAssertEqual(item.prismEndingPage, "84")
        XCTAssertEqual(item.id, "https://ci.nii.ac.jp/naid/110008093161/en")
        XCTAssertEqual(item.description, "This article is a proposal for the full cooperation of the profession of &quot;psychology&quot; and &quot;social welfare&quot; for the handicapped person through the mediation of philosophy and methodology of &quot;behavior analysis. &quot; From the standpoint of &quot;radical behaviorism,&quot; which is the philosophy of &quot;behavior analysis&quot; founded by B.F. Skinner, every term or concept on handicapped person is a description of the interaction between individual and environment. Any behavioral service for those people, therefore, is a &quot;adjustment&quot; between individuals and their environments. In this context, if necessary, we must change their environments including the social systems. Behavioral approach, however, has been regarded as a procedure which changes only the client in the field of social casework. The reason of the misconception might be derived both from outside and inside of the framework of behavioral approach itself. For the full cooperation of behavior analyst and social caseworker, some new directions of method of &quot;behavioral social casework&quot; were discussed.")
        XCTAssertEqual(item.type, "item")
        XCTAssertEqual(item.rdfsSeeAlso?.id, "https://ci.nii.ac.jp/naid/110008093161.json")
        XCTAssertEqual(item.link?.id, "https://ci.nii.ac.jp/naid/110008093161/en")
        XCTAssertEqual(item.prismIssn, "0911-0232")
        XCTAssertEqual(item.prismPublicationName, "Japanese Journal of Social Welfare")
        XCTAssertEqual(item.prismStartingPage, "64")
        XCTAssertEqual(item.dcPublisher, "Japanese Society for the Study of Social Welfare (JSSSW)")
        XCTAssertEqual(item.title, "Behavior Analysis as a Methodology of Social Casework : New Relation between Psychology and Social Welfare")
        XCTAssertEqual(item.dcCreator.map { $0.map { $0.value } }, ["Mochizuki Akira"])
        XCTAssertEqual(item.dcDate, "2018-07-20")
        XCTAssertEqual(item.prismVolume, "30")
        XCTAssertEqual(item.prismPublicationDate, "2018-07-20")
        XCTAssertEqual(item.prismNumber, "100000000") // "2"
    }
}
