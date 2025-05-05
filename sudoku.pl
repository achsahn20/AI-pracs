:- use_module(library(clpfd)).

sudoku(Rows) :-
    length(Rows, 9),                     % 9 rows
    maplist(same_length(Rows), Rows),   % 9 columns
    append(Rows, Vs), Vs ins 1..9,       % Values from 1 to 9

    % Row constraints
    maplist(all_distinct, Rows),

    % Column constraints
    transpose(Rows, Columns),
    maplist(all_distinct, Columns),

    % 3x3 Square constraints
    Rows = [A,B,C,D,E,F,G,H,I],
    blocks(A,B,C),
    blocks(D,E,F),
    blocks(G,H,I),

    % Search
    label(Vs),
    maplist(portray_row, Rows).

% Define 3x3 blocks
blocks([], [], []).
blocks([A,B,C|Bs1], [D,E,F|Bs2], [G,H,I|Bs3]) :-
    all_distinct([A,B,C,D,E,F,G,H,I]),
    blocks(Bs1, Bs2, Bs3).

% Helper to print rows
portray_row(Row) :- writeln(Row).
///TO RUN
 Puzzle = [
    [5,3,_,_,7,_,_,_,_],
    [6,_,_,1,9,5,_,_,_],
    [_,9,8,_,_,_,_,6,_],
    [8,_,_,_,6,_,_,_,3],
    [4,_,_,8,_,3,_,_,1],
    [7,_,_,_,2,_,_,_,6],
    [_,6,_,_,_,_,2,8,_],
    [_,_,_,4,1,9,_,_,5],
    [_,_,_,_,8,_,_,7,9]
],
sudoku(Puzzle).
///
