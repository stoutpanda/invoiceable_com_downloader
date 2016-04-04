require 'csv'
require_relative 'invoice'



module Imports

  def import_invoices(invoice_file,collection_name)
    #id,date,client_id,uri
    CSV.foreach(invoice_file, headers: true, header_converters: :symbol, skip_blanks: true, converters: :all) do |row|
      invoice = Invoice.new(row[:id],row[:date],row[:client_id],row[:uri],row[:ref])
      collection_name.add_invoice(invoice)
    end
  end
end
