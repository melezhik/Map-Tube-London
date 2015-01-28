package Map::Tube::London;

$Map::Tube::London::VERSION   = '0.47';
$Map::Tube::London::AUTHORITY = 'cpan:MANWAR';

=head1 NAME

Map::Tube::London - Interface to the London Tube Map.

=head1 VERSION

Version 0.47

=cut

use 5.006;
use Data::Dumper;
use File::Share ':all';

use Moo;
use namespace::clean;

has xml  => (is => 'ro', default => sub { return dist_file('Map-Tube-London', 'london-map.xml') });
has skip => (is => 'ro', default => sub { _skip(); });
with 'Map::Tube';

sub _skip {

    return {
        'Jubilee'  => {
            'Baker Street'  => { 'Finchley Road' => 1 },
            'Finchley Road' => { 'Wembley Park'  => 1 },
        },
        'Bakerloo' => {
            'Edgware Road'  => { 'Baker Street'  => 1 },
        },
        'Circle'   => {
            'Wood Lane'     => { 'White City'    => 1 },
        },
        'District' => {
            "Earl's Court"  => { 'Barons Court'  => 1 },
            'Hammersmith'   => { 'Turnham Green' => 1 },
            'Acton Town'    => { 'Turnham Green' => 1 },
        },
    };
}

=head1 DESCRIPTION

It currently provides functionality to find the shortest  route between  the  two
given nodes. It covers the following tube lines:

=over 2

=item * L<Bakerloo Line|Map::Tube::London::Line::Bakerloo>

=item * L<Central Line|Map::Tube::London::Line::Central>

=item * L<Circle Line|Map::Tube::London::Line::Circle>

=item * L<District Line|Map::Tube::London::Line::District>

=item * Dockland Light Railway Line

=item * L<Hammersmith & City Line|Map::Tube::London::Line::HammersmithCity>

=item * L<Jubilee Line|Map::Tube::London::Line::Jubilee>

=item * L<Metropolitan Line|Map::Tube::London::Line::Metropolitan>

=item * L<Northern Line|Map::Tube::London::Line::Northern>

=item * London Overground Line

=item * Piccadilly Line

=item * Victoria Line

=item * Waterloo & City Line

=back

=head1 CONSTRUCTOR

The constructor DO NOT expects parameters.This setup the default node definitions.

    use strict; use warnings;
    use Map::Tube::London;

    my $tube = Map::Tube::London->new;

=head1 METHODS

=head2 get_shortest_route($from, $to)

Expects 'from' and 'to' station name and returns an object of type L<Map::Tube::Route>.
On error it returns an object of type L<Map::Tube::Exception>.

    use strict; use warnings;
    use Map::Tube::London;

    my $tube  = Map::Tube::London->new;
    my $route = $tube->get_shortest_route('Baker Street', 'Farringdon');

    print "Route: $route\n";;

=head2 as_image($line_name)

Returns line image as base64 encoded string. It expects the plugin L<Map::Tube::Plugin::Graph>
to be installed.

    use strict; use warnings;
    use MIME::Base64;
    use Map::Tube::London;

    my $tube = Map::Tube::London->new;
    my $line = 'Jubilee';
    open(my $IMAGE, ">$line.png");
    print $IMAGE decode_base64($tube->as_image($line));
    close($IMAGE);

=head1 AUTHOR

Mohammad S Anwar, C<< <mohammad.anwar at yahoo.com> >>

=head1 REPOSITORY

L<https://github.com/Manwar/Map-Tube-London>

=head1 BUGS

Please report any bugs or feature requests to C<bug-map-tube-london at rt.cpan.org>,
or through the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Map-Tube-London>.
I will be notified, and then you'll automatically be notified of progress on your
bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Map::Tube::London

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Map-Tube-London>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Map-Tube-London>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Map-Tube-London>

=item * Search CPAN

L<http://search.cpan.org/dist/Map-Tube-London/>

=back

=head1 LICENSE AND COPYRIGHT

Copyright (C) 2014 - 2015 Mohammad S Anwar.

This  program  is  free software; you can redistribute it and/or modify it under
the  terms  of the the Artistic License (2.0). You may obtain a copy of the full
license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any  use,  modification, and distribution of the Standard or Modified Versions is
governed by this Artistic License.By using, modifying or distributing the Package,
you accept this license. Do not use, modify, or distribute the Package, if you do
not accept this license.

If your Modified Version has been derived from a Modified Version made by someone
other than you,you are nevertheless required to ensure that your Modified Version
 complies with the requirements of this license.

This  license  does  not grant you the right to use any trademark,  service mark,
tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge patent license
to make,  have made, use,  offer to sell, sell, import and otherwise transfer the
Package with respect to any patent claims licensable by the Copyright Holder that
are  necessarily  infringed  by  the  Package. If you institute patent litigation
(including  a  cross-claim  or  counterclaim) against any party alleging that the
Package constitutes direct or contributory patent infringement,then this Artistic
License to you shall terminate on the date that such litigation is filed.

Disclaimer  of  Warranty:  THE  PACKAGE  IS  PROVIDED BY THE COPYRIGHT HOLDER AND
CONTRIBUTORS  "AS IS'  AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES. THE IMPLIED
WARRANTIES    OF   MERCHANTABILITY,   FITNESS   FOR   A   PARTICULAR  PURPOSE, OR
NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY YOUR LOCAL LAW. UNLESS
REQUIRED BY LAW, NO COPYRIGHT HOLDER OR CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT,
INDIRECT, INCIDENTAL,  OR CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE
OF THE PACKAGE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

=cut

1; # End of Map::Tube::London
