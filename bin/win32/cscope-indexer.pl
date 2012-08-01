#!/usr/bin/perl -w
# cscope-indexer.pl ---
# Author: Ye Wenbin <wenbinye@gmail.com>
# Created: 10 Sep 2008
# Version: 0.01
######################################################################
#
# Hacked by Xin Yang <xin2.yang@gmail.com>
# Time-stamp:<2011-12-06 Tue 02:53 xin on P6T-WIN7>
######################################################################

=head1 NAME

cscope-indexer.pl - Script to index files for cscope

=head1 SYNOPSIS

cscope-indexer.pl [ -v ] [-f database_file ] [-i list_file ] [ -l ] [ -r ]

where:

   -f database_file
        Specifies the cscope database file (default: cscope.out).

   -i list_file
        Specifies the name of the file into which the list of files
        to index is placed (default: cscope.files).

   -l
        Suppress the generation/updating of the cscope database
        file.  Only a list of files is generated.

   -r
        Recurse into subdirectories to locate files to index.
        Without this option, only the current directory is
        searched.

   -v
        Be verbose.  Output simple progress messages.

=head1 DESCRIPTION

This script generates a list of files to index (cscope.out), which is
then (optionally) used to generate a cscope database. You can use this
script to just build a list of files, or it can be used to build a
list and database. This script is not used to just build a database
(skipping the list of files step), as this can be simply done by just
calling "cscope -b".

Normally, cscope will do its own indexing, but this script can be used
to force indexing. This is useful if you need to recurse into
subdirectories, or have many files to index (you can run this script
from a cron job, during the night). It is especially useful for large
projects, which can contstantly have source files added and deleted;
by using this script, the changing sources files are automatically
handled.

Currently, any paths containing "/CVS/" or "/RCS/" are stripped out
(ignored).

This script is written to use only basic shell features, as not all
shells have advanced features.

=head1 AUTHOR

Darryl Okahata

TRANSLATE BY Ye Wenbin, E<lt>wenbinye@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2008 by Ye Wenbin

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.2 or,
at your option, any later version of Perl 5 you may have available.

=head1 REFERENCES

   - http://www.wenb.in/2008/09/cscope-indexer-perl-version.html

=head1 BUGS

None reported... yet.

=cut
######################################################################

use warnings;
use strict;
use Getopt::Long qw/:config pass_through/;
use File::Find;

# May have to edit this:
if ( $^O =~ /win/ ) {
   $ENV{PATH} = "d:\\Programs\\cygwin\\usr\\local\\bin;$ENV{PATH};$ENV{PATH}";
}
else {
   $ENV{PATH} = "/usr/local/bin:/sbin:/usr/sbin:/bin:/usr/bin:$ENV{PATH}";
}
my $LIST_ONLY;
my $DIR='.';
my $LIST_FILE='cscope.files';
my $DATABASE_FILE='cscope.out';
my $RECURSE;
my $VERBOSE;

GetOptions(
   "file=s" => \$DATABASE_FILE,
   "index=s" => \$LIST_FILE,
   "list" => \$LIST_ONLY,
   "recurse" => \$RECURSE,
   "verbose" => \$VERBOSE,
);
$DIR = shift if @ARGV;
message("Creating list of files to index ...");

my @files;
if ( $RECURSE ) {
   find( sub {
             if ( -f $_ || -l $_ ) {
                 push @files, $File::Find::name;
             }
         }, $DIR);
} else {
   @files = <$DIR/*>;
}
@files = sort map {s{^\./}{}; $_}
         grep { /\.([chly](xx|pp)?|cc|hh)$/ && $_ !~ m{/CVS/} && $_ !~ m{/RCS/}
                && $_ !~ m{/.svn/} && $_ !~ m{/.git/}  # HACK: do not search in .svn/ .git/
              } @files;
open(my $fh, ">", $LIST_FILE) or die "Can't create file $LIST_FILE: $!";
print {$fh} join("\n", @files), "\n";
close $fh;
message("Creating list of files to index ... done");
if ( $LIST_ONLY ) {
   exit;
}
message("Indexing files ...");
system("cscope", "-b", "-i", $LIST_FILE, "-f", $DATABASE_FILE) == 0 or die "$!"; # HACK: add -q option
message("Indexing files ... done");

sub message {
   print @_, "\n" if $VERBOSE;
}
