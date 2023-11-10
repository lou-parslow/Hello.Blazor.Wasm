# Hello.Blazor.Wasm

This is [Blazor Web Assembly](https://learn.microsoft.com/en-us/aspnet/core/blazor/hosting-models?view=aspnetcore-7.0#blazor-webassembly) application, that is deployed as a static [website](https://lou-parslow.github.io/Hello.Blazor.Wasm/) to [GitHub Pages](https://pages.github.com/)
The purpose of this project is to provide a simple working example of a Blazor Web Assembly hosted using GitHub Pages. The source code may be found [here](https://github.com/lou-parslow/Hello.Blazor.Wasm.git).

Steps to manually deploy a Blazor WASM application to GitHub pages

**Build Your Blazor WASM Application for Release:**
   - Open your terminal or command prompt.
   - Navigate to your project directory.
   - Run `dotnet publish src/Hello.Blazor.Wasm/Hello.Blazor.Wasm.csproj -c Release -o dist` to compile your application in release mode.


**Copy the contents of the published wwwfolder to the github pages folder:**
   - Copy the contents of the **'dist\wwwroot'** folder to the **'docs'** folder
   - Create an empty file **'docs\.nojekyll'** to signal to github pages that folders name with a leading underscore (**_framework**,**_content**) should be allowed
   - Edit the **'docs\index.html'** file and change the base href to **'/Hello.Blazor.Wasm/'**


**Push the docs folder to GitHub:**
   - Add the files to git with `git add -A`.
   - Commit the changes with `git commit -m "Deploy Blazor app to GitHub Pages"`.
   - Push to GitHub with `git push -u origin main` (or `git push -u origin main` if you are using the main branch for a user or organization site).


**Enable GitHub Pages in Your Repository Settings:**
   - Go to your repository on GitHub.
   - Click on "Settings" and navigate to "Pages" on the sidebar.
   - Under "Source", select the branch you want to deploy, in this case, the branch ***main*** is used.
   - Click "Save", and GitHub will start to build your site.

