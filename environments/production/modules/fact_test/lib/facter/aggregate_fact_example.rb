# frozen_string_literal: true

Facter.add(:aggregate_fact_example, type: :aggregate) do
  confine kernel: :linux
  confine { Facter::Util::Resolution.which('the_cake_is_a_lie') }

  # Anything outside of the chunks will always be executed, regardless of the
  # confine statements above. This means that you should not set any variables
  # here with the intention of using the variables from multiple chunks, because
  # it'll be executed unconditionally
  Facter::Core::Execution.execute('sleep 5')

  chunk(:somestuff) do
    stuff = Facter::Core::Execution.execute('hostname')
    { what: stuff }
  end

  chunk(:otherstuff) do
    otherstuff = Facter::Core::Execution.execute('w')
    { who: otherstuff }
  end

end
