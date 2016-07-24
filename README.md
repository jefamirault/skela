Skela Course Tracking
=============

Skela is a Google Inbox-themed Course Tracker. Easily organize courses into Assignments, Exams, Readings, and Resources.

Installing Skela:

1. You must first have Ruby on Rails and git installed on your computer
2. Clone the skela repository with `git clone https://github.com/RupeeOnRails/skela.git`
3. run `bundle install`
4. setup psql user and database
5. rake db:migrate
6. bundle exec passenger start


### Skela uses Cruddy Records/Resources


#### Notes Example

Let's say that you wanted to add Notes to Skela Course Tracking. A note will have a title, date, and some text.

Step 1: Inherit CruddyController

##### notes_controller.rb
```ruby
class NotesController < CruddyController

  private

  def create_resource
    @resource = Note.create
    @resource.course = current_course
    @resource.save
  end

  def set_resources
    @resources = current_course.notes
  end

  def note_params
    params.require(:note).permit(:title, :date, :text)
  end

end

```

Step 2: Views

Cruddy Resources only need two views:

##### _compact.haml

```
.crud_title
  = crud.title
.right
  = present(crud).date_and_time

```

##### _full.haml

```
.subject_container
  = edit_field @resource, 'title', 'subject'

= optional_fields @resource, date:  :date,
                             notes: :text

%footer
  = destroy_link @resource, false
  = collapse_button

```

Then supply a model, migration, and routes as usual, as well as a nav link to `notes_path` and you're good to go!

##### models/note.rb

```
class Note < ActiveRecord::Base

end
```

##### Generate and run the following migration

```
rails g migration CreateNotes title:string date:date text:text

rake db:migrate
```

##### Add the following line to config/routes.rb

```
resources :notes
```

