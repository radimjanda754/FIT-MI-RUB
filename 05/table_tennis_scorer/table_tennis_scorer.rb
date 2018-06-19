# -*- encoding : utf-8 -*-
class TableTennisScorer
  def initialize
    @server = 0
    @receiver = 0
    @winner = 0
  end

  def score
    if @winner == 0
      "#{@server}-#{@receiver}"
    else
      if @winner == 1
        'server game'
      else
        'receiver game'
      end
    end
  end

  def server_scores
    @server += 1
    check_score
  end

  def receiver_scores
    @receiver += 1
    check_score
  end

  private

  def check_score
    if (@server >= 10 || @receiver >= 10) && (@server - @receiver).abs >= 2 && @winner == 0
      @winner = if @server > @receiver
                  1
                else
                  2
                end
    end
  end
end
