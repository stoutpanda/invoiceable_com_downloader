require 'csv'


module Imports
  def import_invoices(invoice_file)
    @invoices = CSV.foreach(invoice_file, headers: true, header_converters: :symbol, skip_blanks: true) do |row|
      puts [row[:id]]
    end
  end

  def import_user(user_file)
  end

end
