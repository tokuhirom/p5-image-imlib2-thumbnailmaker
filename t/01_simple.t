use strict;
use warnings;
use Test::More tests => 2;
use Image::Imlib2::ThumbnailMaker;
use File::Temp;
use Image::Size qw/imgsize/;

my $fh = File::Temp->new(UNLINK => 1);
Image::Imlib2::ThumbnailMaker::make(
    't/data/orig.jpg' => $fh->filename,
    'jpeg',
    100 => 200
);
my ($x, $y) = imgsize($fh->filename);
is $x, 100;
is $y, 200;

