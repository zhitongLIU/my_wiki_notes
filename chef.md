```
https://docs.chef.io/chef_overview.html
```
# Chef #

## General introduction ##
Chef is a server that you could use to manage your servers, it help us to run installation or update scripts on deployed machine.

Chef has "one" main server, and all machines subscribe to this chef server call nodes.

Chef  server has Rbac, all users are in differents organizations.

Be careful, Everything in Chef worlds has thier name as identity, so you can only has one `organizations/toto` for example.

Users/organizations can have their scripts to run on machines, scripts are called `recipes` or `cookbooks` as consider users are chefs.

Once a machine is deployed, we would like it to install Chef client and subscribe to our Chef server by using Organization keys and the chef server public key

Once the chef client is installed it will download the run list that we provided in provision request and install it.

Run list can contains `roles`, `cookbooks`, `recipes`

recipes is a script

cookbook is a bunch of recipes

roles is a bunch of cookbooks and recipes


## Usage backend ##
Chef comes with a Rest Api (https://docs.chef.io/api_chef_server.html) and we use a gem call Ridley(https://github.com/berkshelf/ridley) which use their Api.
(actually we use ridley for normal client user connection and chef Api for admin connection now)

Some example:
Create a connection client
```
ridley # Ridley.new(
  server_url: "https://api.opscode.com/organizations/ridley",
  client_name: "reset",
  client_key: "/Users/reset/.chef/reset.pem"
)
```
 List roles
```
ridley.role.all ##> [
  #<Ridley::RoleObject chef_id:motherbrain_srv ...>,
  #<Ridley::RoleObject chef_id:motherbrain_proxy ...>
]
```
Find a cookbook
```
ridley.cookbook.find("apache2", "1.6.6")
```

Add/Modify/upload Cookbooks to a organisation

To add or create new Chef cookbooks or recipes, clone the a default cokkbooks repo

Install the chef sdk knife https://docs.chef.io/install_dk.html

go to your local repo and add connection information in .chef/knife.rb
```
log_level                :info
log_location             STDOUT
node_name                'you organisation user name'
client_key               "you organisation user name pem key path"
chef_server_url          'https://chef.emea.sd.lbn.fr/organizations/your-organisation-name/'
cookbook_path            './cookbooks'
role_path                './roles'
```
the last two line tell knife to which are cookbooks and roles repository to upload

When you finish your modification, commit and push it

To sync your local cookbooks and roles to chef server on your organization

just launch this at the projet repository
```
knife upload .
```

Docs:

https://docs.chef.io/chef_overview.html
