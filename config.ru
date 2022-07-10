use Rack::Static,
  :urls => ["/images", "/js", "/css", "/"],
  :root => "",
  index: "index.html"

run lambda { |env|
  [
    200,
    {
      'Content-Type'  => 'text/html',
      'Cache-Control' => 'public, max-age=86400'
    },
    Rack::Response.new(ERB.new(File.read("index.html.erb")).result(binding))
  ]
}
