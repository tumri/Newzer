# Newzer
-----

A personal project to try out CKEditor and create a basic user generated news article site.

Each user/author will have the ability to post fully formatted articles and an admin/editor-in-chief will be able to approve articles to be shown on the main page feed. Tags will be used to filter for relevant articles.

Each user/author will have a profile where they can highlight their credentials and advertise their social media profiles. This information will also be shown in minified form on the user/author's articles.

-----

The login/logout/validation system is reused from RailsTutorial but could easily be replaced by any number of user authentication systems.

User/author avatars are handled through Gravatar but may be replaced with a private avatar system in the future.

Images/attachments from articles are stored in Amazon S3. File storage is handled by CarrierWave and Fog because Paperclip+AWS-SDK were buggy when used with CKEditor.
