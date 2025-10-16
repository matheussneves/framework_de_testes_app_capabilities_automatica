module ApiCommons
  def call_endpoint_steps(endpoint, type, ignore_steps = [], data_table = [], &block)
    validate_call_endpoint_steps_arguments(endpoint, type, ignore_steps, data_table)
    block = proc(&block) if block_given?
    steps_map = construct_steps_map(endpoint, type, data_table, block)
    begin 
      steps_map.each { |key, proc|
      
      proc.call unless ignore_steps.include?(key.to_s)
     }
    rescue RuntimeError, Cucumber::Glue::ArityMismatchError => error
      raise "\n*** Method call_endpoint_steps not executed because: #{error} ***"
    end
  end

  def create_data_table(data_table)
    data_table_hash = {}
    data_table&.rows_hash&.each { |value| data_table_hash[value.first] = (/(^$)|(^<.*>$)|( )/ =~ value.last).nil? ? value.last : nil }
    data_table_hash
  end
  private

  def construct_steps_map(endpoint, type, data_table, block)
    {
      Dado: lambda do
        if data_table.nil? || data_table.empty?
          step "ter uma massa configurada do endpoint #{endpoint} para o cenário #{type}"
        elsif data_table.is_a? Hash
          step "ter uma massa configurada do endpoint #{endpoint} para o cenário #{type}", table(data_table.to_a)
        else
          step "ter uma massa configurada do endpoint #{endpoint} para o cenário #{type}", table(data_table.raw)
        end
        block.call unless block.nil?
      end,
      Quando: -> { step "chamar o endpoint #{endpoint}" },
      Então: -> { step "validar o retorno do endpoint #{endpoint} para o cenário #{type}" }
    }
  end
end
