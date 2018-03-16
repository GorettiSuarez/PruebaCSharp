using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System.Data.Entity;


namespace PruebaCSharp.Models
{
    
    public class ApplicationUser : IdentityUser
    {

        public async Task GenerateUserIdentityAsync(UserManager<ApplicationUser> manager)
        {
             await GenerateUserIdentityAsync(manager, DefaultAuthenticationTypes.ApplicationCookie);
        }


        public async Task<ClaimsIdentity> GenerateUserIdentityAsync(UserManager<ApplicationUser> manager, string authenticationType)
        {
            
            var userIdentity = await manager.CreateIdentityAsync(this, authenticationType);
            return userIdentity;
        }
    }


    public class AppUsersDbContext : IdentityDbContext<ApplicationUser>
    {
        public AppUsersDbContext()
            : base("DefaultConnection", throwIfV1Schema: false)
        {
            Database.SetInitializer(new MySqlInitializer());
        }

        public static AppUsersDbContext Create()
        {
            return new AppUsersDbContext();
        }
    }


}