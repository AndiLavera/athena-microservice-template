require "athena"

class HomeController < ART::Controller
  @[ARTA::Get("/")]
  def index : ART::Response
    html = <<-STR
    <head>
      <meta content="text/html;charset=utf-8" http-equiv="Content-Type">
      <meta content="utf-8" http-equiv="encoding">
      <link rel="stylesheet" href="shared/application.css">

      <!--
        The next 2 snowpack scripts need to be moved into snowpacker.cr. I am thinking I should listen
        in on the response phase. If the content-type is `text/html` then inject these into the document.
      -->
      <script>
        window.HMR_WEBSOCKET_URL = 'ws://#{Snowpacker.config.hostname}:#{Snowpacker.config.port}'
      </script>
      <script src="_snowpack/hmr-client.js" type="module" defer></script>

      <script src="shared/application.js" type="module" defer></script>
      <script src="root/index.js" type="module" defer></script>
    <head>
    <body>
      <h1>Home Page</h1>
    <body>
    STR

    ART::Response.new(
      html,
      status: 200,
      headers: HTTP::Headers{"content-type" => "text/html;"}
    )
  end
end
