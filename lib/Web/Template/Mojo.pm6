use Web::Template;

class Web::Template::Mojo does Web::Template
{
  use Template::Mojo;

  has $!engine = Template::Mojo;
  has @!paths  = './views';

  method render ($template-name, *%named, *@positional)
  { ## Template::Mojo uses positional paramemters.
    my $template-file;
    my $template;
    for @!paths -> $path
    {
      $template-file = $path ~ $template-name;
      if $template-file.IO ~~ :f
      {
        $template = slurp($template-file);
        last;
      }
    }
    if $template.defined
    {
      $!engine.new($template).render(|@positional);
    }
    else
    {
      die "No template file for '$template-name' was found.";
    }
  }

  method set-path (*@paths)
  {
    @!paths = @paths;
  }

}
