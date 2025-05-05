max(X, Y, M) :- 
    X >= Y, 
    M = X.

max(X, Y, M) :- 
    X < Y, 
    M = Y.

///TO RUN
max(5, 10, M).
///
