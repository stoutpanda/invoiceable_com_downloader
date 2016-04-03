require 'date'
require "addressable/uri"



class Invoice
  attr_reader :id, :date, :client_id, :uri, :uri_key

  def initialize(id,date,client_id,uri)
    @id = id
    @date = date
    @client_id = client_id
    @uri = uri
    @uri_key = uri
  end

  def clean_date(date)
    space_free = date.delete(" ")
    DateTime.strptime(space_free, '%F%T')
  end

  def stripkey(uri)
    link = Addressable::URI.parse(uri)
    link.path
  end
  
end

class Invoices

  attr_accessor :invoices

  def initialize
    @invoices = []
  end

  def add_invoice(invoice)
    @invoices << invoice
  end

end
