### Devise with registrations and roles

Simple app to see how devise can be integrated with registrations that have a polymorphic relation to many different 'user' models.

The way it works. :drum_with_drumsticks:
A registration belongs to a user, but the user is not an actual model.
We use the option of polymorphic: true So for the `Registration` we do:
`belongs_to :user, polymorphic: true`
then on the Client & Cleaner models (to which the registration CAN belong)
Cient.rb && Cleaner.rb (same!)
  `has_one :registration, as: :user`
The registration has to save the id & to which table the id refers so, the registration actually saves both user_id and user_type so that when you do registration.user it will look at: registration.user_type to know which table to query with the user_id

The set up with the devise form is to use a hidden_field of user_type. We send initial params when we go to this form through the links that go to this form. Through buttons such as: 
`<%= link_to 'Register as a client', new_registration_registration_path(user_type: 'Client')%>`
Either: register as a cleaner or register as a client and both will pass along a param user_type: 'Client' || 'Cleaner'
This param is then added to the form through

`<input type='hidden' value=<%= params[:user_type] %> name='user_type'>`
Then added a bit of code to the `Devise::RegistrationsController`. This is done by creating our own `RegistrationsController < Devise::RegistrationsController` -> It inherits all functionality from devise. Then in the create method, we add a bit of code as so:
```
def create
   super      // execute everything in the original create method then add the user to the registration model.
   if params[:user_type] == 'Client' 
      user = Client.create 
   elsif params[:user_type] == 'Cleaner'
     user = Cleaner.create 
   end   
   @registration.user = user 
   @registration.save 
   // this is in dire need of a refactor, but keeping it explicit for now : ) 
end
```
