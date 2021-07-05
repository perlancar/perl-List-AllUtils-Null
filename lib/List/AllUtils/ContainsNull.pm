package List::AllUtils::ContainsNull;

# AUTHORITY
# DATE
# DIST
# VERSION

use strict;
use warnings;

use Exporter 'import';
our @EXPORT_OK = qw(max maxstr min minstr sum);

sub sum(@) {
    my $contains_null = 0;
    return (undef, 0) unless @_;
    my $sum;
    for (@_) {
        unless (defined) { $contains_null = 1; next }
        if (defined $sum) { $sum += $_ } else { $sum = $_ }
    }
    ($sum, $contains_null);
}

sub min (@) {
    my $contains_null = 0;
    return (undef, 0) unless @_;
    my $min;
    for (@_) {
        unless (defined) { $contains_null = 1; next }
        if (defined $min) { $min = $_ if $_ < $min } else { $min = $_ }
    }
    ($min, $contains_null);
}

sub max (@) {
    my $contains_null = 0;
    return (undef, 0) unless @_;
    my $max;
    for (@_) {
        unless (defined) { $contains_null = 1; next }
        if (defined $max) { $max = $_ if $_ > $max } else { $max = $_ }
    }
    ($max, $contains_null);
}

sub minstr (@) {
    my $contains_null = 0;
    return (undef, 0) unless @_;
    my $min;
    for (@_) {
        unless (defined) { $contains_null = 1; next }
        if (defined $min) { $min = $_ if $_ lt $min } else { $min = $_ }
    }
    ($min, $contains_null);
}

sub maxstr (@) {
    my $contains_null = 0;
    return (undef, 0) unless @_;
    my $max;
    for (@_) {
        unless (defined) { $contains_null = 1; next }
        if (defined $max) { $max = $_ if $_ gt $max } else { $max = $_ }
    }
    ($max, $contains_null);
}

1;
# ABSTRACT: List subroutines that return additional result: "contains-null/not"

=head1 SYNOPSIS

 use List::AllUtils::ContainsNull qw(
     max maxstr min minstr
     sum
 );

 my ($max, $contains_null) = max();              # => (undef, 0)
 my ($max, $contains_null) = max(1,2,3,4,5);     # => (5, 0)
 my ($max, $contains_null) = max(1,2,undef,4,5); # => (5, 1)
 my ($max, $contains_null) = max(undef, undef);  # => (undef, 1)

 my ($min, $contains_null) = min();              # => (undef, 0)
 my ($min, $contains_null) = min(1,2,3,4,5);     # => (1, 0)
 my ($min, $contains_null) = min(1,2,undef,4,5); # => (1, 1)
 my ($min, $contains_null) = min(undef, undef);  # => (undef, 1)

 my ($sum, $contains_null) = sum();              # => (undef, 0)
 my ($sum, $contains_null) = sum(1,2,3,4,5);     # => (15, 0)    # we can display the sum as "15"
 my ($sum, $contains_null) = sum(1,2,undef,4,5); # => (15, 1)    # we can display the sum as "15+?"
 my ($sum, $contains_null) = sum(undef, undef);  # => (undef, 1) # we can display the sum as "?"


=head1 DESCRIPTION


=head1 FUNCTIONS

=head2 max

=head2 maxstr

=head2 min

=head2 minstr

=head2 sum


=head1 SEE ALSO

L<List::AllUtils::Null>

=cut
