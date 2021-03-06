#!/usr/bin/perl
#example of inserting

use strict;
use Search::OpenFTS::Index;
use DBI();
use DBD::Pg();

if ( $#ARGV <1 ) {
	print "Usage:\n$0 DATABASE file1 [ file2 [...] ]\n";
	exit;	
}

my $dbi=DBI->connect('DBI:Pg:dbname='.shift( @ARGV ).';host=sp',"sp");
$dbi||die;

my $STID=shift( @ARGV );

my $idx=Search::OpenFTS::Index->new( $dbi );
die "QQQ: $@" if ! $idx;

$idx->delete( $STID );

my $sth = $dbi->prepare( "delete from  txt where tid= ? ;" ); 
$sth->execute( $STID ) || die;
$dbi->disconnect;


