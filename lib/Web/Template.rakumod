use v6.d;
role Web::Template {
  method render ($template, *%named, **@positional) { ... }
  method set-path (**@paths) { ... }
}

# vim: expandtab shiftwidth=4
