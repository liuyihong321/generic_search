from search import *
import heapq

class MapGraph(Graph):
    """This is an abstract class for graphs. It cannot be directly
    instantiated. You should define a subclass of this class
    (representing a particular problem) and implement the expected
    methods."""
    def __init__(self, string):
        string_list = string.split('\n')
        self.map_list = []
        for x in string_list:
            self.map_list.append(list(x))
        self.nodes = set()
        self.start_node = set()
        self.goal_node = set()
        area = range(len(self.map_list))
        for row_index in area:
            row = self.map_list[row_index]
            for column in range(len(row)):
                if row[column] == " ":
                    self.nodes.add((row_index, column))                   
                if row[column] == "S":
                    self.nodes.add((row_index, column))
                    self.start_node.add((row_index, column))
                if row[column] == "G":
                    self.nodes.add((row_index, column))
                    self.goal_node = ((row_index, column))
             


    def is_goal(self, node):
        """Returns true if the given node is a goal state."""
        return node == self.goal_node

    def starting_nodes(self):
        """Returns a sequence of starting nodes. Often there is only one
        starting node but even then the function returns a sequence
        with one element. It can be implemented as an iterator.

        """
        return self.start_node

    def outgoing_arcs(self, tail_node):
        """Given a node it returns a sequence of arcs (Arc objects)
        which correspond to the actions that can be taken in that
        state (node)."""
        row, column = tail_node
        arcs = []
        dictionary = [('N' , -1, 0),
             ('NE', -1, 1),
             ('E' ,  0, 1),
             ('SE',  1, 1),
             ('S' ,  1, 0),
             ('SW',  1, -1),
             ('W' ,  0, -1),
             ('NW', -1, -1)]

        for word, x, y in dictionary:
            head = (row + x, column + y)
            if head in self.nodes:
                arcs.append(Arc(tail_node, head, word, 1))

        return arcs

    def estimated_cost_to_goal(self, node):
        """Return the estimated cost to a goal node from the given
        state. This function is usually implemented when there is a
        single goal state. The function is used as a heuristic in
        search. The implementation should make sure that the heuristic
        meets the required criteria for heuristics."""

        x, y = node
        goal_x, goal_y = self.goal_node
        cost = max(abs(x - goal_x), abs(y - goal_y))
        return cost


class AStarFrontier(Frontier):
    """This is an abstract class for frontier classes. It outlines the
    methods that must be implemented by a concrete subclass. Concrete
    subclasses will determine the search strategy.

    """
    def __init__(self, map_graph):
        self.map_graph = map_graph
        self.heap = []
        self.visited = set()
        self.count = 0


    def add(self, path):
        cost = sum(x.cost for x in path)
        cost += self.map_graph.estimated_cost_to_goal(path[-1].head)
        if path[-1].head not in self.visited:
            heapq.heappush(self.heap, (cost, self.count, path))
            self.count += 1


    def __iter__(self):
        """Returns a generator. The generator selects and removes a path from
        the frontier and returns it. A path is a sequence (tuple) of
        Arc objects. Override this method according to the desired
        search strategy.

        """
        
        while self.heap:
            path = heapq.heappop(self.heap)[2]
            self.visited.add(path[-1].head)
            yield path
            
            
class LCFSFrontier(Frontier):
    """This is an abstract class for frontier classes. It outlines the
    methods that must be implemented by a concrete subclass. Concrete
    subclasses will determine the search strategy.

    """
    def __init__(self):
        self.heap = []
        self.visited = set()
        self.count = 0

    def add(self, path):
        """Adds a new path to the frontier. A path is a sequence (tuple) of
        Arc objects. You should override this method.

        """
        cost = 0
        for x in path:
            cost += x.cost
            
        if path[-1].head not in self.visited:
            heapq.heappush(self.heap, (cost, self.count, path))
            self.count += 1


    def __iter__(self):
        """Returns a generator. The generator selects and removes a path from
        the frontier and returns it. A path is a sequence (tuple) of
        Arc objects. Override this method according to the desired
        search strategy.

        """
        
        while self.heap:
            path = heapq.heappop(self.heap)[2]
            self.visited.add(path[-1].head)
            yield path
            
def print_map(map_graph, frontier, solution):
    lists = map_graph.map_list
    if solution != None:
        output_nodes = {x.tail for x in solution}
    else:
        output_nodes = set()
    area = range(len(lists))
    for row_index in area:
        row = lists[row_index]
        for column in range(len(row)):
            if lists[row_index][column] == " ":
                if (row_index, column) in output_nodes:
                    lists[row_index][column] = "*"
                elif (row_index, column) in frontier.visited:
                    lists[row_index][column] = "."
    
    output = []
    for x in lists:
        output.append(''.join(x))
    for x in output:
        print(x)

        
        
map_str = """\
+---------------+
|    G          |
|XXXXXXXXXXXX   |
|           X   |
|  XXXXXX   X   |
|  X S  X   X   |
|  X        X   |
|  XXXXXXXXXX   |
|               |
+---------------+
"""

map_graph = MapGraph(map_str)
frontier = AStarFrontier(map_graph)
solution = next(generic_search(map_graph, frontier), None)
print_map(map_graph, frontier, solution)