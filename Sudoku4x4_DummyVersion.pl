sudoku(Grid, Result) :-
	Result = Grid,
	Grid   = [A1, A2, A3, A4,
				B1, B2, B3, B4,
				C1, C2, C3, C4,
				D1, D2, D3, D4],
	Numbers = [1,2,3,4],
	permutation([A1,A2,A3,A4], Numbers),
	permutation([B1,B2,B3,B4], Numbers),
	permutation([C1,C2,C3,C4], Numbers),
	permutation([D1,D2,D3,D4], Numbers),
	permutation([A1,B1,C1,D1], Numbers),
	permutation([A2,B2,C2,D2], Numbers),
	permutation([A3,B3,C3,D3], Numbers),
	permutation([A4,B4,C4,D4], Numbers),
	permutation([A1,A2,B1,B2], Numbers),
	permutation([A3,A4,B3,B4], Numbers),
	permutation([C1,C2,D1,D2], Numbers),
	permutation([C3,C4,D3,D4], Numbers).
	
?- sudoku([_, _, 2, 3,
			_, _, _, _,
			_, _, _, _,
			3, 4, _, _], Result)
