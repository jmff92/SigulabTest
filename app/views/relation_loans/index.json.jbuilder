json.array!(@relation_loans) do |relation_loan|
  json.extract! relation_loan, :id, :prestamo, :item
  json.url relation_loan_url(relation_loan, format: :json)
end
