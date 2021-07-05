package List::AllUtils::Null;

# AUTHORITY
# DATE
# DIST
# VERSION

use strict;
use warnings;

use Exporter 'import';
our @EXPORT_OK = qw(max maxstr min minstr sum);

sub sum(@) {
    return undef unless @_;
    my $s = 0;
    for (@_) {
        return undef unless defined;
        $s += $_;
    }
    $s;
}

sub min (@) {
    return undef unless @_;
    my $min = shift;
    return undef unless defined $min;
    for (@_) {
        return undef unless defined;
        $_ < $min and $min = $_;
    }
    $min;
}

sub max (@) {
    return undef unless @_;
    my $max = shift;
    return undef unless defined $max;
    for (@_) {
        return undef unless defined;
        $_ > $max and $max = $_;
    }
    $max;
}

sub minstr (@) {
    return undef unless @_;
    my $min = shift;
    return undef unless defined $min;
    for (@_) {
        return undef unless defined;
        $_ lt $min and $min = $_;
    }
    $min;
}

sub maxstr (@) {
    return undef unless @_;
    my $max = shift;
    return undef unless defined $max;
    for (@_) {
        return undef unless defined;
        $_ gt $max and $max = $_;
    }
    $max;
}

1;
# ABSTRACT: List subroutines that treat undef as contagious unknown, like null in SQL

=head1 SYNOPSIS

 use List::AllUtils::Null qw(
     max maxstr min minstr
     sum
 );

 say max(1,2,3,4,5);     # => 5
 say max(1,2,undef,4,5); # => undef

 say min(1,2,3,4,5);     # => 1
 say min(1,2,undef,4,5); # => undef

 say sum(1,2,3,4,5);     # => 15
 say sum(1,2,undef,4,5); # => undef


=head1 DESCRIPTION


=head1 FUNCTIONS

=head2 max

=head2 maxstr

=head2 min

=head2 minstr

=head2 sum


=head1 SEE ALSO

Your favorite SQL reference.

L<List::Util> and friends (L<List::SomeUtils>, L<List::UtilsBy>,
L<List::MoreUtils>, L<List::AllUtils>).

L<List::AllUtils::ContainsNull>

=cut
