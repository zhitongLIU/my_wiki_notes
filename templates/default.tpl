<!DOCTYPE html>
<html lang="en">
  <head>
	<link rel="Stylesheet" type="text/css" href="../templates/markdown.css" />
	<link rel="Stylesheet" type="text/css" href="../templates/github.css" />
  <title>%title%</title>

  %pygments%
</head>
<body id="%title%">
  %content%

<script type="text/javascript" src="../js/highlight.pack.js"></script>
<script type="text/javascript" src="../js/zepto.min.js"></script>
<script type="text/javascript">
$('pre').each(function(index,item){ $(item).html('<code>'+$(item).html()+'</code>'); });
hljs.initHighlightingOnLoad();
</script>
</body>
</html>
