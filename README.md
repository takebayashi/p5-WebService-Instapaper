# NAME

WebService::Instapaper - A client for the Instapaper Full API

# SYNOPSIS

    use WebService::Instapaper;

    my $client = WebService::Instapaper->new(consumer_key => '...', consumer_secret => '...');

    $client->auth('username', 'password');

    # or
    $client->token('access_token', 'access_token_secret');

    # get bookmark list
    my @bookmarks = $client->bookmarks;

    # archive bookmarks
    my $bookmark = shift @bookmarks;
    $client->archive_bookmark($bookmark->{bookmark_id});

# DESCRIPTION

WebService::Instapaper is a client for the Instapepr Full API.

# LICENSE

Copyright (C) Shun Takebayashi.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

Shun Takebayashi <shun@takebayashi.asia>
