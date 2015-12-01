Sinatra
=============

## Getting Started

1. `bundle install`
2. `shotgun -p 3000 -o 0.0.0.0`
3. Visit `http://localhost:3000/` in your browser

An Introductory Sinatra Tutorial
Let's build our first web application. It will be built using Ruby of course, and we'll use Sinatra (a Rails like) framework to help us get up and running quickly.

###Launch the Web Server
Run the two commands in the README (in your vagrant machine of course).

You'll notice that running the shotgun -p 3000 -o 0.0.0.0 command, the program will output something like this:

== Shotgun/Puma on http://0.0.0.0:3000/
Puma 2.7.1 starting...
* Min threads: 0, max threads: 16
* Environment: development
* Listening on tcp://0.0.0.0:3000
The -p 3000 told it to start on port 3000 instead of the default 9393. That's just for our convenience. Don't worry about why for now.

You'll also notice that it does not quit. It's running in an infinite loop waiting for requests to process and respond to (kind of like a REPL). The CTRL+C key combo will send unix programs that are running in the foreground on your terminal (such as this one) a terminate signal to tell them to stop. This is the most common way to stop the web server on our local machine.

###Access your server (HTTP)
Anyway, the important part is that you can visit http://127.0.0.1:3000 in your browser and you'll see a home page that says "hello there".

Congrats! You have a web server running on your local machine. Cool eh?

Pro Tip: A more common alias for your local machine (127.0.0.1) is localhost, so you can instead visit http://localhost:3000/

###Initial Questions
Before we go further, let's address some questions you likely have at this point...

1. Why do we need a framework?
Frameworks like Sinatra do some of the heavy lifting for us. All web servers / applications need to do some low level grunt work (like speaking HTTP) but it would suck for all web developers to always handle this common logic every time they build a web app. Instead these commonalities have been extracted into a framework for us to use.

So in other words, similar to how ActiveRecord exists to take away the pain/effort of communicating (via SQL) with tables, Sinatra exists to take away the pain/effort of communicating (via HTTP) with web clients.

2. What does Sinatra do for us?
Sinatra is actually a very light-weight framework. Compared to Rails, which is a beast, Sinatra does very little "magic" for us. It's a great way to become familiar with web development or for building simpler/small apps that don't have too many pages. Even that's not totally true, but more on that another time.

3. Do real projects actually make use of Sinatra?
Hells ya! Take this opportunity to go check out Sinatra's home page: http://www.sinatrarb.com/.

But the following page will likely help answer your question directly: http://www.sinatrarb.com/wild.html

###Directory Structure
The skeleton app creates a logical directory and file structure so we don't just have one big ruby file (which by the way is possible with Sinatra!). Let's explore it a little though.

####Files & Directories of most importance:

app/models - ActiveRecord classes (data models) will be kept here. This shouldn't be new to you. (This shouldn't be new to you as you've seen it before with the Student Teacher assignment.)
app/views - Our HTML pages that are "rendered" by the app reside here. They are called views. More on this later :)
db/migrate - All migrations that are generated will be stored here. (This shouldn't be new to you as you've seen it before with the Student Teacher assignment.)
app/actions.rb - All the URLs and their logic is defined here. We've decided to call this file "actions". Another common name could be "routes". It's where we define how our web application is used by users. It's tres importante!
NOTE: The config.ru file is not in the list, but it's worth mentioning that this is the file that is initially run by the shotgun command and it is thus the "entry point" of the app. This ruby file just requires the Sinatra app and then runs it. It does not contain any of the application logic though... So you won't be modifying it at all, hence why I left it off the list above.

Examine: View Layouts
Go ahead and View Source (Command-Option-U) on the home page, using Chrome. Note how the HTML that is rendered & sent back from Sinatra is more than what you find in app/views/index.erb (Screenshot).

Open up the other view template in app/views called layout.erb to solve the mystery. It seems that the <%= yield %> in that file is exactly where the contents of index.erb are inserted. Kind of like string interpolation. Neat.

###Can you guess why?

#OKAY... LET'S BUILD OUR FIRST WEB APP!
We're going to build a simple open message wall that allows anyone to post messages on a wall to share with the world. Users won't need to register to post messages.

Follow the steps below on your own copy of the app... don't just read this. Most steps are also accompanied by a ★, which is a clickable link to the commit that corresponds with that change. You'll notice that the commit is on a repo that contains the completed sinatra app.

After each step you should commit and push your work.

##1. Create DB
Let's create our database by running the command: rake db:create. We'll be using SQLite3 for such as a simple app as this. The db file will reside in the db folder.

##2. The /messages URL ★
First, let's add a /messages path to our app where people will see a list of all messages.

In our actions.rb file, where all the paths (aka actions) are defined, add the following:

get '/messages' do
  'Message List here'
end
Now when you go to http://localhost:3000/messages you should see that content.

However, we'd like to render an HTML page so that we can separate our View logic from our other logic. Create an empty folder in app/views called messages and within it create an empty file index.erb. It's convention to call the list page an index page. It's an index of all the messages. Makes sense.

In the actions.rb file, instead of having the /messages action return just a hardcoded string, let's change that to tell Sinatra to render the correct HTML file:

get '/messages' do
  erb :'messages/index'
end
##3. The Model & Table ★
We need to store messages in our database. For this we need two things:

The DB table - Generate and run the migration to create messages table
The AR model - Create a Message class that inherits ActiveRecord::Base
We can run a rake command to generate a migration for our table:

rake db:create_migration NAME=add_messages
Open the newly created file in db/migrate and add the following code to the change method:

create_table :messages do |t|
  t.string :title
  t.string :author
  t.string :content
end
Save the file and run the migration using the rake command:

rake db:migrate
Create an empty file in app/models called message.rb and in it we define our AR model much like we have before:

class Message < ActiveRecord::Base

end
Examine: tux

We are using a gem called tux (link). Similar to how we used pry -r './config' before, we can use tux as a REPL to use our models.

If you prefer to use pry, you can also alternatively run this: pry -r './config/environment.rb'. I won't lie: Pry definitely has a nicer shell (Comparison screenshot).

So from now on if you see tux being referred, feel free to run that pry command instead. Anyway, in your tux shell, type Message to confirm that indeed the Message model/class is being loaded and is connected and understand the attributes/fields that we added to the db. The screenshot above actually depicts this happening.

Let's take this opportunity to create a message or two in the DB via our AR model. In tux run the following ruby code

Message.create title: "First message", author: "Someone", content: "KV is so cool"
Witness AR do it's thing and INSERT that record into the DB. Sweet!

Now let's get back to Sinatra... quit the tux session and make sure your shotgun command/server is running.

##4. Make /messages display all Messages ★
Every time a user sends an HTTP request to /messages, our server needs to load the messages from the database, render them as HTML, and send that HTML back as a response to their browser. Let's do that now.

Modify the /messages action (actions.rb file) to first load all the messages before rendering the HTML:

get '/messages' do
  @messages = Message.all
  erb :'messages/index'
end
Sinatra will magically make this @messages variable available in messages/index.erb, allowing us to keep our database communication logic in actions.rb and our view rendering logic in messages/index.erb. Sweet!

Let's add some code to the view (app/views/messages/index.erb) file:

<% @messages.each do |message| %>
  <div class="message">
    <h3><%= message.title %> <small>(by: <%= message.author %>)</small></h3>
    <p>
      <%= message.content %>
    </p>
  </div>
<% end %>
Whoa... what's this now? This is ERB at it's best. It's pretty simple, once you get used to it. We're dynamically creating HTML by having some Ruby embedded in the code. Here's a quick introduction to ERB by someone who's done a decent job; please read it. Their example shows that it can be used for more than just HTML, but no worries if that part's confusing or unclear at present.

Anyway, reload the /messages page in your browser to witness that the message we created in the DB from the command line is indeed being retrieved and displayed to the user. Awesome!

###Exercise: Add more Messages

Add a few more Messages using tux and with each addition, refresh the page to witness the message showing up upon refreshing the page.

##5. Submitting a message (Part A: The Form page) ★
Let's allow users to submit a new message. For this we need an HTML <form> with some <input> fields for the user to fill out prior to submitting the form to our server.

Let's create this page now.

Create an erb file in app/views/messages/new.erb and render it via a /messages/new URL path.

It should have a simple <form> like so:

<form>
  <div>
    <label>Author:</label>
    <input type="text" name="author">
  </div>
  <div>
    <label>Subject:</label>
    <input type="text" name="title">
  </div>
  <div>
    <label>Content:</label>
    <input type="text" name="content">
  </div>
  <div>
    <input type="submit" value="Submit">
  </div>
</form>
Don't worry if you've never created a <form> before. Just know that this is the only way for users to submit information to a web application. When you log in or sign up on Facebook, Twitter, Github, etc etc, you are filling out and submitting a <form>.

Let's also modify the index page to contain a link to our new action that contains the form:

<a href="/messages/new">Post a message... It's FREE (for now)!</a>
We still have to wire everything up but let's commit what we have now.

##6. Submitting a message (Part B: The POST action) ★
We usually want forms to submit some new data to the server, like in this situation, and hence the submission should perform an HTTP POST request to the server, so we have to tell Sinatra to accept this action.

Let's write the code necessary to make the base case work first, then go over how it works.

First, add an action that handles the post request to actions.rb:

post '/messages' do
  @message = Message.new(
    title: params[:title],
    content: params[:content],
    author:  params[:author]
  )
  @message.save
  redirect '/messages'
end
Second, modify the <form> tag to tell it where and how to submit the data to the server:

<form method="post" action="/messages">
Third... wait no that's it. Refresh the /messages/new page in the browser and try to submit it. It should work, and every time you submit it should take you back to /messages. Holy shit.

####Okay, what happened?

When the user submits the form, the browser sends an HTTP request to the URL specified by the form's action, using the method attribute for the HTTP method/verb (POST vs GET).

Sinatra receives the request and looks for the appropriate action that was registered to handle this request. Coincidentally, our post '/messages'

In our action, we leverage ActiveRecord to create a message record in our database. The fields that are submitted from the form are provided by Sinatra as a params hash. The key of hash equates to the form input's name attribute and the value is of course the value of the input field.

###Exercise: pry it up

Put in a binding.pry inside the action and resubmit another message. Notice how the browser spinner continues to wait while Sinatra hangs there in your terminal waiting for you to inspect and eventually exit pry.

Just like with regular ruby code, the binding.pry has paused the program in its tracks. The browser continues to wait for the response. Type in params into the pry session and notice all the KVs that come up (Screenshot).

Once you're satisfied with it, exit pry so the request to submit the message can be completed.

##7. Message details page ★
Let's make it so that we can click on the message title to go the message details page, where we would ideally see additional information about the message.

Modify the HTML where the messages are listed so that the <h3> contains a link (<a>) element:

<h3><a href="/messages/<%= message.id %>"><%= message.title %></a> <small>(by: <%= message.author %>)</small></h3>
Take some time to look at what we're attempting to do. Refresh the index page and view it's source to see the output.

Let's add a get action that can respond to a URL like /messages/5. Instead of defining an action for each potential message ID, which would be insane, we will just define one action that will accept any ID in the URL. Check it out:

get '/messages/:id' do
  @message = Message.find params[:id]
  erb :'messages/show'
end
Important Note: Make sure it'd defined after the messages/new action in your actions.rb file (see commit).

The :id in the action path is special. It tells sinatra to match anything and give it back to us as a param. Since the :id is the record ID of the message, we can use AR's find method to grab it from the DB. Sick!

Now we implement the show.erb view template with some simple HTML+ERB that displays the details of @message:

<h1><%= @message.title %></h1>

<p>
  Author: <%= @message.author %>
</p>

<p>
  <%= @message.content  %>
</p>

<hr/>
<a href="/messages">Back to All Messages</a>
Give it a go. It should work. Yay!

###Exercise: Sinatra Gotcha (Order matters!)

Move/define the get '/messages/:id' before the get '/messages/new' and then try to go to the messages/new URL in your browser. Do you see an error page like this?

Based on this outcome, can you make some educated guesses as to why something like this would happen? Why does order matter for these 2 actions?

Move it back so that it's switched back to it's original position.

##8. Validation (Part A) ★
Right now we can create a message with all fields blank, which is not ideal. Let's fix that. ActiveRecord validations to the rescue!

We'll also have to modify our action so that it can handle a failure to save a record due to validation checks failing:

post '/messages' do
  @message = Message.new(
    title:   params[:title],
    content: params[:content],
    author:  params[:author]
  )
  if @message.save
    redirect '/messages'
  else
    erb :'messages/new'
  end
end
Convention is to redirect upon success, and render erb upon failure. So it shows you the form again if it can't save it.

If you try to save a message that is invalid, it won't let you do it now, but it's quite the shitty UX (User Experience): 1. The user has to refill the form 2. The user is not provided any error feedback

Why does issue #1 occur? Try to answer this question before moving on to part B below, which fixes the issue. Doing so will help you better understand how web apps work (with Sinatra or otherwise).

##9. Validation (Part B) ★
Okay so let's modify the form so that it shows the errors.

Add the following code above the <form> tag in new.erb:

<% if @message && @message.errors.any? %>
  <div>
    <strong>Some issues with your message, please fix them:</strong>
    <ul>
      <% @message.errors.full_messages.each do |message| %>
        <li><%= message %></li>
      <% end %>
    </ul>
  </div>
<% end %>
What is it doing? Read it (multiple times if you have to) to answer this question. This should hopefully be something you can deduce based on your experience with ActiveRecord and your understanding of ERB.

NOTE: In case you are curious, the any? method is just something you can call on an array (Screenshot).

Give this a go. Try submitting an invalid message to witness the errors. Neat eh?

The form still clears though, we still need to fix that (next!).

##10. Validation (Part C) ★
The reason for the form clearing even when it is rerendered is that for a form input field to have a default value, it needs a value attribute set on it. So in the event that the form is being rendered for an existing message creation attempt, we need to default the values for each of the fields.

Let's modify our 3 form inputs to have a value from the @message object, like so:

    <input type="text" name="author" value="<%= @message && @message.author %>">
Do this for the other 2 inputs.

This should fix our issue. Do you know why we are checking @message before attempting to retrive the .author from it? Try removing it to see what happens.

##10. Validation (Part D)★
We've technically fixed both the issues with handling validation, but our code can be slightly cleaner. Take a look at the commit to see what was changed.

Why and how does removing the @message check in the view layer now work whereas in Step 9 above it did not work?

##11. Rejoice
Not bad... This is a good first cut. It's true that we didn't implement edit or delete actions. But they follow similar patterns and we'll tackle them in due time. Don't worry about them for now.

#Enhance!
Take it from here, making the following changes to the app.

Suggestion: Create a new git branch for each enhancement. Commit at logical points and definitely commit at the end of the feature. You can then merge in the enhancement into your master branch.

##1. Remove title field

We've decided to pivot our product and compete directly with Twitter. Tweets don't have a title. Let's remove that field completely.

##2. Add url field

Add a URL field . It should be optional (not required) when posting a message. If it's provided, a link will be displayed alongside our message allowing people to click it to visit that URL.

Bonus: Validate that it looks like an HTTP URL, and if it doesn't, don't let them create the message. Keep in mind that empty URLs are okay (since it's an optional field).

##2. Timestamp columns

We forgot the timestamp columns (created_at and updated_at) on Message, add them using a migration. Display the created_at on the details (show) page.

##3. "Other posts from this author"

Add an "other messages from this author" section to the show page. So it will retrieve other messages that have the exact same author string as the message being displayed.
