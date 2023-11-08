require "raykit"

# https://github.com/lou-parslow/Hello.Blazor.Wasm.git

task :setup do
  run "dotnet new blazorwasm -o src/Hello.Blazor.Wasm -n Hello.Blazor.Wasm" unless Dir.exist? "src/Hello.Blazor.Wasm"

  # set base path to /Hello.Blazor.Wasm in src/Hello.Blazor.Wasm/www/index.html
end

task :build do
  run "dotnet publish src/Hello.Blazor.Wasm/Hello.Blazor.Wasm.csproj -c Release -o dist"
  mkdir "docs" unless Dir.exist? "docs"
  FileUtils.cp_r "dist/wwwroot/.", "docs"
  #run "cp -r dist/wwwroot/* docs"
end