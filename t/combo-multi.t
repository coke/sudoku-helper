use Test;
use App::SudokuHelper;

plan 3;

is MAIN-handler-combo("3,4,5"), chomp(q:to/EOS/), "multi combo, any length";
3
4
5
1 2
1 3
1 4
2 3
EOS

is MAIN-handler-combo("17,18", 5), chomp(q:to/EOS/), "combo, specific length";
1 2 3 4 7
1 2 3 4 8
1 2 3 5 6
1 2 3 5 7
1 2 4 5 6
EOS

is MAIN-handler-combo("5,6,7,8,9,18"), chomp(q:to/EOS/), "big combo";
5
6
7
8
9
1 4
1 5
1 6
1 7
1 8
2 3
2 4
2 5
2 6
2 7
3 4
3 5
3 6
4 5
1 2 3
1 2 4
1 2 5
1 2 6
1 3 4
1 3 5
1 8 9
2 3 4
2 7 9
3 6 9
3 7 8
4 5 9
4 6 8
5 6 7
1 2 6 9
1 2 7 8
1 3 5 9
1 3 6 8
1 4 5 8
1 4 6 7
2 3 4 9
2 3 5 8
2 3 6 7
2 4 5 7
3 4 5 6
1 2 3 4 8
1 2 3 5 7
1 2 4 5 6
EOS
