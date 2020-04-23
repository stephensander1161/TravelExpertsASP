using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ASPDOTNET___Lab_2.Startup))]
namespace ASPDOTNET___Lab_2
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
