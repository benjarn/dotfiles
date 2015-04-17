#!/bin/sh
FILE="/home/marcus/Dropbox/Public/marcusolsson/index2.html"

cat <<EOT > $FILE
<!DOCTYPE html>
<html lang="sv">
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8;">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="marcusolsson.org">
    <meta name="author" content="Marcus Olsson">
    <link rel="shortcut icon" href="favicon.ico">

    <title>Marcus|Olsson</title>

    <!-- Bootstrap core CSS -->
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" >
    <link href="css/jumbotron-narrow.css" rel="stylesheet">

    <link href='http://fonts.googleapis.com/css?family=Inconsolata' rel='stylesheet' type='text/css'>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="../../assets/js/html5shiv.js"></script>
      <script src="../../assets/js/respond.min.js"></script>
    <![endif]-->

    <!-- Piwik -->
    <script type="text/javascript">
  var _paq = _paq || [];
    _paq.push(["trackPageView"]);
      _paq.push(["enableLinkTracking"]);

        (function() {
             var u=(("https:" == document.location.protocol) ? "https" :
                 "http") + "://itkraft.se/piwik/";
                 _paq.push(["setTrackerUrl", u+"piwik.php"]);
                     _paq.push(["setSiteId", "2"]);
                         var d=document, g=d.createElement("script"),
                         s=d.getElementsByTagName("script")[0];
                         g.type="text/javascript";
                             g.defer=true; g.async=true; g.src=u+"piwik.js";
                             s.parentNode.insertBefore(g,s);
                               })();
    </script>
    <!-- End Piwik Code -->
<style type="text/css">
.body_foreground { color: #AAAAAA; }
.body_background { background-color: #000000; }
.body_foreground > .bold,.bold > .body_foreground, body.body_foreground > pre > .bold { color: #FFFFFF; font-weight: normal; }
.inv_foreground { color: #000000; }
.inv_background { background-color: #AAAAAA; }
.ansi1 { font-weight: bold; }
.ansi34 { color: #0000aa; }
.inv34 { background-color: #0000aa; }
.ansi37 { color: black; }
.inv37 { background-color: #F5F1DE; }
</style>

  </head>

  <body>

    <div class="container">
      <div class="header">
        <ul class="nav nav-pills pull-right">
          <li class="active"><a href="#">Hårdvara</a></li>
          <li><a href="http://marcusolsson.org">Hem</a></li>


<!--          <li><a href="#">About</a></li>
          <li><a href="#">Contact</a></li> -->
        </ul>
        <h3 class="text-muted">Marcus Olsson</h3>
      </div>

      <div class="well">
          <img class="img-thumbnail" src="bilder/jumbo.jpg">
      </div>

      <div class="row marketing">
        <div class="col-lg-12">
EOT

#inxi -b | ansi2html -p >> $FILE
inxi -b >> $FILE

cat <<EOT >> $FILE

</div>
      </div>

      <div class="footer">
        <p>&copy; Marcus 2013  -- Updated: $(date)</p>
      </div>

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-25875288-1']);
  _gaq.push(['_trackPageview']);

  (function() {
  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

    </script>
  </body>
</html>
EOT
