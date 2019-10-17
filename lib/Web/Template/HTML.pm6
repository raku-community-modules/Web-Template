use Web::Template;

class Web::Template::HTML does Web::Template
{
  use HTML::Template;

  has $!engine = HTML::Template;
  has @!paths  = './views';

  method render ($template-name, *%named, *@positional)
  { ## HTML::Template uses named parameters.
    my ($template, $foundInPath);
    for @!paths -> $path
    {
      $template = $path ~ $template-name;
      if $template.IO ~~ :f 
      { 
        $foundInPath = $path;
        last; 
      }
    }
    if ! %named<TMPL_PATH>:exists
    {
      %named<TMPL_PATH> = $foundInPath;
    }
    $!engine.from_file($template).with_params(%named).output;
  }

  method set-path (*@paths)
  {
    @!paths = @paths;
  }

}
