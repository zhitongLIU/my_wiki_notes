= Logic =
*config/routes.rb*                                                                            <br >
  |                                                                                           <br >
  v                                                                                           <br >
*app/controller/XXX_controller.rb* <--> *app/models/XXX.rb*                                   <br >
  |                                                                                           <br >
  v                                                                                           <br >
*app/views/YYY.html.erb* --> *app/helpers/XXX_helper.rb*                                      <br >

                                                                                              <br >
`routes` call `XXX#action_name` which call the function `action_name` in `XXX_controller`     <br >
the `action_name` will be displayed by `XXX/action_name.html.erb` that                        <br >
it has access of values in the scope inside the function `action_name`.                       <br >
                                                                                              <br >
`XXX_controller` has full access with it's `XXX` class.                                       <br >
Additionally, in the page of `action_name.html.erb`, it can call all public function          <br >
inside of `helpers/XXX_helper.rb` module `XXX_helper.rb`.                                     <br >
-------------------------------------------------------------------------------
= Routes =

=== example ===
{{{
  Rails.application.routes.draw do
    root 'static_pages#home'
    # root make your_address/ redirect to this controller
    # `#` is to make your_address/static_pages/home not accessible

    get 'static_pages/contact'
    # get permet get request to the page

    get 'about' => 'static_pages#about'
    # make route like your_address/about
    # in link we can use now <%= link_to "About", about_path %>

    resources :users
    #make your_address/users have all Rest actions(CRUD)
    #like get user#1 is `your_address/users/1
    # resource path use function `show` in controller and then call
    # `app/views/users/show.html.erb` to display
  end
}}}

== Routes link test ==
add into Gemfile                                                                              <br >
  gem 'rails-controller-testing'                                                              <br >

run:                                                                                          <br >
  rails generate integration_test site_layout                                                 <br >
Will generate test/integration/site_layout_test.rb

run:                                                                                          <br >
  bundle exec rake test:integration                                                           <br >
execute intergration test

=== example ===
{{{
  test "layout links" do
    # get the page from root_path
    get root_path
    # check it has the same content as 'static_pages/home'
    assert_template 'static_pages/home'
    # check this page have 2 link <a>
    assert_select "a[href=?]", root_path, count: 2
    # check has a path linkt to help_path
    assert_select "a[href=?]", help_path
  end
}}}

Usage                                                                                         <br >
| assert_select                               | HTML                           |
|---------------------------------------------|--------------------------------|
| assert_select "div"                         | <div>foobar</div>              |
| assert_select "div", "foobar"               | <div>foobar</div>              |
| assert_select "div.nav"                     | <div class="nav">foobar</div>  |
| assert_select "div#profile"                 | <div id="profile">foobar</div> |
| assert_select "div[name=yo]"                | <div name="yo">hey</div>       |
| assert_select "a[href=?]", ’/’, count: 1    | <a href="/">foo</a>            |
| assert_select "a[href=?]", ’/’, text: "foo" | <a href="/">foo</a>            |

-------------------------------------------------------------------------------
= Controller =
run:
{{{
  rails generate controller Users new
}}}
this will create new controller call Users, Controller User have action new
and a page new.html.erb for action                                                            <br >

controller can use `params` to get parameteres from navigator path

-------------------------------------------------------------------------------
= Model =
Create new model:
{{{
  rails generate model User name:string email:string
}}}
this will create new model call User, the User model has 2 proprety, name in
string and email in string                                                                    <br >

Update db with:
{{{
  bundle exec rake db:migrate
}}}

If fail use:
{{{
  bundle exec rake db:rollback
}}}

Remove all db data with:
{{{
  bundle exec rake db:reset
}}}

Create&edit migration file manuelly
{{{
  rails generate migration add_index_to_users_email
}}}
use XXX_to_users_XXX to reference the model User, it will create
db/migrate/add_index_to_users_email, that you can edit later                                  <br >


-------------------------------------------------------------------------------
= html.erb =
use <% %> to execute ruby in html                                                             <br >
use <%= %> to print out using ruby                                                            <br >

know running enviroment
{{{
  Rails.env
}}}
Rails has 3 enviroment: development, test, production

=== From ===
{{{
    <%= form_for(@user) do |f| %>
      <% #create label with content `name` %>
      <%= f.label :name %>
      <% #create text_field for attributes `name` for @user object %>
      <%= f.text_field :name %>

      <%= f.label :email %>
      <%= f.email_field :email %>

      <%= f.label :password %>
      <%= f.password_field :password %>

      <% #call create method in user %>
      <%= f.submit "Create my account", class: "btn btn-primary" %>
    <% end %>
}}}
-------------------------------------------------------------------------------
= css.scss =
To import css gem
{{{
@import "bootstrap-sprockets";
@import "bootstrap";
}}}

kind of css module which can be use/import further
{{{

@mixin name_of_mixin {
  some css
}

further .
.
.
.

some_thing {
  @include name_of_mixin
}

}}}

-------------------------------------------------------------------------------
= Test =
Run:                                                                                          <br >
{{{
  bundle exec rake
}}}

=== example ===
{{{
  test "should get contact" do
    get static_pages_contact_url
    assert_response :success
    assert_select "title", "CONTACT | Zhitong sample app"
  end
}}}

-------------------------------------------------------------------------------
= Other =
for IE < 9 should add                                                                         <br >
{{{
<!--[if lt IE 9]>
  <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/r29/html5.min.js">
  </script>
  <![endif]-->
}}}


-------------------------------------------------------------------------------
= outil =
bundle exec erd

To generate diagram UML
