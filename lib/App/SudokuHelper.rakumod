unit class App::SudokuHelper;

# $sum - total we're trying to get to
# $count - if present, limit to entries with that many components
# $n - if present, skip those numbers
# $sandwich - if present, skip 1 and 9
# :x - sequence must contain the number of digits present as a digit.

our proto MAIN-handler-combo(|) {*}

our multi sub MAIN-handler-combo(Int $sum, Int $count?, Str :$n is copy = "", Bool :s(:$sandwich)=False, Bool :$sequence, Bool :$x=False) is export  {
    my @counts = $count ?? [$count] !! 1..9;

    my @digits = (1..9).grep({ not $n.comb.grep($_)});
    if $sandwich {
        @digits = @digits[1..*-2];
    }

    my @retvals;

    for @counts -> $length {
        # need a copy for -x work below
        for @digits.combinations($length) -> $combo is copy {
            next unless $combo.sum == $sum;
            if $sequence.DEFINITE {
                if $sequence {
                    next unless ?$combo.rotor(2 => -1).map(-> ($a, $b) { $b - $a == 1 }).all
                } else  {
                    next if     ?$combo.rotor(2 => -1).map(-> ($a, $b) { $b - $a == 1 }).all
                }
            }
            if $x {
                my $size = $combo.elems;
                my $pos = $combo.first($size, :k);
                next unless $pos.DEFINITE;
                if $pos > 0 {
                    # Can't splice a list.
                    my $c = $combo.Array;
                    $c.splice($pos, 1);
                    $c.unshift: $size;
                    $combo = $c.List;
                }
            }
            @retvals.push: $combo.join(' ');
        }
    }
    return @retvals.join("\n");
}

# "Cheat" and take the processed result of the individual calls, unprocess them, sort them, re-process
our multi sub MAIN-handler-combo(Str $sum, Int $count?, Str :$n is copy = "", Bool :s(:$sandwich)=False, Bool :$sequence, Bool :$x=False) is export  {
    my @retval;
    for $sum.split(',') -> $item {
        my $int-sum = $item.Int or die "invalid sum '$item' passed";
        @retval.append: MAIN-handler-combo($int-sum, $count, :$n, :$sandwich, :$sequence, :$x).lines;
    }
    @retval.sort({.chars, .Str}).join("\n");
}
