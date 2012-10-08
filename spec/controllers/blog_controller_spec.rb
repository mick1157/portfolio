require 'spec_helper'

describe BlogController do

  def valid_attributes
    {:title => "Test", :content => "lorem ipsum"}
  end

  # GET /blog -> BlogController#index
  describe "GET to index" do

    let!(:post) { Post.create(valid_attributes) }
    before { get :index }

    it "should assign entry to entries" do
      assigns(:posts).should == ([post])
    end

  end

  # GET /blog/:id -> BlogController#show
  describe "GET to show" do

    let!(:post) { Post.create(valid_attributes) }

    before { get :show, :id => post.id }

    it "should assign entry to entry" do
      assigns(:post).should == post
    end

  end

  describe "GET to edit" do

    let(:post) { Post.create(valid_attributes) }

    before do
      get :edit, :id => post.id
    end

    it "should assign entry to entry" do
      assigns(:post).should == post
    end

  end

end
