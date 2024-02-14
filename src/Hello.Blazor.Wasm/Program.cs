using Microsoft.AspNetCore.Components.Web;
using Microsoft.AspNetCore.Components.WebAssembly.Hosting;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Components.WebAssembly.Authentication;
using Microsoft.AspNetCore.Components.Authorization;
using Hello.Blazor.Wasm;

var builder = WebAssemblyHostBuilder.CreateDefault(args);
builder.RootComponents.Add<App>("#app");
builder.RootComponents.Add<HeadOutlet>("head::after");

builder.Services.AddScoped(sp => new HttpClient { BaseAddress = new Uri(builder.HostEnvironment.BaseAddress) });


// Configure authentication
builder.Services.AddAuthorizationCore();
builder.Services.AddOidcAuthentication(options =>
{
    // Configure authentication provider (Azure AD/B2C)
    string tenantId = "0520d39c-3412-4086-b59b-bcd6aed60f47";
    string clientId = "31676f1f-f392-402b-b01c-9bd220d8a67f";
    options.ProviderOptions.Authority = $"https://login.microsoftonline.com/{tenantId}/v2.0/";
    options.ProviderOptions.ClientId = $"{clientId}";

    // Add scopes if needed
    //options.ProviderOptions.DefaultAccessTokenScopes.Add("openid");
    //options.ProviderOptions.DefaultAccessTokenScopes.Add("profile");
    //options.ProviderOptions.DefaultAccessTokenScopes.Add("email");
});

await builder.Build().RunAsync();
