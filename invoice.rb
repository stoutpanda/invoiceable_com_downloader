require 'date'


class Invoice
  attr_reader :id, :date, :client_id, :uri, :uri_key

  def initialize(id,date,client_id,uri)
    @id = id
    @date = date
    @client_id = client_id
    @uri = uri
    @uri_key = stripkey(uri)
  end

  def stripkey(uri)
    link = uri.split("/")[-1]

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
