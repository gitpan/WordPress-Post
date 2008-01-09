package WordPress::CLI;
use strict;


sub _abs_wppost {
   defined $ENV{HOME} or warn("cant seek .wppost, ENV HOME not set") and return;
   my $abs = "$ENV{HOME}/.wppost";
   -f $abs or return;
   return $abs;
}

sub _conf {
   my $abs = shift;
   $abs ||= _abs_wppost or return;
   require YAML;
   my $conf = YAML::LoadFile($abs);
   $conf->{username} = $conf->{U};
   $conf->{password} = $conf->{P};
   $conf->{proxy} = $conf->{p};
   return $conf;
}

1;

__END__

=pod

=head1 NAME

WordPress::CLI

=head1 PRIVATE METHODS

_conf()

_abs_wppost()

=head1 DESCRIPTION

This is used by wppost of WordPress::Post package.

=head2 ~/.wppost

Your yaml conf file should contain:

   ---
   U:username
   P:password
   p:proxy

Example .wppost file:

   ---
   U: jim
   P: wegjwgw
   p: 'http://jim/xmlrpc.php'

=head1 AUTHOR

Leo Charre

=head1 SEE ALSO

WordPress::Post

=cut

