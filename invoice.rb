require 'date'
require 'open-uri'


class Invoice
  attr_reader :id, :date, :client_id, :uri, :uri_key, :ref

  def initialize(id,date,client_id,uri,ref)
    @id = id
    @date = date.to_date
    @client_id = client_id
    @uri = uri
    @uri_key = stripkey(uri)
    @ref = ref
  end

  def stripkey(uri)
    link = uri.split("/")[-1]
  end

  def download_invoice(output_dir)
    download_url = URI.parse("https://secure.invoiceable.com/downloadinvoice/#{@uri_key}")
    File.open("#{output_dir}#{@ref}-#{@date.to_s}.pdf", "wb") do |file|
      file.write open(download_url.to_s).read
    end
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
