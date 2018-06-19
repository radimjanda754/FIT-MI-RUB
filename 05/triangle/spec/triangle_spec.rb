#!/bin/ruby
# -*- encoding : utf-8 -*-
require_relative 'spec_helper'
require_relative '../triangle'

describe 'Triangle' do
  context 'check equilateral triangles' do
    it 'all sides equal' do
      expect(triangle(1,1,1)).to eq :equilateral
    end

    it 'all sides equal' do
      expect(triangle(10,10,10)).to eq :equilateral
    end

    it 'all sides equal' do
      expect(triangle(11,11,11)).to eq :equilateral
    end
  end

  context 'check isosceles trianges' do
    it 'two sides equal' do
      expect(triangle(1,5,1)).to eq :isosceles
    end

    it 'two sides equal' do
      expect(triangle(10,10,18)).to eq :isosceles
    end

    it 'two sides equal' do
      expect(triangle(9,11,11)).to eq :isosceles
    end
  end

  context 'check scalene triangles' do
    it 'no equal sides' do
      expect(triangle(1,2,3)).to eq :scalene
    end

    it 'no equal sides' do
      expect(triangle(8,10,9)).to eq :scalene
    end

    it 'no equal sides' do
      expect(triangle(11,10,20)).to eq :scalene
    end
  end
end