require 'csv'
require_relative 'invoice'


module Imports
  @invoices = []
  def import_invoices(invoice_file)
    #id,date,client_id,uri
    CSV.foreach(invoice_file, headers: true, header_converters: :symbol, skip_blanks: true, converters: :all) do |row|
      invoice = Invoice.new(row[:id],row[:date],row[:client_id],row[:uri])
      add_invoice(invoice)
    end
  end
  def add_invoice(invoice)
    @invoices = @invoices.to_a.push(invoice)
  end

  def import_user(user_file)
  end

end
