# Procrastinspire
What I have so far...
<div>
    <a href="https://www.loom.com/share/f406cdf36df348bb847298d480041ecb">
      <p>Week 1 Update - Watch Video</p>
    </a>
    <a href="https://www.loom.com/share/f406cdf36df348bb847298d480041ecb">
      <img style="max-width:300px;" src="https://cdn.loom.com/sessions/thumbnails/f406cdf36df348bb847298d480041ecb-with-play.gif">
    </a>
  </div>
  
## Progress so far:
App has the main three screens so far, with table cells set up for the scroll view to be autofilled.
I'm still figuring out which API I'd like to use for the images - unsplash, imgur, google images, etc. I had the TF in class help me sort out the proper ordering of tabs at the bottom.
<img width="189" alt="Screenshot 2024-04-22 at 11 33 25 PM" src="https://github.com/komilak/procrastinspire/assets/27926984/cefcc370-c020-432d-8458-77aacd48c174">
<img width="195" alt="Screenshot 2024-04-22 at 11 33 11 PM" src="https://github.com/komilak/procrastinspire/assets/27926984/a7c85f0b-21f8-4fa0-b32c-857cbf70237c">

Constraints Are super annoying! But we're getting there...


## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview

### Description

Allows you the buffer time of procrastination, with the good intentions of self affirmation and infinite scroll content to inspire your productivity.

### App Evaluation
- **Mobile:**
  Phones are most people's instinctive procrastination tool, as it's the easiest way to get the next hit of dopamine.
- **Story:**
  Allows you the buffer time of procrastination, with the good intentions of self affirmation to inspire your productivity.
- **Market:**
  Anyone with procrastination issues that want to self improve.
- **Habit:**
  Using the idea of an atomic habit, we use existing triggers and habit routines to create a more positive outcome.
- **Scope:**
  I will use an API for the image calling so most of the work would be creating good UI/UX and infrastructure for the content.

## Product Spec

### 1. User Stories 

**Required Must-have Stories / Features**
- [x] User is able to switch between Inspire, Routines, and Intentions
- [x] User is able to select goal (choose from diff buttons) on Intentions tab - no api response yet
- [x] Routine Tab shows options to select from for Morning, Day, and Evening
- [x] User can scroll through images on Inspire tab
- [ ] Intention selection updates and transitions to Inspire tab







* I set my routines in the Routine tab, so that anytime I open the app, the Inspire screen autopopulates with what I usually want to see.
* I put in my intentions on the intention tab, and am able to get inspired from related images and posts from the Inspire tab

**Optional Nice-to-have Stories**
- [ ] User can set Morning preference on Routine tab
- [ ] User can set Afternoon preference on Routine tab
- [ ] User can set Evening preference on Routine tab
- [ ] Morning preference on Routine tab auto updates Inspire tab
- [ ] Afternoon preference on Routine tab auto updates Inspire tab
- [ ] Evening preference on Routine tab auto updates Inspire tab
* I get rewards thrown sporadically throughout the INspire screen to encourage exploration.


### 2. Screen Archetypes

- [ ] Routines
* I set my routines in the Routine tab, so that anytime I open the app, the Inspire screen autopopulates with what I usually want to see.
- [ ] Intentions
- [ ] Inspire
* I put in my intentions on the intention tab, and am able to get inspired from related images and posts from the Inspire tab


### 3. Navigation

**Tab Navigation** (Tab to Screen)

- [x] * Intentions
- [x] * Inspire
- [x] * Routines

**Flow Navigation** (Screen to Screen)

- [ ] Intentions
* Once an intention is selected, send to api and nav to Inspire screen with api output of relevant topic


## Wireframes
<img width="336" alt="Screenshot 2024-04-15 at 8 49 43 PM" src="https://github.com/komilak/procrastinspire/assets/27926984/c9cb03bc-33b1-487d-a1e7-3c063dc42967">



## Schema 


### Models

[Add table of models]

### Networking

- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
