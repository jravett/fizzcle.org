# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


Transaction.create(:date=>"2011-02-19",:payee=>"Exxon",:amount => 11.25,:account => 'credit card',:tag => 'gas')
Transaction.create(:date=>"2011-02-21",:payee=>"Home Depot",:amount => 12.25,:account => 'checking',:tag => 'household')
Transaction.create(:date=>"2011-02-22",:payee=>"time warner",:amount => 13.25,:account => 'credit card',:tag => 'cable')