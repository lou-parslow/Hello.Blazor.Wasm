require "raykit"

task :setup do
  run "dotnet new blazorwasm -o src/Hello.Blazor.Wasm -n Hello.Blazor.Wasm" unless Dir.exist? "src/Hello.Blazor.Wasm"
end
