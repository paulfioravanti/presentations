theme: Courier, 6
footer: *@paulfioravanti*
slidenumbers: true

# [fit] Service
# [fit] Modules

## A minor refactoring

^
Let's talk about services

---

![fit](https://www.dropbox.com/s/apmdya58uvwuma9/rails_logo.png?dl=1)

^
In plenty of Rails applications, you will find...

---

# [fit] Service
# [fit] Classes

^
Service Classes. Presentations about them have been done to death, but to quickly recap:

---

```ruby
class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user &&
      BCrypt::Password.new(user.password_digest) == params[:password]
      sign_in user
      redirect_to dashboard_path
    else
      flash[:alert] = "Login failed."
      render "new"
    end
  end
end
```

^
- Let's say I have a controller class like this with a method that's responsible for creating a new session for a user

---

```ruby, [.highlight: 3]
class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user &&
      BCrypt::Password.new(user.password_digest) == params[:password]
      sign_in user
      redirect_to dashboard_path
    else
      flash[:alert] = "Login failed."
      render "new"
    end
  end
end
```

^
I attempt to find the user account from the email param that I'd get from a form...

---

```ruby, [.highlight: 5-6]
class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user &&
      BCrypt::Password.new(user.password_digest) == params[:password]
      sign_in user
      redirect_to dashboard_path
    else
      flash[:alert] = "Login failed."
      render "new"
    end
  end
end
```

^
...and if the user account is valid and the provided password matches the user's password...

---

```ruby, [.highlight: 7-8]
class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user &&
      BCrypt::Password.new(user.password_digest) == params[:password]
      sign_in user
      redirect_to dashboard_path
    else
      flash[:alert] = "Login failed."
      render "new"
    end
  end
end
```

^
I sign them in and redirect them to their dashboard page.

---

```ruby, [.highlight: 10-11]
class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user &&
      BCrypt::Password.new(user.password_digest) == params[:password]
      sign_in user
      redirect_to dashboard_path
    else
      flash[:alert] = "Login failed."
      render "new"
    end
  end
end
```

^
and if there is no user or their password is wrong, I'll give them an error message and get them to try again.

---

```ruby
class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user &&
      BCrypt::Password.new(user.password_digest) == params[:password]
      sign_in user
      redirect_to dashboard_path
    else
      flash[:alert] = "Login failed."
      render "new"
    end
  end
end
```

^
- Nothing particularly exciting going on here
- but there is one line of code that makes me think it doesn't belong in a controller and could be extracted out into a service.

---

```ruby, [.highlight: 5-6]
class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user &&
      BCrypt::Password.new(user.password_digest) == params[:password]
      # ...
    else
      # ...
    end
  end
end
```

^
- It's the code here dealing with the BCrypt library and the general concept of authenticating a user.
- Rather than giving the controller the responsibility of authentication, and the knowledge about things like the BCrypt library, let's extract this out into a small `UserAuthenticator` service, so we can potentially use it elsewhere.

---

```ruby
class UserAuthenticator
  def initialize(user)
    @user = user
  end

  def authenticated?(unencrypted_password)
    return false unless @user

    BCrypt::Password.new(@user.password_digest) ==
      unencrypted_password
  end
end
```

^
Here's the implementation, where we initialize the service with a user and offer an `authenticated?` method that will use the BCrypt library that can validate a passed in password.

---

```ruby, [.highlight: 5]
class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if UserAuthenticator.new(user).authenticated?(params[:password])
      # ...
    else
      # ...
    end
  end
end
```

^
And back in the controller, we switch out our code to use the service...

---

```ruby
class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if UserAuthenticator.new(user).authenticated?(params[:password])
      sign_in user
      redirect_to dashboard_path
    else
      flash[:alert] = "Login failed."
      render "new"
    end
  end
end
```

^
...and now everything is in its right place...

---

![original filtered 102%](https://www.dropbox.com/s/6kjmt4zyf1x3vf8/new_service.png?dl=1)

# [fit] :+1:

^
...so big thumbs up to that.

---

# [fit] BUT

^
But...

---

```ruby, [.highlight: 5]
class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if UserAuthenticator.new(user).authenticated?(params[:password])
      # ...
    else
      # ...
    end
  end
end
```

^
- ...something just doesn't sit right with me about this code, so let's do some nitpicking.
- We're calling `new` on the service, passing in the user, only then to immediately call the `authenticated?` method...and then nothing.
- The only reason we're initialising an object is to call that method
- We're not doing anything with it afterwards.

---

```ruby
authenticator = UserAuthenticator.new(user)
authenticator.authenticated?
```

^
- When I initialize an object, I tend to assume I'll need it, and its state, to hang around for more than one method call.
- For an authenticator...

---

```ruby
authenticator = UserAuthenticator.new(user)
authenticator.authenticated?
authenticator.two_factor_enabled?
```

^
...maybe I need to ask it if 2-Factor authentication is enabled for that user...

---

```ruby
authenticator = UserAuthenticator.new(user)
authenticator.authenticated?
authenticator.two_factor_enabled?
authenticator.authenticate_with_facebook
```

^
...or if they need to authenticate with a service like Facebook.

---

```ruby, [.highlight: 5]
class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if UserAuthenticator.new(user).authenticated?(params[:password])
      # ...
    else
      # ...
    end
  end
end
```

^
- But this service is use-once and throw away
- Which makes me wonder if we can get away with not creating an object while still getting what we want.
- Can we, say, change the interface to get rid of the call to `new`, like this...

---

```ruby, [.highlight: 5]
class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if UserAuthenticator.authenticated?(user, params[:password])
      # ...
    else
      # ...
    end
  end
end
```

^
- ...so that we can explicitly say that this is just a function that takes in some parameters and returns some value?
- Let's go back to the service class and see what we can do...

---

```ruby
class UserAuthenticator
  def initialize(user)
    @user = user
  end

  def authenticated?(unencrypted_password)
    return false unless @user

    BCrypt::Password.new(@user.password_digest) ==
      unencrypted_password
  end
end
```

^
So, first thing we need to do if we don't want to call `new` is to get rid of the initializer.

---

```ruby
class UserAuthenticator
  def authenticated?(unencrypted_password)
    return false unless @user

    BCrypt::Password.new(@user.password_digest) ==
      unencrypted_password
  end
end
```

^
Now we've lost the user from the initializer, we need to add it in to the arguments of the `authenticated?` method...


---

```ruby, [.highlight: 2]
class UserAuthenticator
  def authenticated?(user, unencrypted_password)
    return false unless @user

    BCrypt::Password.new(@user.password_digest) ==
      unencrypted_password
  end
end
```

^
...and we'll change the instance variable `@user` references to use the passed in `user` parameter...

---

```ruby, [.highlight: 3-6]
class UserAuthenticator
  def authenticated?(user, unencrypted_password)
    return false unless user

    BCrypt::Password.new(user.password_digest) ==
      unencrypted_password
  end
end
```

^
...and finally, change the method name to be a class method with `self.`

---

```ruby, [.highlight: 2]
class UserAuthenticator
  def self.authenticated?(user, unencrypted_password)
    return false unless user

    BCrypt::Password.new(user.password_digest) ==
      unencrypted_password
  end
end
```

---

```ruby
class UserAuthenticator
  def self.authenticated?(user, unencrypted_password)
    return false unless user

    BCrypt::Password.new(user.password_digest) ==
      unencrypted_password
  end
end
```

^
...and here is the finished refactor.

---

![original filtered 104%](https://www.dropbox.com/s/6bygvgdrgyc6igm/user_authenticator.png?dl=1)

# [fit] :+1:

^
More thumbs-up.

---

```ruby, [.highlight: 5]
class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if UserAuthenticator.authenticated?(user, params[:password])
      # ...
    else
      # ...
    end
  end
end
```

^
Back in the controller, we're now using the `authenticated?` class method, and not creating any objects for that service.

---

# [fit] BUT

^
But...

---

```ruby
class UserAuthenticator
  def self.authenticated?(user, unencrypted_password)
    return false unless user

    BCrypt::Password.new(user.password_digest) ==
      unencrypted_password
  end
end
```

^
Something about this class still feels wrong...

---

```ruby, [.highlight: 1]
class UserAuthenticator
  def self.authenticated?(user, unencrypted_password)
    return false unless user

    BCrypt::Password.new(user.password_digest) ==
      unencrypted_password
  end
end
```

^
- ...and the reason for that is that this service is a class.
- Classes exist to initialise and create objects, and we're not doing that anymore.
- So, in this case...

---

```ruby, [.highlight: 1]
module UserAuthenticator
  def self.authenticated?(user, unencrypted_password)
    return false unless user

    BCrypt::Password.new(user.password_digest) ==
      unencrypted_password
  end
end
```

^
...we can use a straight `module`.

---

```ruby
module UserAuthenticator
  def self.authenticated?(user, unencrypted_password)
    return false unless user

    BCrypt::Password.new(user.password_digest) ==
      unencrypted_password
  end
end
```

^
- Modules can't be initialised, so we're explicitly saying here that any methods here should preferably be just pure functions that don't rely on any object state.
- There's just one more minor nitpick refactor we can make for Ruby style-guide compliance...

---

```ruby, [.highlight: 2]
module UserAuthenticator
  module_function

  def self.authenticated?(user, unencrypted_password)
    return false unless user

    BCrypt::Password.new(user.password_digest) ==
      unencrypted_password
  end
end
```

^
- ...and that's adding the `module_function` declaration
- which means we're explicitly saying that the module name `UserAuthenticator` is meant to be the receiver when calling any of these functions

---

```ruby, [.highlight: 4]
module UserAuthenticator
  module_function

  def authenticated?(user, unencrypted_password)
    return false unless user

    BCrypt::Password.new(user.password_digest) ==
      unencrypted_password
  end
end
```

^
...so we can now then get rid of the `self` part of the method names...

---

```ruby
module UserAuthenticator
  module_function

  def authenticated?(user, unencrypted_password)
    return false unless user

    BCrypt::Password.new(user.password_digest) ==
      unencrypted_password
  end
end
```

^
...and we now have our module of pure functions.

---

```ruby, [.highlight: 5]
class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if UserAuthenticator.authenticated?(user, params[:password])
      sign_in user
      redirect_to dashboard_path
    else
      flash[:alert] = "Login failed."
      render "new"
    end
  end
end
```

^
...the callout to the now-service module stays the same...

---

```ruby
class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if UserAuthenticator.authenticated?(user, params[:password])
      sign_in user
      redirect_to dashboard_path
    else
      flash[:alert] = "Login failed."
      render "new"
    end
  end
end
```

^
And that is the finished product. So, when you're writing or extracting services for your application, try asking...

---

# Do you
# [fit] _*REALLY*_
# need that OBJECT?

^
...do you really need that object?

---

# __**`if not`**__, go
# [fit] **`module`**

^
and if not, consider simplifying your code with straight modules.

---

![right](https://www.dropbox.com/s/5w770gu31uw33l9/nekobus_headshot.jpeg?dl=1)
# [fit] Thanks!
# [fit] __`@paulfioravanti`__

^ Questions
