hill_climb(Node, Goal) :- 
    hill_climb_util(Node, Goal, [Node]).

hill_climb_util(Node, Node, Path) :- 
    write('Path = '), write(Path), nl.

hill_climb_util(Current, Goal, Visited) :-
    findall(Next, (edge(Current, Next), \+ member(Next, Visited)), Neighbors),
    sort_nodes(Neighbors, Sorted),
    member(NextNode, Sorted),
    hill_climb_util(NextNode, Goal, [NextNode | Visited]).

% Example graph
edge(a, b). edge(a, c).
edge(b, d). edge(c, e). edge(d, f).
value(a, 5). value(b, 4). value(c, 3).
value(d, 2). value(e, 1). value(f, 0).

sort_nodes(Nodes, Sorted) :-
    map_list_to_pairs(value, Nodes, Pairs),
    keysort(Pairs, SortedPairs),
    pairs_values(SortedPairs, Sorted).

    /// TO RUN
    hill_climb(a, f).
    ///
