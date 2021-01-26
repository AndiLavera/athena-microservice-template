require "athena"

class AboutController < ART::Controller
  @[ARTA::Get("/about")]
  def index : ART::Response
    html = <<-STR
    <head>
      <meta content="text/html;charset=utf-8" http-equiv="Content-Type">
      <meta content="utf-8" http-equiv="encoding">
      <link rel="stylesheet" href="shared/application.css">
      
      <script>
        window.HMR_WEBSOCKET_URL = 'ws://#{Snowpacker.config.hostname}:#{Snowpacker.config.port}'
      </script>
      <script src="/_snowpack/hmr-client.js" type="module" defer></script>
      <script src="shared/application.js" type="module" defer></script>
      <script src="about/index.js" type="module" defer></script>
    <head>
    <body>
      <h1>About Page</h1>
    <body>
    STR

    ART::Response.new(
      html,
      status: 200,
      headers: HTTP::Headers{"content-type" => "text/html;"}
    )
  end
end
