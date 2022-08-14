USE master
GO

-- Drop database if it exists
IF DB_ID('final_capstone') IS NOT NULL
BEGIN
	ALTER DATABASE final_capstone SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE final_capstone;
END

CREATE DATABASE final_capstone
GO

USE final_capstone
GO

-- Create Tables
CREATE TABLE users (
	user_id int IDENTITY(1,1) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	salt varchar(200) NOT NULL,
	user_role varchar(50) NOT NULL,
	nickname nvarchar(150) NOT NULL,
	pronouns nvarchar(50) NOT NULL
	CONSTRAINT PK_user PRIMARY KEY (user_id)
)

CREATE TABLE topic (
	topic_id int IDENTITY(1,1) NOT NULL,
	topic_q nvarchar(1000) NOT NULL,
	topic_info nvarchar(2000) NOT NULL,
	info_link nvarchar(500),
	img_link nvarchar(500),
	CONSTRAINT PK_topic PRIMARY KEY (topic_id)
)

CREATE TABLE user_message (
	user_message_id int identity (1,1) NOT NULL,
	user_message nvarchar (500) NOT NULL,
	topic_id int NOT NULL,
	user_id int NOT NULL,
	CONSTRAINT FK_topic FOREIGN KEY (topic_id) REFERENCES topic(topic_id),
	CONSTRAINT FK_users FOREIGN KEY (user_id) REFERENCES users(user_id)
)

-- Populate default data for testing: user and admin with password of 'password'
-- These values should not be kept when going to Production
INSERT INTO users (username, password_hash, salt, user_role, nickname, pronouns) VALUES ('user','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'Nitro', 'They/Them');
INSERT INTO users (username, password_hash, salt, user_role, nickname, pronouns) VALUES ('admin','YhyGVQ+Ch69n4JMBncM4lNF/i9s=', 'Ar/aB2thQTI=','admin', 'Zada', 'She/Her');
GO

--DBV2
--MUST STAY IN FIRST SLOT *** CATCH ALL ****
Insert INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('catch-all','So sorry, but I don''t know how to respond to that yet. | I''m still learning all the things I need to know to be the best helper Yetti I can be! | If this is an emergency please slack your ','','')
-- greetings
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('hello','darkness my old friend. I''m JMTHY. How can I help you today ','','');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('hi','How high? | Just kidding. | I''m JMTHY, John and Matt''s Tiny Helper Yetti. What can I do for ya?','','');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('what?','Did I stutter?','','');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('how much wood','could a wood-chuck,chuck, if a wood-chuck could chuck wood?','','');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('hola','Que paso, my friend?','','');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('hi jmthy | wassup | greetings | salutations | hi there | top o the mornin | good morrow | what''s poppin'' | what''s good ','Hi my friend, I''m JMTHY. John and Matt''s Tiny Helper Yetti. | What''s on your mind today?','','');

-- general help
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('help | advice | guidence | can you help me | what can you help with | ','I''d love to help! I can help with a wide variety of Tech Elevator subject topics such as: "Pathway Help" | "Curriculum" | "Motivational Quotes" | "Find Open Jobs" | Are any of these what you need help with?','','');

-- general topics 
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('pathway | help with pathway','Pathway? I might know a thing or two about that. Would information on any of these topics be helpful? : "Managing Stress" | "Imposter Syndrome" | "Time Management" | "Elevator Pitch" | "Resume" | "LinkedIn" | "Side Projects" | "Networking" | "Interview Preparation" | "Behavioral Interviews" | "Technical Interviews" | "After Interviews" | "Job Search" | "Benefits" | "Huntr" | or you can get in touch with Pathway here:','pathway@techelevator.com','');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('curriculum | class | help with curriculum','If none of these topics are tickling your peach you can always send a slack to your instructor!','','');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('why did i pick this program | show me | motivational quotes | quotes | help with life | I''m struggling | fuck this | toaster bath | lay in the street | I feel unhinged ','You''re going through a tough program, it''s understandable to feel stressed sometimes. Let me see what kind of inspiration I can hit you with.','','');

-- Not what you wanted NEEDS WORK
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('none ','I''m afraid those are the only topics I know about right now. But I have of very tired, hard working, overly caffeinated, and mildly unhinged team of junior developers working as hard as they can to make me live up to everyone''s expectations. If this is an emergency please contact your pathway director via Slack or shoot an email to:','pathway@techelevator.com','');


--Greetings
--INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('','','','');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('hello','darkness my old friend. I''m JMTHY. How can I help you today ','','');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('hi','How high?','','');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('hola','Que paso, my friend?','','');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('hi jmthy | how are you? | wassup | what''s poppin'' | ugh | hey | yello | yo | greetings | good morrow ','Hi my friend, I''m JMTHY. John and Matt''s Tiny Helper Yetti. What''s on your mind today?','','');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('fuck this | i''m gonna take a toaster bath | this was a mistake | fuck | over it | i''m over this | i''m dumb | make me want to tear my hair out | my soul is dying | i''m gonna lay in the street | i''m quitting | i quit ','Slow down there tiger. Maybe take a step away or a deep breath. If you want, I also have some motivational quotes that might cheer you up.....did I mention they come with an emotional support animal? Just say "Motivational Quotes"','','');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('i''m feeling sad | what am i doing with my life? | i can''t do this | I''m sad | i''m gonna kill myself | i can''t take this anymore | kill myself | end it all | what''s the point | life is meaningless | i can''t do this anymore','Sometimes I feel the same. When I do, I try to take deep breaths, look at the sky or talk to someone. | If you think what you need is someone to talk to, here''s a number for someone who would love to help you through this: 1-800-950-6264 ','1-800-950-6264','');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES  ('help','I''d love to help! I can help with a wide variety of Tech Elevator subject topics such as: "Pathway Help" | "Curriculum" | "Motivational Quotes" | "Find Open Jobs" | Are any of these what you need help with?','','');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('pathway | i need help with pathway | can you help me with pathway? | i''m feeling nervous about pathway | what can you tell me about pathway | what about pathway? ','Pathway? I might know a thing or two about that. Would information on any of these topics be helpful? : "Managing Stress" | "Imposter Syndrome" | "Time Management" | "Elevator Pitch" | "Resume" | "LinkedIn" | "Side Projects" | "Networking" | "Interview Preparation" | "Behavioral Interviews" | "Technical Interviews" | "After Interviews" | "Job Search" | "Benefits" | "Huntr" | or you can get in touch with Pathway here:','pathway@techelevator.com','');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('curriculum | i need help with curriculum | can you help me with curriculum? | what do you know about coding? | i''m feeling nervous about class | what can you tell me about class topics | what about curriculum? ',' If none of these topics are tickling your peach you can always send a slack to your instructor!','','');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('motivational | quotes','Absolutely, friend! Pick a number 1-11', '','');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('none of those | no | i need help with something else | something else  ','I''m afraid those are the only topics I know about right now. But I have of very tired, hard working, overly caffeinated, and mildly unhinged team of junior developers working as hard as they can to make me live up to everyone''s expectations. If this is an emergency please contact your pathway director via Slack or shoot an email to: ','pathway@techelevator.com','');



--Pathway 
INSERT INTO topic(topic_q, topic_info, info_link, img_link) VALUES ('managing stress',
'Make (and keep to) a schedule While you''re at it, schedule breaks into your day
Remind yourself you are here to learn Don''t compare yourself to others
Move your body Drink water Celebrate your wins!',
'https://www.stress.org/?gclid=Cj0KCQjwl92XBhC7ARIsAHLl9anFmcWpuZnDq-tBRHHG2-O4MiX59nKVBTf-YkF3xLvDnm78vFI9eZYaAkbtEALw_wcB','https://content.thriveglobal.com/wp-content/uploads/2019/08/stress-managment-in-your-life.jpg');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('imposter syndrome',
'Imposter Syndrome at it''s core is when you don''t give yourself the adequate credit you deserve. | If not properly managed it can be overwhelming, and a hot mess of a mental rollercoaster. | ',
'https://www.themuse.com/advice/5-different-types-of-imposter-syndrome-and-5-ways-to-battle-each-one','https://www.primarygames.com/arcade/adventure/theimposter/logo200.png');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('time management','The Pomodoro Technique: |
Step 1 Get a to-do list and a timer. |
Step 2 Set your timer for 25 minutes and focus on a single task from your to-do list until the timer rings. |
Step 3 When your session ends, mark off one pomodoro (one pomodoro = one 25-minute session) and record what you completed. |
Step 4 Then enjoy a five-minute break. |
Step 5 After four Pomodoros, take a longer, more restorative 15-30 minute break. |
Cirillo Also Cites 3 Rules For The Pomodoro Technique: |
Rule 1 Break down complex projects. If a task requires more than four Pomodoros, it needs to be divided into smaller, actionable steps. Sticking to this rule will help ensure you make clear progress on your projects. |
Rule 2 Small tasks go together. Any tasks that will take less than one Pomodoro should be combined with other simple tasks. For example, "write rent check," "set vet appointment," and "read Pomodoro article" could go together in one session. |
Rule 3 Once a pomodoro is set, it must ring. | The pomodoro is an indivisible unit of time and cannot be broken, especially not to check incoming emails, team chats, or text messages. Any ideas, tasks, or requests that come up should be taken note of to come back to later.',
'https://todoist.com/productivity-methods/pomodoro-technique','https://media.hswstatic.com/eyJidWNrZXQiOiJjb250ZW50Lmhzd3N0YXRpYy5jb20iLCJrZXkiOiJnaWZcL3BvbW9kb3JvMy5qcGciLCJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjgyOH19fQ==');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('elevator pitch','Your elevator pitch should be between 30-40 seconds. Add your own unique twist to your pitch or insert a joke related to your sense of humor (as long as it''s appropriate, of course!). Your personality is what makes you YOU - when you''re showcasing your personality, you''re portraying confidence. And confidence is key! If you sound bored or lack enthusiasm when giving your pitch, you''ll lose the attention of your audience quickly. Your elevator pitch isn''t just about what you''re saying, but how you''re saying it, so don''t forget about all of your non-verbal cues. These include eye contact, hand gestures, body language, and facial expressions. Always remember, you�ve got this!',
'https://www.thebalancecareers.com/elevator-speech-examples-and-writing-tips-2061976','https://www.thebalancecareers.com/thmb/wJ9LhecfcbJw9RK9juxci5iQgRU=/672x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/elevator-speech-examples-and-writing-tips-2061976_final-5b733b6546e0fb00503084ee.png');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('resume','Your resume should include all of these items, Professional Summary, Name/Contact Information, Technical Skills, Technical Experience, Education and Professional Experience.
Listing your Capstone Projects, as well as any side projects you''ve worked on, will be an important part of building out your resume.',
'https://resumegenius.com/resume-samples/technical-resume','https://resumegenius.com/wp-content/uploads/technical-resume-example.png');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('linkedin','LinkedIn serves as your online resume and presence when applying to jobs. While your resume is your "highlight reel", your LinkedIn profile is where you elaborate more on your story. Having a solid LinkedIn Summary will truly help you stick out among other candidates when you''re active on the job search so if recruiters can get a sense of who you are, Why you''re great, What you''re bringing to the table, AND your dazzling personality!',
'https://www.linkedin.com','https://play-lh.googleusercontent.com/kMofEFLjobZy_bCuaiDogzBcUT-dz3BBbOrIEjJ-hqOabjK8ieuevGe6wlTD15QzOqw');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('side projects','You don''t need some huge project to have something you can talk about. Just having even a simple project can let employers get a look inside your mind. At the end of the day, they�re interested in hearing about how you''re designing the program, what roadblocks you''ve run into, different approaches you might take if you did it again, and where you want to take the project in the future.',
'https://github.com/karan/Projects','https://resumegenius.com/wp-content/uploads/programming-projects-for-resumes-png.png');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('networking','Networking is going to be a vital part of your new career in technology. We want you all to feel comfortable and confident when it comes to networking with folks in the tech industry. Because of this, it''s important for you to begin networking sooner than later, so you can build up a quality network of connections in the industry. Remember - it''s not all about who you know... but knowing people will 100% help you in the technology industry!',
'https://www.forbes.com/sites/biancamillercole/2019/03/20/why-networking-should-be-at-the-core-of-your-career/?sh=6dc813381300','https://imageio.forbes.com/specials-images/dam/imageserve/1135040422/960x0.jpg?format=jpg&width=960');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('interview preparation','Interviewing begins the moment you receive a call or email from the recruiter informing you that they''re interested in scheduling an interview. From that moment until the day of your interview, you need to ensure that you''re as prepared as possible. If you go into any interview without a high level of preparation, it will not go well. Preparation is key when interviewing for roles in the tech industry. Remember to research the company you''re meeting with, Bring several copies of your resume to pass out to all interviewers, Check your Appearance, Dress to impress, Look Good!',
'https://www.thebalancecareers.com/how-to-prepare-for-a-job-interview-2061361','https://www.thebalancecareers.com/thmb/36A7sO7nzVfzLvlPY4ekIQM1QBE=/672x0/filters:max_bytes(150000):strip_icc():format(webp)/how-to-prepare-for-a-job-interview-2061361_final-5b88000a46e0fb0050fab985.png');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('behavioral interviews','Behavioral Interviews will be a big part of your job search as you begin applying for a job in technology. Companies aren''t just looking for someone who "checks the boxes" in regard to technical skills, they want someone who is a culture fit for their team and their company as well, which is why they''ll use the behavioral interview and\\or phone screen to assess if you''re a culture fit or not.',
'https://www.themuse.com/advice/behavioral-interview-questions-answers-examples','https://kforcewebeast.azureedge.net/media/404868/commonbehavioralinterview_starmethod_770x330.jpg');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('technical interviews','While most of you likely have experience in general or behavioral interviews, we''re guessing you have yet to encounter a technical interview. The technical interview is very specific to the industry you�re entering and is usually a blend of technical questions, whiteboarding, and/or coding problems.',
'https://www.allaboutcareers.com/looking-for-a-job/technical-interview/','https://i.insider.com/5b365606019a461c008b4896?width=600&format=jpeg&auto=webp');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('after interviews','The interview doesn''t end once you leave or log off the Zoom call! Make sure you''re taking the time to follow-up accordingly with the company and that you don''t take your foot off the gas with other applications! Always send a thank you email (after each and every interview),
Make it personal. Keep applying until you have a signed offer letter in your hand. Even if you feel really good about an interview, don''t stop applying.',
'https://lms.techelevator.com/cohorts/151/blocks/31/content_files/05_After_Interviews/01-introduction.md','https://www.betterup.com/blog/how-to-follow-up-after-an-interview');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('job search','Job Boards, Search Terms, A Boolean Search is a structured search that uses specific search terms with a mixture of phrases such as AND, OR, or NOT to utilize a search engine to its fullest potential. Job alerts will automatically unearth new jobs that match your preferences (based on your keywords and filters) and notify you daily via email and push notifications so you discover great opportunities as soon as possible.The Two-Pronged Approach allows you to take your job application a step further by getting in front of the right person at a company, Step one: Identify a Contact. Step 2: Send Them a Message or Email.',
'https://www.educative.io/blog/get-a-developer-job-you-love','https://imageio.forbes.com/specials-images/dam/imageserve/488470902/960x0.jpg?format=jpg&width=960');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('benefits','Once you receive a job offer, you''ll want to review the benefits package as well. The benefits package will include paid time off (PTO), medical benefits, bonuses, and more. Make sure to review this lesson so you''re familiar with what to expect in a benefits package.',
'https://hrdailyadvisor.blr.com/2018/06/26/job-offer-benefits-packages-can-stronger-incentive-salary/','https://lirp.cdn-website.com/537b6562/dms3rep/multi/opt/designing-a-benefits-plan-1920w.jpg');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('huntr','Huntr is an incredible job search organizational platform that Tech Elevator provides students access too. Once you begin applying to jobs, it''s easy to lose track of which opportunities you''ve applied to, Huntr makes staying organized in your job search easy! In addition to helping you keep track of your applications and interviews, Huntr allows you track your job goals, and find and apply to jobs using their Job Portal!',
'https://huntr.co/','https://play-lh.googleusercontent.com/mmbjCgtpNhxxyjN2YunkxgQGx0391cUw10WWkW9eOvfqno-_c0aQKGuI2fyckV2izdk');

--Curriculum
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('loops','Loops are a fundamental concept for managing program control flow, but they go hand in hand with arrays. Loops provide a convenient way to write a small amount of code that can iterate through all of the values in an array one by one. To learn more click here:',
'https://www.w3schools.com/cs/cs_for_loop.php','https://www.tutorialsteacher.com/Content/images/csharp/for-loop.png');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('arrays','Arrays are a special data type found in almost all programming languages. They make it more convenient to work with values in aggregate rather than a series of individual variables. To learn more click here:',
'https://www.w3schools.com/cs/cs_arrays.php','https://csharpcorner-mindcrackerinc.netdna-ssl.com/article/extract-part-of-a-string-array-in-c-sharp/Images/Extract%20String%20Array%20Portion%20CSharp.jpg');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('object oriented programing','Object-Oriented Programming is about organizing your problem-solving into objects. An object is an in-memory data structure that combines state and behavior into a usable and useful abstraction. In other words, objects are a collection of variables and methods. For more info click the link here:',
'https://www.w3schools.com/cs/cs_oop.php','https://procodeguide.b-cdn.net/wp-content/uploads/2020/05/Encapsulation-1024x397.png');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('mvc','MVC is abbreviated as Model View Controller is a design pattern created for developing applications specifically web applications. As the name suggests, it has three major parts. The traditional software design pattern works in an "Input - Process - Output" pattern whereas MVC works as "Controller -Model - View" approach. ',
'https://www.w3schools.in/mvc-architecture','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjsYJ6AWxfZcPm4tYzaLwkb6VgcO9zjMymTg&usqp=CAU');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('sql','SQL is the standard language for dealing with Relational Databases and used to insert, search, update, and delete database records.',
'https://www.w3schools.com/mysql/mysql_sql.asp','https://s33046.pcdn.co/wp-content/uploads/2020/03/an-executed-create-view-sql-script-showing-data-re.png');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('dictionary','The Dictionary class offers a distinct advantage over Lists. Dictionaries consist of key-value pairs where each value is associated with a unique key, and the keys are arranged within the collection so that they can be instantly located and the values retrieved. There is no need to iterate through the collection looking for a particular value. A program should only loop through a Dictionary when it needs to access every single value within.',
'https://www.w3schools.blog/c-sharp-dictionary','https://i0.wp.com/dailydotnettips.com/wp-content/uploads/2014/12/image5.png?ssl=1');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('inheritance','Inheritance is the act of having one class adopt the properties and methods of another class. This prevents code duplication and allows you to share code across classes while having the source code live in only one class file.',
'https://www.w3schools.com/cs/cs_inheritance.php','data:image/png;base64,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');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('polymorphism','Polymorphism is the idea that something can be assigned a different meaning or usage based on its context. This specifically allows variables and objects to take on more than one form.',
'https://www.w3schools.com/cs/cs_polymorphism.php','data:image/png;base64,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');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('encapsulation','Encapsulation describes the idea of bundling data and methods that work on that data within one unit, like a class. This concept is also often used to hide the internal representation, or state of an object from the outside. This is called information hiding.',
'https://www.w3schools.blog/c-sharp-encapsulation','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoLykQMSo-wpL45YXnKgs8-7e10L8ReSoQCQ&usqp=CAU');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('java','Java? Never heard of her. Sounds kinda lame but maybe this link will help',
'https://www.youtube.com/watch?v=xvFZjo5PgG0','');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('maps | i need help with maps','We''re no strangers to love
You know the rules and so do I
A full commitment''s what I''m thinking of
You wouldn''t get this from any other guy
I just wanna tell you how I''m feeling
Gotta make you understand
Never gonna give you up
Never gonna let you down
Never gonna run around and desert you
Never gonna make you cry
Never gonna say goodbye
Never gonna tell a lie and hurt you
We''ve known each other for so long
Your heart''s been aching but you''re too shy to say it
Inside we both know what''s been going on
We know the game and we''re gonna play it
And if you ask me how I''m feeling
Don''t tell me you''re too blind to see
Never gonna give you up
Never gonna let you down
Never gonna run around and desert you
Never gonna make you cry
Never gonna say goodbye
Never gonna tell a lie and hurt you
Never gonna give you up
Never gonna let you down
Never gonna run around and desert you
Never gonna make you cry
Never gonna say goodbye
Never gonna tell a lie and hurt you
Never gonna give, never gonna give
(Give you up)
We''ve known each other for so long
Your heart''s been aching but you''re too shy to say it
Inside we both know what''s been going on
We know the game and we''re gonna play it
I just wanna tell you how I''m feeling
Gotta make you understand
Never gonna give you up
Never gonna let you down
Never gonna run around and desert you
Never gonna make you cry
Never gonna say goodbye
Never gonna tell a lie and hurt you
Never gonna give you up
Never gonna let you down
Never gonna run around and desert you
Never gonna make you cry
Never gonna say goodbye
Never gonna tell a lie and hurt you
Never gonna give you up
Never gonna let you down
Never gonna run around and desert you
Never gonna make you cry
Never gonna say goodbye 

or maybe try this link:','https://www.mapquest.com/us/ohio/swaco-408403550','');

--Quotes
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('1','Life is like a sewer� what you get out of it depends on what you put into it. � Tom Lehrer', '','https://images.unsplash.com/photo-1497752531616-c3afd9760a11?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('2','I have spent my years since Princeton, while at law school and in my various professional jobs, not feeling completely a part of the worlds I inhabit. I am always looking over my shoulder wondering if I measure up. - Sonia Sotomayer', '','https://d.newsweek.com/en/full/2053462/baby-elephant.webp?w=790&f=edf627a8d66c423b84bedfccdaf51f6d');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('3','That brain of mine is something more than merely mortal; as time will show. - Ada Lovelace', '','https://images.unsplash.com/photo-1583524505974-6facd53f4597?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('4','To me programming is more than an important practical art. It is also a gigantic undertaking in the foundations of knowledge. - Grace Hopper', '','https://images.unsplash.com/photo-1516467508483-a7212febe31a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=873&q=80');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('5','Only the dead fish go with the flow. - Andy Hunt', '','https://images.unsplash.com/photo-1516703995331-215d1188db0c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('6','Stress acts as an accelerator: it will push you either forward or backward, but you choose which direction. ?Chelsea Erieau', '','https://images.unsplash.com/photo-1556582305-528bffcf7af0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('7','We gain strength, and courage, and confidence by each experience in which we really stop to look fear in the face....We must do that which we think we cannot. � Eleanor Roosevelt', '','https://unsplash.com/photos/7sgPfAcM6_o');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('8','You may encounter many defeats, but you must not be defeated. In fact, it may be necessary to encounter the defeats, so you can know who you are, what you can rise from, how you can still come out of it. - Dr. Maya Angelou', '','https://i.redd.it/hpwchq8av5h91.jpg');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('9','You never have to ask anyone permission to lead. When you want to lead, you lead. - Kamala Harris', '','https://www.rd.com/wp-content/uploads/2021/04/GettyImages-139677758-scaled.jpg?resize=2048,1362');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('10','There''s something so special about a woman who dominates in a man''s world. It takes a certain grace, strength, intelligence, fearlessness, and the nerve to never take no as an answer. - Rihanna', '','https://external-preview.redd.it/1SmbA7Mc1ZRSTIXMacxsq1uduh6f9-Z3BMAloelzHU8.jpg?auto=webp&s=cb97640ee660d84ce74eca5925267bc989d1630d');
INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('11','The discussion of representation is one that has been repeated over and over again, and the solution has always been that it''s up to us to support, promote, and create the images that we want to see. � Issa Rae', '','https://www.corneliustoday.com/wp-content/uploads/2020/05/hqdefault.jpg');
GO


--INSERT INTO user_message (keywords, topic_id) VALUES ('', '')

--INSERT INTO topic (topic_q, topic_info, info_link, img_link) VALUES ('','','','');



select t.topic_info from topic t where t.topic_q = 'help'

Select * From user_message
