/** <module> Prolog NxN sudoku solver

Created as part of the course 'Programming Languages and Formal Methods' at University of Applied Sciences Rapperswil.

Uses <a href="http://www.swi-prolog.org/pldoc/doc_for?object=section(%27packages/pldoc.html%27)">SWI-Prolog Source Documentation Version 2</a> for documentation.

@author Jonas Wälter, Pascal Birchler
@license tbd
@date 23/10/2016
@version 0.0.1
*/

/**
 * Attempts to solve a sudoku puzzle.
 *
 * The input needs to be in the following format:
 *
 * [
 *   [9,_,3, 1,7,4, 2,5,_],
 *   [_,7,_, 3,2,5, 6,4,9],
 *   [2,5,4, 6,_,9, _,3,1],
 *
 *   [_,2,1, 4,3,_, 5,_,6],
 *   [4,9,_, 8,_,2, 3,1,_],
 *   [_,3,_, 9,6,_, 8,2,_],
 *
 *   [5,8,9, 7,1,3, 4,6,2],
 *   [_,1,7, 2,_,6, _,8,5],
 *   [6,4,2, 5,9,8, 1,7,3]
 * ]
 *
 * @arg Puzzle The puzzle to solve.
 * @arg Solution Holds the eventual solution of the puzzle.
 */
sudoku(Puzzle, Solution) :-
    Solution = Puzzle,
    maplist(isValid, Solution),
    flip(Solution, L2), maplist(isValid, L2),
    boxes(Solution, L3), maplist(isValid, L3),
    !.

/**
 * Flips a list.
 */
flip([[]|_], []) :-
    !.
flip(List, [Head|Tail]) :-
    getFirst(List, Head, B),
    flip(B, Tail).

/**
 * Picks the first item.
 */
getFirst([], [], []).
getFirst([[Head|Tail]|R],[Head|Heads],[Tail|Tails]) :-
    getFirst(R,Heads,Tails).

/**
 * Maps the input list to a new list according to the 3x3 boxes.
 */
boxes([
        [A1,A2,A3,B1,B2,B3,C1,C2,C3],
        [A4,A5,A6,B4,B5,B6,C4,C5,C6],
        [A7,A8,A9,B7,B8,B9,C7,C8,C9],
        [D1,D2,D3,E1,E2,E3,F1,F2,F3],
        [D4,D5,D6,E4,E5,E6,F4,F5,F6],
        [D7,D8,D9,E7,E8,E9,F7,F8,F9],
        [G1,G2,G3,H1,H2,H3,I1,I2,I3],
        [G4,G5,G6,H4,H5,H6,I4,I5,I6],
        [G7,G8,G9,H7,H8,H9,I7,I8,I9]
    ],[
        [A1,A2,A3,A4,A5,A6,A7,A8,A9],
        [B1,B2,B3,B4,B5,B6,B7,B8,B9],
        [C1,C2,C3,C4,C5,C6,C7,C8,C9],
        [D1,D2,D3,D4,D5,D6,D7,D8,D9],
        [E1,E2,E3,E4,E5,E6,E7,E8,E9],
        [F1,F2,F3,F4,F5,F6,F7,F8,F9],
        [G1,G2,G3,G4,G5,G6,G7,G8,G9],
        [H1,H2,H3,H4,H5,H6,H7,H8,H9],
        [I1,I2,I3,I4,I5,I6,I7,I8,I9]
    ]).

/**
 * Checks whether each value in the provided list is valid.
 *
 * This is being done by verifying that L is a valid permutation of Numbers,
 * whereas Numbers is the list of allowed numbers in the Sudoku, e.g. [1,2,3,4,5,6,7,8,9].
 *
 * @arg L The list to check.
 */
isValid(L) :-
    length(L, X),
    numlist(1,X, Numbers),
    permutation(L, Numbers).
