# this project may be viewed here: https://lou-parslow.github.io/Hello.Blazor.Wasm/
VERSION = "0.0.0"
require "raykit"
SITE_DIR = "artifacts/Hello.Blazor.Wasm.#{VERSION}"

# https://lou-parslow.github.io/Hello.Blazor.Wasm/

task :setup do
  run "dotnet add src/Hello.Blazor.Wasm/Hello.Blazor.Wasm.csproj package Microsoft.Extensions.DependencyInjection"
end

task :build do
  start_task :build
  try "rufo ."
  run "dotnet build src/Hello.Blazor.Wasm/Hello.Blazor.Wasm.csproj"
  FileUtils.cp("README.md", "src/Hello.Blazor.Wasm/wwwroot/")
  run "dotnet publish src/Hello.Blazor.Wasm/Hello.Blazor.Wasm.csproj -c Release -o dist"
  FileUtils.mkdir("artifacts") unless Dir.exist? "artifacts"
  FileUtils.mkdir(SITE_DIR) unless Dir.exist? SITE_DIR
  puts "  copying files to #{SITE_DIR}"
  FileUtils.cp_r "dist/wwwroot/.", SITE_DIR
  # for github pages, a .nojekyll file is required to prevent github from ignoring files starting with an underscore
  File.open("#{SITE_DIR}/.nojekyll", "w") { }
  Raykit::Text::replace_in_file("#{SITE_DIR}/index.html", '<base href="/" />', '<base href="/Hello.Blazor.Wasm/" />')
end

task :update_docs => [:build] do
  mkdir "docs" unless Dir.exist? "docs"
  FileUtils.cp_r "#{SITE_DIR}/.", "docs"
end

task :default => [:build, :update_docs, :integrate, :push] do
end
