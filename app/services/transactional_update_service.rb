class TransactionalUpdateService
  def self.call(model, params)
    model.transaction do
      model.update(params)
    end
  end
end