#!/usr/bin/perl
#use strict;
#use warnings;

if(@ARGV!=2)
{
  print "perl $0 <inputFile: immuMarker_methylValue.csv> <outputFile: reverseImmuMarkerPair(2cols)_methylValue1_value2.csv>\n";
  exit;
}

my $infile = shift @ARGV;
my $outfile = shift @ARGV;

my @immu,@methyl;
open IN, "$infile" || die "fail open $infile";
while(my $l=<IN>){
        chomp($l);
        my @line=split /,/,$l;
        push @immu,$line[0];
	push @methyl,$line[1];

}

close IN;

my $r_value=0;
open OUT, ">$outfile" || die $!;
print OUT "smallIndexImmuMarker,largeIndexImmuMarker,smallIndexImmuMarkerMethylValue,largeIndexImmuMarkerMethylValue,r_value"."\n";
for(my $i=0;$i<@immu-1;$i++){
	for(my $j=$i+1;$j<@immu;$j++){
		if($methyl[$i]>=$methyl[$j]){
			$r_value=1;
		}else{
			$r_value=-1;
		}
		print OUT $immu[$i].",".$immu[$j].",".$methyl[$i].",".$methyl[$j].",".$r_value."\n";
	}
}

close OUT;


