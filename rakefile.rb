require "raykit"

# https://github.com/lou-parslow/Hello.Blazor.Wasm.git
# https://<username>.github.io/<repository-name>/
# https://lou-parslow.github.io/Hello.Blazor.Wasm/

# failed to load resource https://lou-parslow.github.io/Hello.Blazor.Wasm/_framework/blazor.webassembly.js

task :setup do
  run "dotnet new blazorwasm -o src/Hello.Blazor.Wasm -n Hello.Blazor.Wasm" unless Dir.exist? "src/Hello.Blazor.Wasm"

  # set base path to /Hello.Blazor.Wasm in src/Hello.Blazor.Wasm/www/index.html
  # https://lou-parslow.github.io/Hello.Blazor.Wasm/
end

task :build do
  run "dotnet publish src/Hello.Blazor.Wasm/Hello.Blazor.Wasm.csproj -c Release -o dist"
  mkdir "docs" unless Dir.exist? "docs"
  FileUtils.cp_r "dist/wwwroot/.", "docs"
  #FileUtils.cp_r "dist/.", "docs"
  #run "cp -r dist/wwwroot/* docs"

  # for github pages, a .nojekyll file is required to prevent github from ignoring files starting with an underscore
  File.open("docs/.nojekyll", "w") {}
  # set base path to /Hello.Blazor.Wasm in docs/index.html

  #<base href="https://lou-parslow.github.io/Hello.Blazor.Wasm/" />
end