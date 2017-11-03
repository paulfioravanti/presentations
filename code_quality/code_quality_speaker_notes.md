## [Slide 1](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=1)

I’d like to talk to you a bit about Code Quality, and the tools and services that I have used to try and increase the quality of my code, and make me a better coder.

\# [Image source](http://www.osnews.com/story/19266/WTFs_m)

## [Slide 2](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=2)

I think the concepts of so-called code quality, and what is “good” code, are very ambiguous.  One person’s code perfection can sometimes be another’s bad code, so I’m not going to attempt to answer broad questions on what is quality.
Instead, I’ve tried to narrow the quality concept down into a asking a few questions about my code to hopefully make it a bit more manageable for someone like me who is neither a code quality or security expert. 

\# [Image source(?)](http://imgur.com/gallery/y7Hm9)

## [Slide 3](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=3)

I think the questions I need to ask are about what quality-related issues don’t I know about my code? 

- Did the tests I write actually test all my code? I certainly intended to, but how do I know?
- Is my code actually any good? Does it conform to “generally accepted” good coding practices? 
- Is my code secure enough to show its face in public?

I was told once by one of my lecturers when I studied computer science that you should "always attempt to... 

## [Slide 4](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=4)

...break your code, because there are plenty of people out there who will happily attempt to on your behalf”. So, given that I am only human, I feel like I need some kind of...

\# [Image source(?)](http://www.quickmeme.com/meme/3qaf36/)

## [Slide 5](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=5)

...quality enforcer, who will look over my shoulder and tell me if the code I’m writing is any good or not, and whether I’m testing enough. So, I went searching for a solution....

\# Image source: screenshot from the movie Swordfish, the most *realistic* hacking movie ever.

## [Slide 6](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=6)

The first one I found was metric_fu, which is a one stop reporting suite that pulls in and displays data from many different kinds of gems that poked, proded, and tested your code.

## [Slide 7](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=7)

Unfortunately, metric_fu itself seems to only support Ruby 1.8 and not 1.9, and furthermore the last commit to the repository was done 2 years ago.  This seemed like a shame given what it did for you...

## [Slide 8](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=8)

..so I went out and tried to see if there was a Ruby 1.9 equivalent, and I was pointed in the direction of a gem called Metrical. 

## [Slide 9](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=9)

So, I went and checked it out and found that it wasn’t being maintained anymore due to many of the gems that comprised all the metrics and reporting not supporting Ruby 1.9. 
I wasn’t planning on going back to using Ruby 1.8 for the sake of some tools, so where does that leave us for testing current Ruby and Rails apps? 

## [Slide 10](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=10)

Well, Ruby Toolbox is pretty much a one stop shop to find out about this, so if we have a look at what’s popular with code quality metrics here, we can see SimpleCov, a code coverage tool at #1, and Rails Best Practices, a code quality tool at #2, and I’ll talk about both of them. 
RCov, like SimpleCov, is a code coverage tool for Ruby 1.8 only; metric_fu you know, and then there's reek, which is a code smell detector for Ruby that I’ll briefly touch upon; 

## [Slide 11](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=11)

As for security tools, I’ll cover #1 ranked Brakeman as my tool of choice. 

## [Slide 12](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=12)

I’ll also cover a couple of (free for open source) non-gem services that you can hook your application into to get more insight into your code’s quality, including:

1. Code Climate 
2. Gemnasium 
3. Travis CI

So, let’s first take a look at Code Quality Metrics Tools. 

## [Slide 13](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=13)

First up is SimpleCov, which is a code coverage analysis tool for Ruby 1.9. 

## [Slide 14](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=14)

To use it, you simply include it in your **Gemfile**’s `test` group, then run `bundle install`.  
Then, include it in your **test_helper.rb** or **spec_helper.rb** file and make a call to `SimpleCov.start`, or `SimpleCov.start ‘rails’` for Rails apps. 

\# Simplecov is used to create reports, but isn't usually used from within the ruby/rails, so it’s not necessary to include it in every process.  It needs to be run from the command line but not from within the code. 

## [Slide 15](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=15)

Once you’ve done that, run your tests and SimpleCov will generate a code coverage report for you (in this case for just a simple programme that checks credit card numbers).  
Here, we can see that we’re at 70% coverage, so let’s have a look and see where I fell short. 

## [Slide 16](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=16)

This is the generated report, which gives the overall percentage of code that has been touched by the tests, and breaks that percentage down on a per-file basis. To find out specifically what lines of code are not covered by the tests...

## [Slide 17](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=17)

...simply click on the file to drill down and check out any lines marked in red.  The numbers here to the right tell you how many times your tests touch this code. So, if you write more tests to cover that code...

## [Slide 18](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=18)

...you’ll be back in the green.  
But, does doing that, or even getting 100% code coverage mean you have adequately tested your app or written enough tests? Unfortunately, the answer is not necessarily.

## [Slide 19](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=19)

Just because you have tests that cover all of your code, does not mean that it can’t be broken or that your tests are robust, and I think that underlies a theme within all of these tools and that is that they are just that: tools; they may find stuff out about your app that you don’t know, but they don’t know everything.  
They have helped me enormously in getting the quality of my app and their tests up and I wouldn’t do without them, but they are not the be-all and end-all. 

## [Slide 20](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=20)

However, the value of using the SimpleCov gem is that it doesn’t let any code fall through the cracks, and it will make you go back and re-examine your tests, and get you to try and make them as thorough as possible.

## [Slide 21](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=21)

So, from code coverage to probably the most subjective gem I’ll cover: Rails Best Practices, a code metric tool to check the quality of your Rails code.  Who determines quality in this case...? 

## [Slide 22](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=22)

Users of the Ralls Best Practices website do by submitting their best practices, voting on them, and then some of them get added to the gem.  
Are the best practices any good? My personal opinion is that in general they’re good, enough so that I add the gem to all my projects. If I don’t like some of the warnings that I get, or think they’re too nitpicky, I simply choose to ignore or disable them in the config. 

## [Slide 23](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=23)

To use this gem, simply add it to the `development` group in your Gemfile and run `bundle install`.

## [Slide 24](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=24)

You can run a report quickly in the console by simply using the `rails_best_practices` command, useful for when you expect only a small amount of issues.  

## [Slide 25](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=25)

Otherwise, you can generate a more useful html report which looks like this.  
Here, we can see a list of best practice issue types at the top of the screen, and the full list below, and we can filter out issues we’re perhaps not interested in. Each issue raised has a link...

## [Slide 26](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=26)

...to the appropriate discussion thread on the Rails Best Practices website to get more info on what the issue means and hopefully why was raised. 

## [Slide 27](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=27)

I usually forget to run Rails Best Practices reports before I make pushes up to Github, so instead I use a service hook to the Rails Best Practices service, by the same author of the gem, called Railsbp.com. 

## [Slide 28](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=28)

Every time I make a push to my repo, Railsbp will send me an email with how many issues I have and a link to the report generated by the service...

\# [Image source (screenshot)](http://youtu.be/IRand6upNfw)

## [Slide 29](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=29)

...which looks pretty much exactly like the locally generated report.

## [Slide 30](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=30)

Instructions on how to set this up are in your Github repo's Settings, then under Service Hooks, then under Railsbp.

## [Slide 31](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=31)

Speaking of services, the Code Climate service is another great way to get code quality metrics on your Ruby and Rails projects.  It is a paid service, but it’s free for open source repositories, so there’s no reason not to use it. 

## [Slide 32](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=32)

All you need to do is go to their site sign up page...

## [Slide 33](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=33)

...add your Github repo, and they’ll import your code, run their reports and email you when they’re ready for you. 

## [Slide 34](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=34)

The high-level reports they provide give you an overall GPA grade, a grade of A-F for all your classes and modules...

## [Slide 35](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=35)

...and the main code smells found. 

## [Slide 36](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=36)

Drilling down into the issues of individual classes gives you an statistical overview of the main problems, and where in the code they are. It’s then up to you to get on and fix them up. 

## [Slide 37](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=37)

The final code quality gem I’d like to introduce is reek, which I have found useful for pure Ruby projects. 
It performs a similar function to Code Climate, but in my experience, it finds interesting issues that Code Climate didn’t seem to, which has then led me to perform refactorings such as abstracting out functionality into it’s own class, or re-evaluating how many case or if statements I have that test the same value. 

## [Slide 38](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=38)

To use Reek, simply install the gem and run the `reek` command to output your report in the console, which will look something like this.  Like the other reports, it will give you a list indicating where and what the issues are, along with a named smell type.

## [Slide 39](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=39)

The repo’s code smells wiki is an excellent reference guide for all these smells, and I highly recommend having a look at it in detail, even if you don't intend on using Reek, as I learnt quite a lot from the entries.

\# [Image source](http://www.flickr.com/photos/danandkir/316158013/)

## [Slide 40](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=40)

Now, we’ll have a brief look at the security side of things with Brakeman, which is "an open source vulnerability scanner specifically designed for Ruby on Rails applications.  It statically analyzes Rails application code to find security issues at any stage of development."  
Like I said before, I am not a security expert at all, so although I don’t expect Brakeman to protect my apps completely from all attacks that could be leveled against it, I think it’s really useful in making sure that I don’t inadvertently code any known or obvious vulnerabilities into my app.

## [Slide 41](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=41)
 
Much like Rails Best Practices, you can use Brakeman by adding it to the `development` group of your **Gemfile** and running `bundle install`.  
You can generate reports through the console by running the brakeman command by itself, or you can output to a html report. 

## [Slide 42](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=42)

The author of Rails Best Practices and its service also has a Rails Brakeman service, which you can hook up to your Github repo in exactly the same way...

## [Slide 43](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=43)

...so that you’ll get a security report emailed to you upon every commit to Github.

\# [Image source (screenshot)](http://youtu.be/IRand6upNfw?t=29s)

## [Slide 44](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=44)

So, let’s take a look at the parts of the html report.

## [Slide 45](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=45)

Like the other reports, you get an overview of in which types of files your issues are in, and how many of each kind of issue you have. 

## [Slide 46](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=46)

For each individual issue, Brakeman tells you how confident it is that the issue is a problem by denoting them as High, Medium or Weak confidence.  It also shows you where the issue is and what type it is, with a link to the issue explanation on their website.

## [Slide 47](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=47)

Here we can see couple of different types of warnings from mass assignment to cross-site scripting, some of them are telling you to look at parts of the code, while others are telling you to upgrade Rails version due to vulnerabilities found in Rails itself in the version being used.  
Brakeman will also look at issues in your models and views, and give you similar warnings.

## [Slide 48](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=48)

If the issue is with my code, I can see the specific area where the vulnerability is detected by clicking on the message text, so here I can see I have a possible unprotected redirect due to interpolating user facing data directly into a url, so if I want to find out more info, I just click on the warning type link...

## [Slide 49](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=49)

...which goes to the Brakeman website, investigate more about the issue, and hopefully find a solution to the problem.
As opposed to the Best Practice report, where I’m not too fussed if I have an issue list, I usually try to make sure there are no warnings (or at least no high confidence warnings) given the difference in importance between your app’s security and coding best practices.

## [Slide 50](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=50)

I have come across false positives before, but asking around StackOverflow or the Brakeman repo issues list has always gotten me a solution.

## [Slide 51](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=51)

So, like all the other tools, it’s not perfect, so don’t panic too much if code *you* are confident is fine raises an issue because it could be a false positive.  But, I would advise to just search around and make sure before you ignore a warning. 

## [Slide 52](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=52)

Finally, two other services that I also use in service of my apps are Gemnasium, which is a service that learns your gem dependencies, listens for new versions of those gems...

## [Slide 53](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=53)

...and notifies you when they’re released. Handy to make sure that you’re staying up to date on all your dependencies...

\# [Image source (screenshot)](http://youtu.be/IRand6upNfw?t=40s)

## [Slide 54](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=54)

And also Travis CI, an essential tool for me in continuous integration (that could be the basis of a presentation unto itself) that I use to run my RSpec test suite and recently got around to configuring it to deploy directly to Heroku if all tests pass. It’s a really awesome tool, and if you haven’t tried it already, I can’t recommend it enough. 

## [Slide 55](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=55)

As a bonus for using so many different code quality services, and if you like this sort of thing, you can put nice badges on your app Readme pages to prove your builds are passing, the app is secure, gems are up to date (in my case not quite), and show what Code Climate thinks of the app.  
So amazing... ;-)

## [Slide 56](https://speakerdeck.com/paulfioravanti/code-quality-tools-and-services?slide=56)

To recap, I've given you a very high level introduction to the code quality and security
gems and services that I use in development in an attempt to make my apps better. 

- SimpleCov - code test coverage gem 
- Rails Best Practices - coding quality gem/service 
- Code Climate - code metrics service 
- Reek - code smells gem 
- Brakeman - app security gem/service 
- Gemnasium - gem manager service 
- Travis CI - continuous integration (and deployment) service 

All these gems and services are worthy of your time to take a deeper look into them, as I think regardless of the subjectiveness of code quality, they can help your codebase improve.  
