package Image::Imlib2::ThumbnailMaker;
use strict;
use warnings;
our $VERSION = '0.01';
our @ISA;

eval {
    require XSLoader;
    XSLoader::load(__PACKAGE__, $VERSION);
    1;
} or do {
    require DynaLoader;
    push @ISA, 'DynaLoader';
    __PACKAGE__->bootstrap($VERSION);
};

1;
__END__

=head1 NAME

Image::Imlib2::ThumbnailMaker -

=head1 SYNOPSIS

  use Image::Imlib2::ThumbnailMaker;

=head1 DESCRIPTION

Image::Imlib2::ThumbnailMaker is a simple thumbnail maker by Imlib2.

Image::Imlib2 is a similar module to this. But Image::Imlib2::ThumbnailMaker has also functional interface and fast and lightweight.

=head1 AUTHOR

Tokuhiro Matsuno E<lt>tokuhirom ah! gmail.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
