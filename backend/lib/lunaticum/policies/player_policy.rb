class Lunaticum::Policies::PlayerPolicy

  attr_reader :iteration, :player, :action_name

  def initialize(options)
    @iteration = options[:iteration]
    @player = options[:player]
  end

  def can?(action_name)
    @action_name = action_name
    case iteration.state
      when 0
        can_set_story?
      when 1
        can_put_card?
      when 2
        can_guess_card?
    end
  end

  def can_set_story?
    player.id == iteration.storyteller.id && !iteration.story && action_name == 'set_story!'
  end

  def can_put_card?
    !player.laid_card && action_name == 'put_card!'
  end

  def can_guess_card?
    player.id != iteration.storyteller.id && !player.chosen_card && action_name == 'guess_card!'
  end

  def results_presentation?

  end


end