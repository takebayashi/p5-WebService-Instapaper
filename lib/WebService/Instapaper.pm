package WebService::Instapaper;
use 5.008001;
use strict;
use warnings;

use OAuth::Lite::Consumer;
use JSON qw(decode_json);

our $VERSION = "0.01";

my $endpoint = "https://www.instapaper.com/api/1.1";

sub new {
  my ($class, %args) = @_;
  my $self = {%args};
  $self->{consumer} = OAuth::Lite::Consumer->new(
    consumer_key => $self->{consumer_key},
    consumer_secret => $self->{consumer_secret}
  );
  bless $self, $class;
}

sub auth {
  my ($self, $username, $password) = @_;
  my $res = $self->{consumer}->obtain_access_token(
    url => $endpoint . '/oauth/access_token',
    params => {
      x_auth_username => $username,
      x_auth_password => $password,
      x_auth_mode => 'client_auth'
    }
  );
  $self->{access_token} = $res->access_token;
}

sub token {
  my ($self, $access_token, $access_secret) = @_;
  $self->{access_token} = OAuth::Lite::Token->new(token => $access_token, secret => $access_secret);
}

sub bookmarks {
  my ($self) = @_;
  my $res = $self->{consumer}->request(method => 'POST', url => $endpoint . '/bookmarks/list', token => $self->{access_token});
  @{decode_json($res->decoded_content)->{bookmarks}};
}

1;
__END__

=encoding utf-8

=head1 NAME

WebService::Instapaper - A client for the Instapaper Full API

=head1 SYNOPSIS

    use WebService::Instapaper;

    my $client = WebService::Instapaper->new(consumer_key => '...', consumer_secret => '...');

    $client->auth('username', 'password');

    # or
    $client->token('access_token', 'access_token_secret');

    # get bookmark list
    my @bookmarks = $client->bookmarks;

=head1 DESCRIPTION

WebService::Instapaper is a client for the Instapepr Full API.

=head1 LICENSE

Copyright (C) Shun Takebayashi.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Shun Takebayashi E<lt>shun@takebayashi.asiaE<gt>

=cut

