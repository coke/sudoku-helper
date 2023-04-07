use Test;
use App::SudokuHelper;

plan 8;

is MAIN-handler-combo(13), chomp(q:to/EOS/), "combo, any length";
4 9
5 8
6 7
1 3 9
1 4 8
1 5 7
2 3 8
2 4 7
2 5 6
3 4 6
1 2 3 7
1 2 4 6
1 3 4 5
EOS

is MAIN-handler-combo(13, 3), chomp(q:to/EOS/), "combo, specific length";
1 3 9
1 4 8
1 5 7
2 3 8
2 4 7
2 5 6
3 4 6
EOS

is MAIN-handler-combo(13, :sequence), chomp(q:to/EOS/), "combo, sequence, any length";
6 7
EOS

is MAIN-handler-combo(9, 2, :sequence), chomp(q:to/EOS/), "combo, sequence, specific length";
4 5
EOS

is MAIN-handler-combo(13, :s), chomp(q:to/EOS/), "combo, sandwich, any length";
5 8
6 7
2 3 8
2 4 7
2 5 6
3 4 6
EOS

is MAIN-handler-combo(13, 2, :s), chomp(q:to/EOS/), "combo, sandwich, specific length";
5 8
6 7
EOS

is MAIN-handler-combo(13, :x), chomp(q:to/EOS/), "combo, x-sums, any length";
3 1 9
3 2 8
3 4 6
4 1 2 6
4 1 3 5
EOS

is MAIN-handler-combo(13, 4, :x), chomp(q:to/EOS/), "combo, x-sums, specific length";
4 1 2 6
4 1 3 5
EOS
