# this project may be viewed here: https://lou-parslow.github.io/Hello.Blazor.Wasm/
require "raykit"

task :build do
  run "dotnet publish src/Hello.Blazor.Wasm/Hello.Blazor.Wasm.csproj -c Release -o dist"
  #mkdir "docs" unless Dir.exist? "docs"
  #FileUtils.cp_r "dist/wwwroot/.", "docs"
  # for github pages, a .nojekyll file is required to prevent github from ignoring files starting with an underscore
  #File.open("docs/.nojekyll", "w") {}
  #Raykit::Text::replace_in_file("docs/index.html", '<base href="/" />', '<base href="/Hello.Blazor.Wasm/" />')
end

task :update_docs => [:build] do
	mkdir "docs" unless Dir.exist? "docs"
  FileUtils.cp_r "dist/wwwroot/.", "docs"
  # for github pages, a .nojekyll file is required to prevent github from ignoring files starting with an underscore
  File.open("docs/.nojekyll", "w") {}
  Raykit::Text::replace_in_file("docs/index.html", '<base href="/" />', '<base href="/Hello.Blazor.Wasm/" />')
end

task :default => [:build,:integrate,:push] do
end

