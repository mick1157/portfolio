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

  describe 'PUT to update' do

    let!(:post) { create(:post) }
    before { put :update, id: post.id, post: {title: 'Test 123',
                                                  content: 'Test for update'}}

    it { should redirect_to blog_path}

    it "should have a new title" do
      assigns(:post).title.should == "Test 123"
    end

    it "should have a new content" do
      assigns(:post).content.should == "Test Update Content"
    end

  end


  # GET /blog/new   -> BlogController#new
  describe "GET to new" do
    before { get :new }
    it "should assign a new post" do
      assigns(:post).new_record? == true
    end
  end


  # GET /blog/new   -> BlogController#create
  describe "GET to create" do
    before { get :create, post: {title: 'Test Post',
                                  content: 'Test Post'} }
    it "should create a new post with title" do
      assigns(:post).new_record? == true
    end
  end



end
