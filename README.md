# NAME

sudoku - command-line sudoku utility

# DESCRIPTION

    $ sudoku combo 6
    6
    1 5
    2 4
    1 2 3
    
Display all combinations of sudoku digits that add to the given sum. Solutions
displayed in order from shortest to longest, then in numerical order.

    $ sudoku combo 30 4
    6 7 8 9

Display combinations that add to the given sum using the specified number of digits.

    $ sudoku combo -s 6
    6
    2 4

    $ sudoku combo --sandwich 9
    2 7
    3 6
    4 5
    2 3 4

Display combinations that add to the given sum that are valid for sandwich suduko.
That is, that exclude the digits 1 and 9.


    $ sudoku combo -x 10
    2 8
    3 1 6
    3 2 5
    4 1 2 3

Display combinations where the number of digits in the combination is one of the
digits. `-x` for x-sums variant, where the number outside the puzzle shows the
total of the first `x` digits, where `x` is the first digit. The first digit of
each row is the `x`.

    $ sudoku combo --sequence 13
    6 7

Display only combinations where the digits form a sequence.
