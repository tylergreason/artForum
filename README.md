Art Forum (working title) is a site for users to discuss images of daily-posted art pieces and create a collection of their favorite pieces. 

This is my second module project for Flatiron's Immersive Software Engineering program, meant to exemplify our ability to create a Rails application. The proposal for my project can be found below. This is a living document and some things may change between now and when it is submitted (Friday, February 14th, 2020). 

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

  - Region (if available)

  - Date created (by the artist) 

  - Blurb about the pieces (if available)

  - Date used (the date the piece appeared on the site)

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