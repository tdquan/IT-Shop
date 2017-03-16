# Spree::Core::Engine.load_seed if defined?(Spree::Core)
# Spree::Auth::Engine.load_seed if defined?(Spree::Auth)

Spree::Taxonomy.delete_all
Spree::Taxon.delete_all
Spree::Product.delete_all

##### TAXONOMY & TAXONS #####

## basic laptop
basic_laptop = Spree::Taxonomy.create!(name:'Basic')
basic_laptop_taxon = Spree::Taxon.last
basic_laptop_computer = Spree::Taxon.create!(taxonomy_id: basic_laptop.id, parent_id: basic_laptop_taxon.id, name: 'Computer')
basic_laptop_mouse = Spree::Taxon.create!(taxonomy_id: basic_laptop.id, parent_id: basic_laptop_taxon.id, name: 'Mouse')
basic_laptop_keyboard = Spree::Taxon.create!(taxonomy_id: basic_laptop.id, parent_id: basic_laptop_taxon.id, name: 'Keyboard')

## standard laptop
standard_laptop = Spree::Taxonomy.create!(name:'Standard')
standard_laptop_taxon = Spree::Taxon.last
standard_laptop_computer = Spree::Taxon.create!(taxonomy_id: standard_laptop.id, parent_id: standard_laptop_taxon.id, name: 'Computer')
standard_laptop_mouse = Spree::Taxon.create!(taxonomy_id: standard_laptop.id, parent_id: standard_laptop_taxon.id, name: 'Mouse')
standard_laptop_keyboard = Spree::Taxon.create!(taxonomy_id: standard_laptop.id, parent_id: standard_laptop_taxon.id, name: 'Keyboard')
standard_laptop_software = Spree::Taxon.create!(taxonomy_id: standard_laptop.id, parent_id: standard_laptop_taxon.id, name: 'Software')

## premium laptop
premium_laptop = Spree::Taxonomy.create!(name:'Premium')
premium_laptop_taxon = Spree::Taxon.last
premium_laptop_computer = Spree::Taxon.create!(taxonomy_id: premium_laptop.id, parent_id: premium_laptop_taxon.id, name: 'Computer')
premium_laptop_mouse = Spree::Taxon.create!(taxonomy_id: premium_laptop.id, parent_id: premium_laptop_taxon.id, name: 'Mouse')
premium_laptop_keyboard = Spree::Taxon.create!(taxonomy_id: premium_laptop.id, parent_id: premium_laptop_taxon.id, name: 'Keyboard')
premium_laptop_software = Spree::Taxon.create!(taxonomy_id: premium_laptop.id, parent_id: premium_laptop_taxon.id, name: 'Software')
premium_laptop_monitor = Spree::Taxon.create!(taxonomy_id: premium_laptop.id, parent_id: premium_laptop_taxon.id, name: 'Monitor')

## basic desktop
basic_desktop = Spree::Taxonomy.create!(name:'Basic')
basic_desktop_taxon = Spree::Taxon.last
basic_desktop_computer = Spree::Taxon.create!(taxonomy_id: basic_desktop.id, parent_id: basic_desktop_taxon.id, name: 'Computer')
basic_desktop_mouse = Spree::Taxon.create!(taxonomy_id: basic_desktop.id, parent_id: basic_desktop_taxon.id, name: 'Mouse')
basic_desktop_keyboard = Spree::Taxon.create!(taxonomy_id: basic_desktop.id, parent_id: basic_desktop_taxon.id, name: 'Keyboard')

## standard desktop
standard_desktop = Spree::Taxonomy.create!(name:'Standard')
standard_desktop_taxon = Spree::Taxon.last
standard_desktop_computer = Spree::Taxon.create!(taxonomy_id: standard_desktop.id, parent_id: standard_desktop_taxon.id, name: 'Computer')
standard_desktop_mouse = Spree::Taxon.create!(taxonomy_id: standard_desktop.id, parent_id: standard_desktop_taxon.id, name: 'Mouse')
standard_desktop_keyboard = Spree::Taxon.create!(taxonomy_id: standard_desktop.id, parent_id: standard_desktop_taxon.id, name: 'Keyboard')
standard_desktop_software = Spree::Taxon.create!(taxonomy_id: standard_desktop.id, parent_id: standard_desktop_taxon.id, name: 'Software')

## premium desktop
premium_desktop = Spree::Taxonomy.create!(name:'Premium')
premium_desktop_taxon = Spree::Taxon.last
premium_desktop_computer = Spree::Taxon.create!(taxonomy_id: premium_desktop.id, parent_id: premium_desktop_taxon.id, name: 'Computer')
premium_desktop_mouse = Spree::Taxon.create!(taxonomy_id: premium_desktop.id, parent_id: premium_desktop_taxon.id, name: 'Mouse')
premium_desktop_keyboard = Spree::Taxon.create!(taxonomy_id: premium_desktop.id, parent_id: premium_desktop_taxon.id, name: 'Keyboard')
premium_desktop_software = Spree::Taxon.create!(taxonomy_id: premium_desktop.id, parent_id: premium_desktop_taxon.id, name: 'Software')
premium_desktop_monitor = Spree::Taxon.create!(taxonomy_id: premium_desktop.id, parent_id: premium_desktop_taxon.id, name: 'Monitor')

## basic workstation
basic_workstation = Spree::Taxonomy.create!(name:'Basic')
basic_workstation_taxon = Spree::Taxon.last
basic_workstation_computer = Spree::Taxon.create!(taxonomy_id: basic_workstation.id, parent_id: basic_workstation_taxon.id, name: 'Computer')
basic_workstation_mouse = Spree::Taxon.create!(taxonomy_id: basic_workstation.id, parent_id: basic_workstation_taxon.id, name: 'Mouse')
basic_workstation_keyboard = Spree::Taxon.create!(taxonomy_id: basic_workstation.id, parent_id: basic_workstation_taxon.id, name: 'Keyboard')

## standard workstation
standard_workstation = Spree::Taxonomy.create!(name:'Standard')
standard_workstation_taxon = Spree::Taxon.last
standard_workstation_computer = Spree::Taxon.create!(taxonomy_id: standard_workstation.id, parent_id: standard_workstation_taxon.id, name: 'Computer')
standard_workstation_mouse = Spree::Taxon.create!(taxonomy_id: standard_workstation.id, parent_id: standard_workstation_taxon.id, name: 'Mouse')
standard_workstation_keyboard = Spree::Taxon.create!(taxonomy_id: standard_workstation.id, parent_id: standard_workstation_taxon.id, name: 'Keyboard')
standard_workstation_software = Spree::Taxon.create!(taxonomy_id: standard_workstation.id, parent_id: standard_workstation_taxon.id, name: 'Software')

## premium workstation
premium_workstation = Spree::Taxonomy.create!(name:'Premium')
premium_workstation_taxon = Spree::Taxon.last
premium_workstation_computer = Spree::Taxon.create!(taxonomy_id: premium_workstation.id, parent_id: premium_workstation_taxon.id, name: 'Computer')
premium_workstation_mouse = Spree::Taxon.create!(taxonomy_id: premium_workstation.id, parent_id: premium_workstation_taxon.id, name: 'Mouse')
premium_workstation_keyboard = Spree::Taxon.create!(taxonomy_id: premium_workstation.id, parent_id: premium_workstation_taxon.id, name: 'Keyboard')
premium_workstation_software = Spree::Taxon.create!(taxonomy_id: premium_workstation.id, parent_id: premium_workstation_taxon.id, name: 'Software')
premium_workstation_monitor = Spree::Taxon.create!(taxonomy_id: premium_workstation.id, parent_id: premium_workstation_taxon.id, name: 'Monitor')

##### PRODUCT #####

## basic laptop
# default computer
a = Spree::Product.create!(name: 'Dell Computer', price: 1000, shipping_category_id: 1, meta_keywords: 'basic_laptop_default standard_laptop_default premium_laptop_default basic_desktop_default standard_desktop_default premium_desktop_default basic_workstation_default standard_workstation_default premium_workstation_default', available_on: Time.now)
a.taxons = [basic_laptop_computer, standard_laptop_computer, premium_laptop_computer, basic_desktop_computer, standard_desktop_computer, premium_desktop_computer, basic_workstation_computer, standard_workstation_computer, premium_workstation_computer]
# others
b = Spree::Product.create!(name: 'Apple Computer', price: 2000, shipping_category_id: 1, meta_keywords: "", available_on: Time.now)
b.taxons = [basic_laptop_computer, standard_laptop_computer, premium_laptop_computer, basic_desktop_computer, standard_desktop_computer, premium_desktop_computer, basic_workstation_computer, standard_workstation_computer, premium_workstation_computer]
# default mouse
c = Spree::Product.create!(name: 'HP Mouse', price: 20, shipping_category_id: 1, meta_keywords: 'basic_laptop_default standard_laptop_default premium_laptop_default basic_desktop_default standard_desktop_default premium_desktop_default basic_workstation_default standard_workstation_default premium_workstation_default', available_on: Time.now)
c.taxons = [basic_laptop_mouse, standard_laptop_mouse, premium_laptop_mouse, basic_desktop_mouse, standard_desktop_mouse, premium_desktop_mouse, basic_workstation_mouse, standard_workstation_mouse, premium_workstation_mouse]
# default keyboard
d = Spree::Product.create!(name: 'Qwerty Keyboard', price: 49, shipping_category_id: 1, meta_keywords: 'basic_laptop_default standard_laptop_default premium_laptop_default basic_desktop_default standard_desktop_default premium_desktop_default basic_workstation_default standard_workstation_default premium_workstation_default', available_on: Time.now)
d.taxons = [basic_laptop_keyboard, standard_laptop_keyboard, premium_laptop_keyboard, basic_desktop_keyboard, standard_desktop_keyboard, premium_desktop_keyboard, basic_workstation_keyboard, standard_workstation_keyboard, premium_workstation_keyboard]
# others
e = Spree::Product.create!(name: 'Azerty Keyboard', price: 49, shipping_category_id: 1, meta_keywords: "", available_on: Time.now)
e.taxons = [basic_laptop_keyboard, standard_laptop_keyboard, premium_laptop_keyboard, basic_desktop_keyboard, standard_desktop_keyboard, premium_desktop_keyboard, basic_workstation_keyboard, standard_workstation_keyboard, premium_workstation_keyboard]
# confirmation
puts 'basic laptop created'

## standard laptop
# default software
f = Spree::Product.create!(name: 'Microsoft Office', price: 199, shipping_category_id: 1, meta_keywords: 'standard_laptop_default premium_laptop_default standard_desktop_default premium_desktop_default standard_workstation_default premium_workstation_default', available_on: Time.now)
f.taxons = [standard_laptop_software, premium_laptop_software, standard_desktop_software, premium_desktop_software, standard_workstation_software, premium_workstation_software]
# confirmation
puts 'standard laptop created'

## premium laptop
# default software
g = Spree::Product.create!(name: 'HP Monitor', price: 299, shipping_category_id: 1, meta_keywords: 'premium_laptop_default premium_desktop_default premium_workstation_default', available_on: Time.now)
g.taxons = [premium_laptop_monitor, premium_desktop_monitor, premium_workstation_monitor]
# confirmation
puts 'premium laptop created'

## basic desktop
# confirmation
puts 'basic desktop created'

## standard desktop
# confirmation
puts 'standard desktop created'

## premium desktop
# confirmation
puts 'premium desktop created'

## basic workstation
# confirmation
puts 'basic workstation created'

## standard workstation
# confirmation
puts 'standard workstation created'

## premium workstation
# confirmation
puts 'premium workstation created'
