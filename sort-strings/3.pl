#!/bin/perl

use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime(time);
$year += 1900;
$mon +=1;
print "start : ", $year, "\/", $mon, "\/", $mday, " ", $hour, ":", $min, ":", $sec, "\n";
open(DATAFILE, "$ARGV[0]");
my $count_line = 0;
my %moji_line_count = ();

foreach (<DATAFILE>) {
  chomp;
  $moji_line_count{$_}++;
  $_ =~ tr/aiueo/12345/;
  my @moji_sort = split(/ /);
  $count_line++;
  my $line500 = $count_line % 500;
  my %moji_count = ();

  foreach (@moji_sort) {
    $moji_count{$_}++;
    exit 1 if $moji_count{$_} >= 2;
  };

  if ($moji_sort[2] == 1) {
  print $count_line, "lines : ", $year, "\/", $mon, "\/", $mday, " ", $hour, ":", $min, ":", $sec, "\n" if $line500 == 0 && $count_line != 0;
  next
  };

  my $moji = join(" ", sort @moji_sort);
  $moji =~ tr/12345/aiueo/; 
  print $moji, "\n";
  print $count_line, " lines : ", $year, "\/", $mon, "\/", $mday, " ", $hour, ":", $min, ":", $sec, "\n" if $line500 == 0 && $count_line != 0;
};

foreach(keys %moji_line_count) {
  print "\"", $_, "\" is ", $moji_line_count{$_}, " lines.\n";
};

print "finish : ", $year, "\/", $mon, "\/", $mday, " ", $hour, ":", $min, ":", $sec, "\n";
