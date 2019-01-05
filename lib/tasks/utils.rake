require 'faker'
namespace :utils do
  desc "Populando banco de dados"
  task seed: :environment do
    puts "Gerando os information types"
      10.times do |i|
        InformationType.create!(
          description: Faker::Job.education_level,
          active: 1
        )
      end    
      puts "Gerando os information types...[OK]"
      puts "Gerando as tags"
      Tag.create(name: "Recipe")
      Tag.create(name: "Travel")
      Tag.create(name: "Fashion/Beauty")
      Tag.create(name: "Humour")
      puts "Gerando as tags...[OK]"
  end
end
