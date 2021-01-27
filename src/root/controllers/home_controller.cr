require "athena"

class HomeController < ART::Controller
  @[ARTA::Get("/")]
  def index : ART::Response
    html = <<-STR
    <!DOCTYPE html>
    <html>
    <head>
      <meta content="text/html;charset=utf-8" http-equiv="Content-Type">
      <meta content="utf-8" http-equiv="encoding">
      <link rel="stylesheet" href="shared/application.css">
      <link rel="stylesheet" href="root/styles.css">
      <script src="shared/application.js" type="module" defer></script>
      <script src="root/index.js" type="module" defer></script>
    <head>
    <body>
      <h1>Home Page</h1>
    <body>
    </html>
    STR

    ART::Response.new(
      html,
      status: 200,
      headers: HTTP::Headers{"content-type" => "text/html;"}
    )
  end
end
