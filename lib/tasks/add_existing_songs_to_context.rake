task add_existing_songs_to_context: :environment do
  @sounds = Sound.where(context_id: nil)
  @context = Context.new name: 'Jef Sounds'
  if @context.save
    puts "Context 'Jef Sounds' created."
  end
  @sounds.each do |s|
    s.context = @context
    if s.save
      puts "Sound #{s.title} added to context."
    end
  end
  puts 'Done.'
end
