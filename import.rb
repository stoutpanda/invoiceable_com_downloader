require 'csv'
require 'yaml'
require_relative 'invoice'
require_relative 'user'


module Imports

  def import_invoices(invoice_file,collection_name)
    #id,date,client_id,uri
    CSV.foreach(invoice_file, headers: true, header_converters: :symbol, skip_blanks: true, converters: :all) do |row|
      invoice = Invoice.new(row[:id],row[:date],row[:client_id],row[:uri],row[:ref])
      collection_name.add_invoice(invoice)
    end
  end


  def import_user(user_file)
    file = YAML.load_file(user_file)
    #symbolize_hash_keys using params.symbolize_keys from rails
    file.keys.each do |key|
      file[(key.to_sym rescue key) || key] = file.delete(key)
    end
    user = User.new(file[:username],file[:password])
    return user
  end

end
