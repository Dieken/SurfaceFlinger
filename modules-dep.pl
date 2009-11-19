#!/usr/bin/perl
# get dependence of some modules according to full dependence among
# modules.
#
#  Usage:
#       perl modules-dep.pl MODULE... < modules-dep.dot
#
#  modules-dep.dot is obtained by running 'readelf -d' and some shell
#  scripts on $OUT/system/{bin,lib}/*.

use Data::Dumper;

my %a = ();

while (<STDIN>) {
    my ($k, $v) = /"(.*)".*"(.*)"/;

    if (exists $a{$k}) {
        push @{$a{$k}}, $v;
    } else {
        $a{$k} = [$v];
    }
}

#print Dumper(\%a);

my %b = ();
while (my $arg = shift) {
    dumpit($arg);
}

sub dumpit {
    my $arg = shift;

    return if exists $b{$arg};
    $b{$arg} = 1;

    return if ! exists $a{$arg};

    my @a = @{$a{$arg}};

    for (@a) {
        print "\"$arg\" -> \"$_\";\n";
        dumpit($_);
    }
}

