//
//  swiftgraphTests.swift
//  swiftgraphTests
//
//  Created by Clay Heaton on 8/4/15.
//  Copyright © 2015 Clay Heaton. All rights reserved.
//

import XCTest
@testable import swiftgraph

class swiftgraphTests: XCTestCase {
    
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testKarateNodeAndEdgesCount() {
        let g = createKarateGraph()
        XCTAssertEqual(g.nodeCount(), 34)
        XCTAssertEqual(g.edgeCount(), 77)
        
    }
    
    func testShortestPath() {
        let g = createKarateGraph()
        let pathArray:Array<CHNode> = g.breadthFirstSearchPathFrom("1", toNodeID:"34")
        print("\nSHORTEST PATH")
        for n in pathArray {
            print(n.nodeid)
        }
        print("END SHORTEST PATH \n")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    func createKarateGraph() -> CHGraph {
        let g = CHGraph(graphtype: GraphType.Undirected)
        
        // Creates Zachary's Karate Club https://networkdata.ics.uci.edu/data.php?id=105
        let n1 = g.addNode(["nodeid":"1"])
        let n2 = g.addNode(["nodeid":"2"])
        let n3 = g.addNode(["nodeid":"3"])
        let n4 = g.addNode(["nodeid":"4"])
        let n5 = g.addNode(["nodeid":"5"])
        let n6 = g.addNode(["nodeid":"6"])
        let n7 = g.addNode(["nodeid":"7"])
        let n8 = g.addNode(["nodeid":"8"])
        let n9 = g.addNode(["nodeid":"9"])
        let n10 = g.addNode(["nodeid":"10"])
        let n11 = g.addNode(["nodeid":"11"])
        let n12 = g.addNode(["nodeid":"12"])
        let n13 = g.addNode(["nodeid":"13"])
        let n14 = g.addNode(["nodeid":"14"])
        let n15 = g.addNode(["nodeid":"15"])
        let n16 = g.addNode(["nodeid":"16"])
        let n17 = g.addNode(["nodeid":"17"])
        let n18 = g.addNode(["nodeid":"18"])
        let n19 = g.addNode(["nodeid":"19"])
        let n20 = g.addNode(["nodeid":"20"])
        let n21 = g.addNode(["nodeid":"21"])
        let n22 = g.addNode(["nodeid":"22"])
        let n23 = g.addNode(["nodeid":"23"])
        let n24 = g.addNode(["nodeid":"24"])
        let n25 = g.addNode(["nodeid":"25"])
        let n26 = g.addNode(["nodeid":"26"])
        let n27 = g.addNode(["nodeid":"27"])
        let n28 = g.addNode(["nodeid":"28"])
        let n29 = g.addNode(["nodeid":"29"])
        let n30 = g.addNode(["nodeid":"30"])
        let n31 = g.addNode(["nodeid":"31"])
        let n32 = g.addNode(["nodeid":"32"])
        let n33 = g.addNode(["nodeid":"33"])
        let n34 = g.addNode(["nodeid":"34"])
        
        g.addEdge(source: n2, target: n1)
        g.addEdge(source: n3, target: n1)
        g.addEdge(source: n3, target: n2)
        g.addEdge(source: n4, target: n1)
        g.addEdge(source: n4, target: n2)
        g.addEdge(source: n4, target: n3)
        g.addEdge(source: n5, target: n1)
        g.addEdge(source: n6, target: n1)
        g.addEdge(source: n7, target: n1)
        g.addEdge(source: n7, target: n5)
        g.addEdge(source: n7, target: n6)
        g.addEdge(source: n8, target: n1)
        g.addEdge(source: n8, target: n2)
        g.addEdge(source: n8, target: n3)
        g.addEdge(source: n8, target: n4)
        g.addEdge(source: n9, target: n1)
        g.addEdge(source: n9, target: n3)
        g.addEdge(source: n10, target: n3)
        g.addEdge(source: n11, target: n1)
        g.addEdge(source: n11, target: n5)
        g.addEdge(source: n11, target: n6)
        g.addEdge(source: n12, target: n1)
        g.addEdge(source: n13, target: n1)
        g.addEdge(source: n13, target: n4)
        g.addEdge(source: n14, target: n1)
        g.addEdge(source: n14, target: n2)
        g.addEdge(source: n14, target: n3)
        g.addEdge(source: n14, target: n4)
        g.addEdge(source: n17, target: n6)
        g.addEdge(source: n17, target: n7)
        g.addEdge(source: n18, target: n1)
        g.addEdge(source: n18, target: n2)
        g.addEdge(source: n20, target: n1)
        g.addEdge(source: n20, target: n2)
        g.addEdge(source: n22, target: n1)
        g.addEdge(source: n22, target: n2)
        g.addEdge(source: n26, target: n24)
        g.addEdge(source: n26, target: n25)
        g.addEdge(source: n28, target: n3)
        g.addEdge(source: n28, target: n24)
        g.addEdge(source: n28, target: n25)
        g.addEdge(source: n29, target: n3)
        g.addEdge(source: n30, target: n24)
        g.addEdge(source: n30, target: n27)
        g.addEdge(source: n31, target: n2)
        g.addEdge(source: n31, target: n9)
        g.addEdge(source: n32, target: n25)
        g.addEdge(source: n32, target: n26)
        g.addEdge(source: n32, target: n29)
        g.addEdge(source: n33, target: n3)
        g.addEdge(source: n33, target: n9)
        g.addEdge(source: n33, target: n15)
        g.addEdge(source: n33, target: n16)
        g.addEdge(source: n33, target: n19)
        g.addEdge(source: n33, target: n21)
        g.addEdge(source: n33, target: n23)
        g.addEdge(source: n33, target: n24)
        g.addEdge(source: n33, target: n30)
        g.addEdge(source: n33, target: n31)
        g.addEdge(source: n33, target: n32)
        g.addEdge(source: n34, target: n9)
        g.addEdge(source: n34, target: n10)
        g.addEdge(source: n34, target: n14)
        g.addEdge(source: n34, target: n15)
        g.addEdge(source: n34, target: n16)
        g.addEdge(source: n34, target: n19)
        g.addEdge(source: n34, target: n20)
        g.addEdge(source: n34, target: n21)
        g.addEdge(source: n34, target: n23)
        g.addEdge(source: n34, target: n24)
        g.addEdge(source: n34, target: n27)
        g.addEdge(source: n34, target: n28)
        g.addEdge(source: n34, target: n29)
        g.addEdge(source: n34, target: n30)
        g.addEdge(source: n34, target: n31)
        g.addEdge(source: n34, target: n32)
        g.addEdge(source: n34, target: n33)
        
        return g
    }
    
}
