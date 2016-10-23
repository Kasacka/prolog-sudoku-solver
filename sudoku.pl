/** <module> Prolog NxN sudoku solver

Created as part of the course 'Programming Languages and Formal Methods' at University of Applied Sciences Rapperswil.

Uses <a href="http://www.swi-prolog.org/pldoc/doc_for?object=section(%27packages/pldoc.html%27)">SWI-Prolog Source Documentation Version 2</a> for documentation.

@author Jonas Wälter, Pascal Birchler
@license tbd
@date 23/10/2016
@version 0.0.1
*/

/**
 * Returns a list of numbers allowed in a given grid.
 *
 * If it is a 4x4 grid, this returns [1,2,3,4].
 */
numbers(Grid, L) :-
    length(Grid, X),
    Y is round(sqrt(X)),
    numlist(1,Y, L).
