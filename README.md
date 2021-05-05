# Team_Zero
# Team_Zero

# Project Name
  Social Distance Maintaining System 

## Problem Statement
   A local grocery shop owner wants to maintain social distancing amongst his customers and allow only minimal customers at a time into the shop. He would like to have a device    that ensures that there are minimal customers inside the shop and also they are maintaining social distancing. Come up with a product that meets these minimal requirements and also add more features that you think are appropriate to this problem.

## Inspiration
 In the current scenario of Global pandemic, maintaining social distancing is very important. The Corona is spreading with higher rate due to overcrowding at shops and bus stops and malls,etc. Even in the lockdown, the shops for grocery, fertilizers and medicals are open and we must maintain social distacing at such places.        

## What it does
The system will limit the number of people entering into the shop by using automatic door locker system. Proper places with markings will be available which are distanced away from each other as per the guidelines given by the government. These markings will have sensors. If any of the customers moves away from the given marking, a buzzer will beep until the customer stands again at his/her proper position. 
We have made an App which can be used to check the number of people in a shop. The app also has an option of booking a slot if the shop is full. The App has two modes one for customers and one for owners. The customers can enter their Pincode and find respective shops in their region. If there are more customers in the shop, the customers can book a time slot. The owner's view will show the current number of customers in the shop and total number of customers who have booked a slot.  
We have designed website as well where owners of shops can approach us to buy the product and register slots as well.     

## How we built it
Electroncis: The system is working mainly using the NodeMCU prototyping board. For limiting the number of people into the shop, we are using IR-proximity sensor and after a particular number of customers are inside the shop, a motor will automatically close the door.
Now inside the shop, a pair of Laser and LDR is used. As per the number of customers into the shop that much pairs of Laser and LDR will be activated. The laser is focussed on the ldr, the customer will be standing in between the laser and ldr, if any customer moves away, the buzzer will beep until he/she is not returned to proper position.    
The number of customers is constantly updated in the real time data base of Firebase.  

App: The app consists of two views one for owner and another for customers. 

Web: The website is designed using HTML, CSS and Javascript. The website is overview for the company and enables you to register for Slots and also further use the products via directing you to the app

## How to run it locally

## Challenges we ran into
   1. Uploading the data from NodeMCU to firebase.
   2. Getting the data on App and making the app user-friendly
## Accomplishments that we're proud of
  1. Successfully interfacing NodeMCU with the firebase and app.  

## What we learned
1. Interfacing NodeMCU with the app using firebase
2. Crucial aspercts of developing an app and a website
 

## Important URLs

## UI of the APP:

![WhatsApp Image 2021-05-05 at 4 55 33 PM](https://user-images.githubusercontent.com/78071859/117135954-50c23700-adc5-11eb-9e4a-aacc4708de65.jpeg)
![WhatsApp Image 2021-05-05 at 4 55 32 PM](https://user-images.githubusercontent.com/78071859/117135970-56b81800-adc5-11eb-807f-dfa5e5b0d44d.jpeg)


