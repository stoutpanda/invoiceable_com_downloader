require 'csv'
require 'datetime'

class Invoiceable
  attr_reader :id, :date, :client_id, :url, :url_key
  #parse csv and return as an array of hashes with id, date, uri, client_id from the provided csv file.

  def import_csv
    invoices = CSV.foreach($invoice_file, :headers => true) do |row|
      Invoiceable.new


  end

  def initialize(id,date,client_id,url,url_key)
    @id = id.to_i
    @date = clean_date(date)
    @client_id = client_id.to_i
    @url = url
    @url_key = stripkey(url)
  end


private
  def clean_date(date)
    space_free = date.delete(" ")
    DateTime.strptime(space_free, '%F%T')
  end

  #def stripkey(url)

  #end
end

end
