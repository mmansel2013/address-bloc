class Entry
  attr_accessor :name, :phone_number, :email

  def initialize(name, phone_number, email)
    @name = name
    @phone_number = phone_number
    @email = email
  end

  def to_s
    "Name: #{@name}\nPhone Number: #{@phone_number}\nEmail: #{@email}"
  end
end
require_relative '../models/address_book.rb'

 RSpec.describe AddressBook do
   context "attributes" do
     it "should respond to entries" do
       book = AddressBook.new
       expect(book).to respond_to(:entries)
     end
     it "should initialize entries as an array" do
     book = AddressBook.new
     expect(book.entries).to be_a(Array)
   end

   it "should initialize entries as empty" do
     book = AddressBook.new
     expect(book.entries.size).to eq 0
   end
   context "#{remove_entry}" do
     it "remove an entry using the name, phone_numberm and email address"
     book = AddressBook.new
     book.add_entry(""Bob Hope", "015.555.5555", "bob.hope.@blah.com"")

     name = "ada lovelace"
     phone_number="051.215.1555"
     email_address = "blah@blah.blah"
     book.add_entry(name, phone_number, email_address)

     expect(book.entries.size).to eq 2
     book.remove_entry(name, phone_number, email_address)
     expect(book.entries.size). to eq 1
     expect(book.entries.first.name).to eq("bob hope")
   end
   end
   context "#add_entry" do
        it "adds only one entry to the address book" do
          book = AddressBook.new
          book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')

          expect(book.entries.size).to eq 1
        end

        it "adds the correct information to entries" do
          book = AddressBook.new
          book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
          new_entry = book.entries[0]

          expect(new_entry.name).to eq 'Ada Lovelace'
          expect(new_entry.phone_number).to eq '010.012.1815'
          expect(new_entry.email).to eq 'augusta.king@lovelace.com'
        end
      end
      context "#iterative_search" do
    it "searches AddressBook for a non-existent entry" do
      book.import_from_csv("entries.csv")
      entry = book.iterative_search("Dan")
      expect(entry).to be_nil
    end
    it "searches AddressBook for Bill" do
         book.import_from_csv("entries.csv")
         entry = book.iterative_search("Bill")
         expect(entry).to be_a Entry
         check_entry(entry, "Bill", "555-555-4854", "bill@blocmail.com")
       end
       it "searches AddressBook for Bob" do
       book.import_from_csv("entries.csv")
       entry = book.iterative_search("Bob")
       expect(entry).to be_a Entry
       check_entry(entry, "Bob", "555-555-5415", "bob@blocmail.com")
     end

     it "searches AddressBook for Joe" do
       book.import_from_csv("entries.csv")
       entry = book.iterative_search("Joe")
       expect(entry).to be_a Entry
       check_entry(entry, "Joe", "555-555-3660", "joe@blocmail.com")
     end

     it "searches AddressBook for Sally" do
       book.import_from_csv("entries.csv")
       entry = book.iterative_search("Sally")
       expect(entry).to be_a Entry
       check_entry(entry, "Sally", "555-555-4646", "sally@blocmail.com")
     end

     it "searches AddressBook for Sussie" do
       book.import_from_csv("entries.csv")
       entry = book.iterative_search("Sussie")
       expect(entry).to be_a Entry
       check_entry(entry, "Sussie", "555-555-2036", "sussie@blocmail.com")
     end
     it "searches AddressBook for Billy" do
           book.import_from_csv("entries.csv")
           entry = book.iterative_search("Billy")
           expect(entry).to be_nil
         end
  end


 end
