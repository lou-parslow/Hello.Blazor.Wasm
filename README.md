# Hello.Blazor.Wasm

A Blazor WASM application deployed to GitHub pages

# Future considerations
- [ ] deploy to GitLab pages
- [ ] deploy to IIS
- [ ] deploy to Apache on linux

https://learn.microsoft.com/en-us/aspnet/core/?view=aspnetcore-7.0
https://learn.microsoft.com/en-us/aspnet/core/host-and-deploy/?view=aspnetcore-7.0


Deploying a Blazor WebAssembly (WASM) application to GitHub Pages involves packaging your app into static files and pushing them to a GitHub repository that will serve the files over the web. GitHub Pages is a static site hosting service that takes HTML, CSS, and JavaScript files pushed to a repository on GitHub and publishes a website.

**General Description:**

To deploy a Blazor WASM app to GitHub Pages, you generally follow these steps:

1. **Prepare Your Blazor Application**: Make sure your application is ready for production and compiles without errors.

2. **Build the Application for Release**: Build your Blazor app using the release configuration to optimize the output.

3. **Create a GitHub Repository**: If you haven't done so already, create a new repository on GitHub for hosting your Blazor WASM app.

4. **Configure the Base Path**: Set the base path in your Blazor project to correspond with your GitHub Pages URL.

5. **Generate Static Files**: Publish your Blazor app to generate the static files needed for deployment.

6. **Push to GitHub**: Create a `gh-pages` branch (or use `main`/`master` if it's a project or user page) and push the contents of the publish folder to this branch.

7. **Enable GitHub Pages**: In your repository's settings, enable GitHub Pages and set the branch to the one you've pushed your Blazor app to.

8. **Verify Deployment**: Access your GitHub Pages URL to check that the Blazor app is live and functioning correctly.

**Detailed Steps:**

Here are the detailed steps you would typically follow:

1. **Build Your Blazor WASM Application for Release:**
   - Open your terminal or command prompt.
   - Navigate to your project directory.
   - Run `dotnet publish -c Release` to compile your application in release mode.

2. **Set the Base Path:**
   - Open the `wwwroot/index.html` file in your Blazor project.
   - Find the `<base href="/" />` tag.
   - Change the `href` value to `"/<repository-name>/"`, where `<repository-name>` is the name of your GitHub repository.

3. **Create a GitHub Repository:**
   - Go to GitHub and create a new repository.

4. **Initialize Your Local Repository and Connect it to GitHub:**
   - Inside your project folder, initialize a new git repository with `git init`.
   - Add the GitHub remote with `git remote add origin https://github.com/<username>/<repository-name>.git`, replacing `<username>` and `<repository-name>` with your GitHub username and new repository name.

5. **Checkout to a New Branch (optional for project pages):**
   - If you want to keep your source separate from the deployment, create a `gh-pages` branch with `git checkout -b gh-pages`.

6. **Push the Publish Folder to GitHub:**
   - Copy the contents of the `bin/Release/netstandard2.1/publish/wwwroot` folder (the path might be slightly different depending on your .NET version) to the root of your local git repository.
   - Add the files to git with `git add -A`.
   - Commit the changes with `git commit -m "Deploy Blazor app to GitHub Pages"`.
   - Push to GitHub with `git push -u origin gh-pages` (or `git push -u origin main` if you are using the main branch for a user or organization site).

7. **Enable GitHub Pages in Your Repository Settings:**
   - Go to your repository on GitHub.
   - Click on "Settings" and navigate to "Pages" on the sidebar.
   - Under "Source", select the branch you want to deploy (`gh-pages` or `main`/`master`).
   - Click "Save", and GitHub will start to build your site.

8. **Check Your Deployment:**
   - Once GitHub Pages has finished building your site, you can navigate to `https://<username>.github.io/<repository-name>/` to see your live Blazor app.

Remember that GitHub Pages serves static content and won't be able to handle server-side Blazor without additional services. Also, it's important to commit and push any changes you make to your Blazor app to the GitHub repository to update the live site.
