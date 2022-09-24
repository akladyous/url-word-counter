require 'faker'
Faker::Config.locale = :en

system('clear')
puts 'Enter total posts to generate ?'
POSTS_TO_CREATE = gets.strip.to_i
system('clear')
puts "🌱 Seeding #{POSTS_TO_CREATE.to_i} Posts ..."

# generate randon repeted words
TITLE = Faker::Lorem
        .unique
        .paragraph(sentence_count: 5, supplemental: true)
        .gsub('.', '')
        .split(' ')
        .inject([]) do |memo, word|
          memo.concat([word] * rand(3..10))
          memo
        end

posts_progress = ProgressBar.create(title: 'Generating Posts', total: POSTS_TO_CREATE + 1 )
1.upto(POSTS_TO_CREATE) do
  title = proc { TITLE.shuffle.sample(rand(25..35)).join(' ') }.call
  body  = proc { Faker::Lorem.unique.paragraph(sentence_count: 90, supplemental: true, random_sentences_to_add: 4) }.call
  Post.new do |post|
    post.title = title
    post.body  = body
    post.save
  end
  posts_progress.increment
end
