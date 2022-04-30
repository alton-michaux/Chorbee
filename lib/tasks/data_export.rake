namespace :export do
  desc 'Prints Parent.all in a seeds.rb way.'
  task seeds_format: :environment do
    Parent.order(:id).all.each do |parent|
      puts "Parent.create(#{parent.serializable_hash.delete_if do |key, _value|
                              %w[created_at updated_at id].include?(key)
                            end.to_s.gsub(/[{}]/, '')})"
    end
  end
  task seeds_format: :environment do
    Child.order(:id).all.each do |child|
      puts "Child.create(#{child.serializable_hash.delete_if do |key, _value|
                             %w[created_at updated_at id].include?(key)
                           end.to_s.gsub(/[{}]/, '')})"
    end
  end
  task seeds_format: :environment do
    Chore.order(:id).all.each do |chore|
      puts "Chore.create(#{chore.serializable_hash.delete_if do |key, _value|
                             %w[created_at updated_at id].include?(key)
                           end.to_s.gsub(/[{}]/, '')})"
    end
  end
  task seeds_format: :environment do
    Appointment.order(:id).all.each do |appointment|
      puts "Appointment.create(#{appointment.serializable_hash.delete_if do |key, _value|
                                   %w[created_at updated_at id].include?(key)
                                 end.to_s.gsub(/[{}]/, '')})"
    end
  end
end
