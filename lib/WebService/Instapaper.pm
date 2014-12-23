package WebService::Instapaper;
use 5.008001;
use strict;
use warnings;

our $VERSION = "0.01";

sub new {
  my ($class, %args) = @_;
  bless {%args}, $class;
}

1;
__END__

=encoding utf-8

=head1 NAME

WebService::Instapaper - A client for the Instapaper Full API

=head1 SYNOPSIS

    use WebService::Instapaper;

    my $client = WebService::Instapaper->new(token => '...', secret => '...');

=head1 DESCRIPTION

WebService::Instapaper is a client for the Instapepr Full API.

=head1 LICENSE

Copyright (C) Shun Takebayashi.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Shun Takebayashi E<lt>shun@takebayashi.asiaE<gt>

=cut

