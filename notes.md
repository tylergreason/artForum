## 5 models 
- 1 many-to-many 
- 1 one-to-many 

## Full crud on one model, partial crud on all models

## Validations 

## MVC Implementation 
- Lean controllers 
- Helper methods in models 
- DRY views 

## Authorization 
- Authentication (sign in capabilities)

## Read Me 
- Think: someone should get a good idea of the app in 30 seconds. Interviewers will ask you to defend your code on the spot. 

## Pitch 
- Project description 
- Schema (models, relationships, attributes)
- At least (!) 4 user stories for 4 crud actions 
- Weekend plan - what am I going to work on this weekend? They'll help with structuring. 

--- 

_Need_ to have more than the minimum requirements. User should be able to navigate the entire app start to finish. 

Look at Bulma/bootstrap for front end prettiness, **no javascript**. 

---
# IDEA 1: BOOK SITE 

A site for users to view books, save books to their collections, and follow other users.

## USER STORIES 

Users can: 

- Create collections to store books. Write a short blurb for this collection (use parameters to limit length of blurb). Mark lists as private so other users cannot see them (use helper method in Collection class to return list of public collections). 

- View books via searches using the Google Books API. 

- Change the books in their collections: add books, delete books, edit the collection's blurb. 

- Delete books from lists, or delete entire lists. 

- Follow other users, and see the activity of the users they follow in their feed. 

- Users that are not logged in will not be able to edit collections. Users will not be able to edit other user's collections. 

---
# IDEA 2: ART FORUM 

A site for users to discuss images of daily-posted art pieces, follow other users, and create a collection of their favorite pieces. 

## USER STORIES 
SEPARATE THESE INTO INDIVIDUAL STORIES 
- As a user, I want to view photos of art pieces. (Read)
- As a user, I want to comment on art pieces. (Create)
- As a user, I want to edit my comments. (Edit)
- As a user, I want to delete my comments. (Destroy)
- As a user, I want to be able to find more information about the piece or artist through provided links to their sources or Wikipedia articles (if available). 
- As a user, I want to be able to view my profile, including images I have commented on and my favorite images. (Read) 

## SCHEMA

### RELATIONSHIPS

User -< Comment >- Image

User >- Favorite_Image -< Image 

<!-- User -< Follower  -->

### ATTRIBUTES 

- User 

  - First name 

  - Last name 

  - Email 

  - Location (string) 

  - Biography (limit to 250 char)

- Image 

  - ~~Source~~

  - URL

  - Link to Metropolitan page for that piece 

  - Artist 

  - ~~Region (if available)~~ Removed for now, might add again later. 

  - Date created (by the artist) 

  - Blurb about the pieces (if available)

  - ~~date (the date the piece appeared on the site)~~ Removed because the timestamp that activerecord makes already serve this purpose. 

- Comment 

  - user_id 

  - image_id 

  - Comment text

- Favorite Image 

  - user_id

  - image_id 
<!-- 
- Follower 

  - user_id (of the following User)

  - user_id (of the followed User)  -->

## STRETCH GOALS 

- Stying before stretch goals! The presentation of the app is key! 

- As a user, I want to create more than one collection (more than just Favorite collection), and write about that collection. (Create, read, update, destroy) 

- Incorporate more sources and view images sorted by their source (different museums, Behance, Dribble, etcetera).  

- As a user, I want to select other users to add to my Following list and have the ability to remove those users. (Edit, destroy). 

## WEEKEND PLANS 

- Get caught up on some labs. 

- Work on finding the right API and learning how to use it. 

# TODO 

[ ] Finish views. 

[ ] Add yield description, for navigation bar. 

[ ]  Figure our when the day's image would be generated. 

    - Maybe it check to see if there is an image in the database for today's day at the beginning of the day, and if not, it generates that image? 

## Views: 

- User: 

  - Index: List all users and their most recent comment. User name links to their profile. The first 30 characters of their bio are displayed. 

  - Show: User name, location, bio. List of the comments they have made including the name of the piece and the text of the comment, and the comment time and date. List of links to the user's favorite pieces. 

  - Edit: Only accessable if the user of the ID is logged in. Lets them edit their name, email address, password, and remove pieces from their favorites list. 

  - Create: Rendered upon creating a new account. Requires name, email, password, and location. 

- Image: 

  - Index: Shows all images by the date they were posted. Should have images sorted into rows of 1 or 5-10 images depending on device width. Images are shown above their title, artist, the date they were posted. Crop/downsize the image using CSS. 

  - Show: Similar to above, but one, full-size image. Artist name is below the image, then date, then a link to The Met page for that piece. Below the image and its information are a list of user's comments ordered by their post date. Links to user's pages are available through each user's name. A text_field is placed below (maybe above?) the list of comments if a user is logged in, and allows them to post a comment. The page renders image_path(@image) after a comment is submitted to show it has persisted. Has small buttons on either side of the image to go to the next/previous day's image. 

  - ~~Edit:~~

  - Create: The logic for this is available in the Image model, but no view will be rendered for the creation of a new image. 

- Comment: 

  - ~~Index:~~ 

  - ~~Show:~~ 

  - Edit: Shows the user's name who made the comment above a text_field for the user to edit that comment. The logged in user's ID must match with the commenter's ID for this page to work. Throws error otherwise. 

  - ~~Create:~~ 

## Models

- User
  
  - has_many :comments

  - has_many :images, through comments 

  - has_many :favorite_images 

  - has_many :images, through :favorite_images 

  - Methods for: 

    - 

- Image 

  - next or previous_image methods: finds the image with a non-zero ID value that is one less or one more than the current view's ID, then displays that image's page. 


```
def next_image 
    # by the next day: 
    next_day = this.date

    next_id = self.id+1 
    # ?? 
    render :show[next_id]
end
```

  - Checking to see if an image has been generated for today: Check the last image in the images table (Image.all.last) and see if its date is before today. If it is, generate a new image object for that day. 

  - If we haven't reached the end of avilable images, make sure the new image ID isn't equal to any image that has already been used. 

    - Both of these issue could probably be resolved by pregenerating all the day's images, and making sure not to show any posts that were before the day they're being viewed. 