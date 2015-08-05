//
//  CHGraph.swift
//  swiftgraph
//
//  Created by Clay Heaton on 8/4/15.
//  Copyright © 2015 Clay Heaton. All rights reserved.
//

import Foundation

/**
GraphType is used to set whether a CHGraph is Undireted, Directed, or MultiDirected.
*/
enum GraphType: Int {
    case Undirected = 0
    case Directed   = 1
    case MultiDirected = 2
}

/**
The graph class used to perform network analysis.

- Parameter graphtype: Set to an allowed value of the GraphType enum.
*/
public class CHGraph {
    let graphtype: GraphType
    var nodes: [String:CHNode]
    var edges: [String:CHEdge]
    
    init(graphtype:GraphType){
        self.graphtype = graphtype
        self.nodes     = [String:CHNode]()
        self.edges     = [String:CHEdge]()
    }
    
    func nodeCount() -> Int {
        return self.nodes.keys.count
    }
    
    func edgeCount() -> Int {
        return self.edges.keys.count
    }
    
    func breadthFirstSearchPathFrom(fromNode:CHNode, toNode:CHNode) -> Array<CHNode> {
        
        let frontier   = Queue<CHNode>()
        var came_from  = [String:String]()
        var path_found = false
        var path       = Array<CHNode>()
        
        frontier.enqueue(fromNode)
        came_from[fromNode.nodeid] = "_BFSEND_"
        
        
        while let currentNode = frontier.dequeue() {
            
            for neighborKey in currentNode.neighbors.keys {
                let nextNode = self.nodes[neighborKey]!

                // Early exit
                if nextNode == toNode {
                    path_found = true
                    path.append(nextNode)
                    path.append(currentNode)
                    var workingNode = currentNode
                    while came_from[workingNode.nodeid] != "_BFSEND_" {
                        workingNode = self.nodes[came_from[workingNode.nodeid]!]!
                        path.append(workingNode)
                    }
                    return path.reverse()
                }
                
                if path_found == false && came_from.keys.array.contains(nextNode.nodeid) {
                    continue
                } else {
                    frontier.enqueue(nextNode)
                    came_from[nextNode.nodeid] = currentNode.nodeid
                }
            }
        }
        
        if path_found == false {
            return Array<CHNode>()
        }
        
    }
    
    /**
    This is a convenience method to allow searching for shortest paths using node IDs.
    */
    func breadthFirstSearchPathFrom(fromNodeID:String, toNodeID:String) -> Array<CHNode> {
        return breadthFirstSearchPathFrom(self.nodes[fromNodeID]!, toNode: self.nodes[toNodeID]!)
    }
    
    /**
    Method to add a node base on properties -- for a CHNode object that does not yet exist.
    
    - Parameter properties: a `[String:Any]` dictionary with properties describing the node. The `nodeid` is set if the `properties` dictionary contains the key `nodeid`.
    - Returns: `CHNode`
    */
    func addNode(properties:[String:Any]=[:]) -> CHNode {
        let newNode: CHNode = CHNode(properties: properties)
        self.nodes[newNode.properties["nodeid"] as! String] = newNode
        return newNode
    }
    
    /**
    Method to add a node that previously was created.
    - Parameter node: The node to add to the graph.
    - Returns: `CHNode`
    */
    func addNode(node:CHNode) -> CHNode {
        let nodeNotInGraph = self.nodes[node.nodeid] == nil
        if nodeNotInGraph {
            self.nodes[node.nodeid] = node
        } else {
            assert(true, "Node already exists in the graph!")
        }
        return node
    }
    
    /**
    Method to add an edge between two existing `CHNode` objects. 
    - Parameter fromNode: The source `CHNode` for the edge.
    - Parameter toNode: The destination `CHNode` for the edge.
    - Parameter properties: Characteristics of the `CHEdge` you are creating.
    - Returns: `CHEdge`
    */
    func addEdge(source source:CHNode, target:CHNode, properties:[String:Any]=[:]) -> CHEdge {
        let edge = CHEdge(source: source, target: target, properties:properties)
        
        source.neighbors[target.nodeid] = edge
        
        if self.graphtype == GraphType.Undirected {
            // Reverse relationship
            target.neighbors[source.nodeid] = edge
        }
        
        // Keep track of the edge
        self.edges[edge.edgeid] = edge
        
        return edge
    }
}

/**
Function to allow CHNode to conform to the Equatable protocol
*/
public func ==(lhs: CHNode, rhs: CHNode) -> Bool {
    return lhs === rhs
}

public class CHNode : Equatable {
    var properties:[String:Any]
    let nodeid:String
    var neighbors:[String:CHEdge]
    
    init(properties:[String:Any] = [:]){
        // Does the properties contain a nodeid?
        let idMissing = properties["nodeid"] == nil
        
        if idMissing {
            // Create a unique ID for the node
            self.nodeid = NSUUID().UUIDString
        } else {
            self.nodeid = properties["nodeid"] as! String
        }
        
        // Initialize the other instance variables
        self.properties = properties
        self.neighbors  = [String:CHEdge]()
    }
    
    subscript(infokey: String) -> Any? {
        get {
            return self.properties[infokey];
        }
        set(newValue) {
            if infokey == "nodeid" {
                assert(true, "You cannot change a nodeid after it is initially set.")
            }
            self.properties[infokey] = newValue
        }
    }
    
}

public class CHEdge {
    var properties:[String:Any]
    let edgeid:String // Necessary?
    let node1:CHNode
    let node2:CHNode
    
    init(source:CHNode, target:CHNode, properties:[String:Any] = ["weight":0.0]){
        self.node1 = source
        self.node2 = target
        
        let weightMissing = properties["weight"] == nil
        self.properties = properties
        
        if weightMissing {
            self.properties["weight"] = 0
        }
        
        let idMissing = properties["edgeid"] == nil
        
        if idMissing {
            self.edgeid = NSUUID().UUIDString
        } else {
            self.edgeid = properties["edgeid"] as! String
        }
    }
    
    subscript(infokey: String) -> Any? {
        get {
            return self.properties[infokey];
        }
        set(newValue) {
            if infokey == "edgeid" {
                assert(true, "You cannot change an edge ID after it is set.")
            }
            self.properties[infokey] = newValue
        }
    }
    
    func setWeight(weight:Float){
        self.properties["weight"] = weight
    }
    
    func weight() -> Float {
        return self.properties["weight"] as! Float
    }
    
}
