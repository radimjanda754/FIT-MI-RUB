# -*- encoding : utf-8 -*-
require_relative 'spec_helper'
require_relative '../table_tennis_scorer'

describe TableTennisScorer do
  subject(:scorer) { TableTennisScorer.new }

  describe '#score'

  subject { scorer.score }

  context 'at the beginning' do
    it { is_expected.to eql '0-0' }
  end

  context 'server wins a point' do
    before do
      scorer.server_scores
    end
    it { is_expected.to eql '1-0' }
  end

  context 'receiver wins a point' do
    before do
      scorer.receiver_scores
    end
    it { is_expected.to eql '0-1' }
  end

  context 'both win a point' do
    before do
      scorer.server_scores
      scorer.receiver_scores
    end
    it { is_expected.to eql '1-1' }
  end

  # ...

  context 'server wins a game' do
    before do
      7.times { scorer.receiver_scores }
      10.times { scorer.server_scores }
    end
    it { is_expected.to eql 'server game' }
  end

  context 'receiver wins a game' do
    before do
      7.times { scorer.server_scores }
      10.times { scorer.receiver_scores }
    end
    it { is_expected.to eql 'receiver game' }
  end

  context 'two point lead after deuce' do
    before do
      9.times do
        scorer.server_scores
        scorer.receiver_scores
      end
      scorer.receiver_scores
      2. times { scorer.server_scores }
    end
    it { is_expected.to eql '11-10' }
    it { scorer.receiver_scores; is_expected.to eql '11-11' }
    it { scorer.receiver_scores; scorer.server_scores; is_expected.to eql '12-11' }
    it { scorer.receiver_scores; 2.times { scorer.server_scores }; is_expected.to eql 'server game' }
  end
end
