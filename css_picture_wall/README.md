#Learning Goals
This assignment is meant to refresh your HTML and CSS understanding, as well as allow you to:

Become more familiar with the box model
Learn about and use Sass (SCSS)

##Setup
Skeleton located at: https://github.com/lighthouse-labs/lighthouse-picture-wall.

You will use it to create a photo wall of Lighthouse staff. Hi-res photos of all of them can be found in this folder. When you get to the part where you use these images, you will likely want to resize/crop and rename them to make them more web friendly. One suggestion I can make is to use the ImageOptim.app on Mac to quickly lower the quality of the images (after resizing them with something like Preview.app) for web, so that your git repo and images aren't larger than they need to be.

##Setting up SCSS
This project currently uses CSS directly, but most modern sites and apps now use a CSS pre-processor like Sass. There are two variants or syntaxes for Sass: SASS and SCSS. More on this here. We'll be using SCSS.

#Steps:
###Step 1

Create an empty directory called scss which will contain the scss files. Within that directory, create (touch) an empty .scss file called style.scss. SCSS files will be processed from the scss directory and output as CSS files into the css directory. Therefore, you will not be dealing with (creating/updating) files in the css directory manually.

###Step 2

Copy/paste the contents of style.css into style.scss. Note: Even though this file is not (yet) using any SCSS features (like nesting), it’s still valid SCSS. This is because the SCSS syntax is a superset of CSS syntax. In other words, it supports all of CSS but then has additional syntactical features that CSS alone cannot provide. Delete the style.css file from the css folder.

###Step 3

Start up the sass command line tool to watch and automatically convert all scss files in the scss directory into css files stored in the css directory. Run the following command from your project directory:

sass --watch scss:css --poll
Note: The last command will take up the terminal unless and until terminated (Ctrl + C) since it's continuously running and watching for any changes to the scss directory. It should also be run within the lighthouse-picture-wall root, not the scss or css directories. You will want to keep it running, so start about another terminal tab and start up another vagrant ssh session (Windows users, this means starting up a separate PuTTy session)

Note: The --watch flag is for vagrant. Normally you don't have to specify the --poll flag but you have to because of issues with running the sass --watch command in vagrant. If you are not using a virtual machine, you can exclude the --poll flag from the command.

For more information on using the command line tool, read this: http://sass-lang.com/documentation/file.SASS_REFERENCE.html#using_sass

###Step 4

Using Sublime, confirm that a new style.css file was automatically created in your project’s css folder, because of the sass command line tool that you just ran. If you don’t see the file, try refreshing the project (Project > Refresh Folders).

###Step 5

Open the index.html file in chrome and ensure that it is showing you a (very basic) picture page that looks something like this:

Screenshot

Reminder: Now is probably a good time to add, commit and push your changes.

###Step 6

Append some simple, nested scss into your style.scss file:

$primaryColor: #FF0000;
body {
  h1 {
    color: $primaryColor;
  }
}
Confirm that the style.css has been updated with vanilla CSS automagically.

###Step 7

Go back to the original terminal/PuTTy SSH session where the sass command is still running, and observe the output, which will look something like:

Screenshot

###Step 8

Invalid SCSS syntax results in an failure output and an error message to show up in the output css file. Make a change to the style.scss file but this time making it invalid (using a bad variable name):

$primaryColor: #FF0000;
body {
  h1 {
    color: $primary;  // $primary doesn't exist!
  }
}
Go back to the sass command and notice the error output:

Screenshot

Glance at the CSS file in sublime to see what it looks like when it’s corresponding scss file is invalid / has an error.

Open/refresh the index.html file in the browser and observe that sass gives you feedback even in the browser, by updating the css to add debug info infto the body tag:

Screenshot

Undo/remove the addition of the invalid scss we just added, since it was for illustration purposes only. Ensure that the resulting style.css is corrected automatically after saving our changes, and the page resumes working as it was before.

Done. Let's move on!
Now you have your SCSS preprocessor tool running to make life easier by not having to manually write vanilla CSS in this project. You also know what to expect from the preprocessor when your SCSS has invalid code / syntax errors.

It's important to also realize that without the scss command running in the background, your css files in the css folder will not stay up to date with your scss files in the scss folder, and become stale. Since the browser only knows about and loads the css file, your browser would then not be able to show you any style changes made to the scss file.

It's a good time to add, commit and push your changes to your fork on github.

##Part I
Convert the scss file content to be more “Sassy”. We mentioned previously how it’s really just CSS at the moment and we are not making use of any SCSS features (like nesting selectors). So let’s modify the style.scss file and “Sass it up!” (get it?).

If you don't recall much about scss and need a refresher, don't panic! Please revisit Step 6 in Section 1 of the prep course, which introduced you to it.

##Part II
The following tasks should be accomplished using CSS3 and without the use of any JavaScript. Please remember to commit and push each task up before proceeding to the next one.

###Task 1 - Student Photos

Replace team with pictures and names of staff members.

Feel free to take headshots using your own phones or cameras. You will likely need to add a bunch more member divs to account for all the staff.

###Task 2 - Hover Effect

Upon hover, display the funky filtered version of the person’s image.

Create alternate images for each headshot, using software like Photoshop or iPhoto. You can also google around for a free online photo editor (eg: http://www.fotor.com )

###Task 3 - Bio Page (Optional)

Link each photo to a separate page, which displays their full bio. The bio page should include a picture of the staffer (be creative: use a different picture, etc ) as well as a paragraph or two about them. Feel free to write crazy fictional bios or ask them for theirs.

##Part III
In this section you will utilize CSS3 to make the page even more snazzy. Again, no JavaScript should be used to accomplish this. Please remember to commit and push each task up before proceeding to the next one.

###Task 4 - Some Basic Improvements First

Use CSS3 styles to add rounded or circular border around the avatar image. Perhaps add a drop shadow. Be creative and play around with the settings in Chrome (using the Developer Tools) before applying them to your CSS.

###Task 5 - Hover-based Transformation

Apply a hover effect to the members so that when someone mouseovers any member div, it rotates/tilts, grows, changes border colour, etc or a combination of that. Use of CSS3 transforms is encouraged.

Transition the effect so that the transformation is not sudden.

Example: The picture rotates right a few angles and becomes slight bigger (using scale property) over 1 second. It should transition back to its original state smoothly when you hover off it.

Feel free to search around for cool CSS3 transform ideas or implementations that are advanced and adapt them to your need.

###Task 6 - Alternate hover effect (Optional)

Create a separate hover effect that in the same way that you did in the previous task. Make it only applicable to odd members (first, third, fifth) and make the previous effect only active for even members (second, fourth, sixth).

Note: The CSS should be created such that adding, removing and shuffling the member divs does not break the above requirement Additional members should. In other words, don’t define a separate CSS class for the new animation that must be added to alternative member divs. Instead, consider using the power of CSS3.
